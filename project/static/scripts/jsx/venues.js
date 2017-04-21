var axios = require('axios');
var _ = require('lodash');

class Venue extends React.Component {
  render () {
    return (
      <div className="col-md-3 col-sm-6 hero-feature text-center">
        <div className="thumbnail">
          <img className = "venueimg" src={"" + this.props.venue.media} width = "150" alt=""/>
          <div className="caption">
            <h3>{this.props.venue.name}</h3>
            <p>
              Category: {this.props.venue.category} <br />
              Address: {this.props.venue.address} <br />
              Public: {this.props.venue.is_public} <br />
            </p>
            <p>
              <a href={"/venues/" + this.props.venue.id + "/"} className="btn btn-primary">More Info</a>
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
      {this.props.page > 1 && <li><a id = "back" href="#">{this.props.page - 1}</a></li>}
      <li><a id = "current" href="#">Current Page: {this.props.page}</a></li>
      {this.props.page < 4 && <li><a id = "next" href="#">{this.props.page + 1}</a></li>}
      </ul>
      </div>
    );
  }
}
class ProductTable extends React.Component {
  render() {
    var rows = [];

    var filteredProducts = _.filter(this.props.products, (venue) => {
      var type_matches = _.map(this.props.categories, (category) => {
        console.log(category + "  : " + venue.category);
        return _.contains(venue.category.toLowerCase(), category);
      });
      var any_match = _.reduce(type_matches, (a,b) => {
        return a || b;
      }, false);
      var type_matches = _.isEmpty(this.props.categories) || any_match;
      
      return type_matches;
    });

    var sortedProducts = _.sortBy(filteredProducts, this.props.sortBy);
    if (!this.props.ascend) {
      sortedProducts.reverse();
    }

    sortedProducts.forEach((venue) => {
      rows.push(
        <Venue venue={venue}/>
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
                <li><a href="#" id='category'>Category</a></li>
              </ul>
          </div>

          <button type="button" className="btn btn-default ascdesc" aria-label="Left Align" onClick={this.handleOrderAscend}>
            <a href = "#" className="glyphicon glyphicon-arrow-up" aria-hidden="true"></a>
          </button>

          <button type="button" className="btn btn-default ascdesc" aria-label="Left Align" onClick={this.handleOrderDescend}>
            <a href = "#" className="glyphicon glyphicon-arrow-down" aria-hidden="true"></a>
          </button>
          <div className="dropdown">
            <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Category
              <span className="caret"></span></button>
              <ul className="dropdown-menu" onClick={this.handleTypeChange}>
                <li className= "boxes" ><input id="bar" type="checkbox"/> Bar <br /></li>
                <li className= "boxes" ><input id="restaurant" type="checkbox"/> Restaurant <br /></li>
                <li className= "boxes" ><input id="brewery" type="checkbox"/> Brewery <br /></li>
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
      venues: new Array(),
      sortBy: 'name',
      ascend: true,
      categories: new Array(),
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
      if(this.state.page == 4){
        updatePage = 4
      }
      else{
        var updatePage = this.state.page += 1
      }
      
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

  handleTypeInput(category) {
    var newTypes = _.clone(this.state.categories);
    if (_.contains(this.state.categories, category)) {
      newTypes = _.filter(newTypes, (elem) => {
        return elem !== category;
      });
    }
    else {
      newTypes.push(category);
    }
    this.setState({
      categories: newTypes
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
      .get("/api/venues/" + this.state.page)
      .then(function(result) {
        console.log(result);   
        _this.setState({
          venues: result.data.result
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
          products={this.state.venues}
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}

          categories={this.state.categories}
          sortBy={this.state.sortBy}
          ascend={this.state.ascend}
          page={this.state.page}
        />
      </div>
    );
  }
}

ReactDOM.render(<FilterableProductTable/>,document.getElementById('venues'));
  