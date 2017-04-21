var axios = require('axios');
var _ = require('lodash');

class Brewery extends React.Component {
  render () {
    var year = Math.floor(2017 - this.props.brewery.founded/365);
    return (
      <div className="col-md-3 col-sm-6 hero-feature text-center">
        <div className="thumbnail">
          <img src={"" + this.props.brewery.label} width = "150" alt=""/>
          <div className="caption">
            <h3>{this.props.brewery.name}</h3>
            <p>
              Brewery_Type: {this.props.brewery.brewery_type} <br />
              Address: {this.props.brewery.address} <br />
              Founded: {year} <br />
            </p>
            <p>
              <a href={"/breweries/" + this.props.brewery.id + "/"} className="btn btn-primary">More Info</a>
            </p>
          </div>
        </div>
      </div>
    )
  }
}
class Pagein extends React.Component {
  constructor(props) {
    super(props);
    this.handlePageByChange = this.handlePageByChange.bind(this);
  }

  handlePageByChange(e) {
    this.props.onPageChange(e.target.id);
  }


  render() {
    return (
      <div >
      <ul className="pagination page" onClick={this.handlePageByChange} >
      <li><a id = "back" href="#">{this.props.page - 1}</a></li>
      <li><a id = "current" href="#">Current Page: {this.props.page}</a></li>
      <li><a id = "next" href="#">{this.props.page + 1}</a></li>
      </ul>
      </div>
    );
  }
}

class ProductTable extends React.Component {
  render() {
    var rows = [];

    var filteredProducts = _.filter(this.props.products, (brewery) => {
      var type_matches = _.map(this.props.brewery_types, (brewery_type) => {
        console.log(brewery_type + "  : " + brewery.brewery_type);
        return _.contains(brewery.brewery_type.toLowerCase(), brewery_type);
      });
      var any_match = _.reduce(type_matches, (a,b) => {
        return a || b;
      }, false);
      var type_matches = _.isEmpty(this.props.brewery_types) || any_match;
      
      return type_matches;
    });

    var sortedProducts = _.sortBy(filteredProducts, this.props.sortBy);
    if (!this.props.ascend) {
      sortedProducts.reverse();
    }

    sortedProducts.forEach((brewery) => {
      rows.push(
        <Brewery brewery={brewery}/>
      );
    });

    return (
      <div>{rows}</div>
    );
  }
}

class FilterBar extends React.Component {
  constructor(props) {
    super(props);
    this.handleSortByChange = this.handleSortByChange.bind(this);
    this.handleOrderAscend = this.handleOrderAscend.bind(this);
    this.handleOrderDescend = this.handleOrderDescend.bind(this);
    this.handleTypeChange = this.handleTypeChange.bind(this);

  }

  handleSortByChange(e) {
    this.props.onSortChange(e.target.id);
  }

  handleOrderAscend(e) {
    this.props.onOrderChange(true);
  }

  handleOrderDescend(e) {
    this.props.onOrderChange(false);
  }
  handleTypeChange(e) {
    this.props.onTypeChange(e.target.id);
  }
  

  render() {
    return (
      <div className="col-md-3">
        <div className="list-group">
          <div className="dropdown">
            <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Sort By
              <span className="caret"></span></button>
              <ul className="dropdown-menu" onClick={this.handleSortByChange}>
                <li><a href="#" id="name">Name</a></li>
                <li><a href="#" id='brewery_type'>Brewery Type</a></li>
              </ul>
          </div>

          <button type="button" className="btn btn-default ascdesc" aria-label="Left Align" onClick={this.handleOrderAscend}>
            <a href = "#" className="glyphicon glyphicon-arrow-up" aria-hidden="true"></a>
          </button>

          <button type="button" className="btn btn-default ascdesc" aria-label="Left Align" onClick={this.handleOrderDescend}>
            <a href = "#" className="glyphicon glyphicon-arrow-down" aria-hidden="true"></a>
          </button>
          <div className="dropdown">
            <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Brewery Type
              <span className="caret"></span></button>
              <ul className="dropdown-menu" onClick={this.handleTypeChange}>
                <li className= "boxes" ><input id="micro brewery" type="checkbox"/> Micro Brewery <br /></li>
                <li className= "boxes" ><input id="restaurant" type="checkbox"/> Restaurant <br /></li>
                <li className= "boxes" ><input id="bar" type="checkbox"/> Bar <br /></li>
              </ul>
          </div>
          

          
        </div>
      </div>
    )
  }

}

class FilterableProductTable extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      breweries: new Array(),
      sortBy: 'name',
      ascend: true,
      brewery_types: new Array(),
      page: 1

    };
    
    this.handleSortInput = this.handleSortInput.bind(this);
    this.handleOrderInput = this.handleOrderInput.bind(this);
    this.handleTypeInput = this.handleTypeInput.bind(this);
    this.handlePageInput = this.handlePageInput.bind(this);


  }

  handleSortInput(sort_by) {
    console.log(sort_by);
    this.setState({
      sortBy: sort_by
    });
  }
  
  handlePageInput(newPage) {
    console.log(newPage)
    if (newPage == "next") {
      var updatePage = this.state.page += 1
    }
    else if (newPage == "back") {
      var updatePage = this.state.page -= 1
      if (updatePage < 1) {
        updatePage = 1
      }
    }
    else {
      updatePage = this.state.page
    }
    this.setState({
      page: updatePage
  },
  function() {
      this.componentDidMount();
  }
  );
}

  handleTypeInput(brewery_type) {
    var newTypes = _.clone(this.state.brewery_types);
    if (_.contains(this.state.brewery_types, brewery_type)) {
      newTypes = _.filter(newTypes, (elem) => {
        return elem !== brewery_type;
      });
    }
    else {
      newTypes.push(brewery_type);
    }
    this.setState({
      brewery_types: newTypes
    });
    console.log(newTypes);
  }

  handleOrderInput(ascend) {
    console.log(ascend);
    this.setState({
      ascend: ascend
    });
  }

  

  componentDidMount() {
    var _this = this;
    this.serverRequest = axios
      .get("/api/breweries/" + this.state.page)
      .then(function(result) {
        console.log(result);   
        _this.setState({
          breweries: result.data.result
        });
      })
  }

  componentWillUnmount() {
    this.serverRequest.abort();
  }

  render() {
    return (
      <div className="grid row">
      <Pagein
      onPageChange={this.handlePageInput}
      page={this.state.page}
      />
        <FilterBar
          onSortChange={this.handleSortInput}
          onOrderChange={this.handleOrderInput}
          onTypeChange={this.handleTypeInput}
          
        />
        <ProductTable
          products={this.state.breweries}
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}

          brewery_types={this.state.brewery_types}
          sortBy={this.state.sortBy}
          ascend={this.state.ascend}
          page={this.state.page}

        />
      </div>
    );
  }
}

ReactDOM.render(<FilterableProductTable/>,document.getElementById('breweries'));
  