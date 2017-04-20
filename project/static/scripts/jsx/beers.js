var axios = require('axios');
var _ = require('lodash');

class Beer extends React.Component {
  render () {
    return (
      <div className="col-md-3 col-sm-6 hero-feature text-center">
        <div className="thumbnail">
          <img src={"" + this.props.beer.label} width = "150" alt=""/>
          <div className="caption">
            <h3>{this.props.beer.name}</h3>
            <p>
              {this.props.beer.style} <br/>
              ABV: {this.props.beer.abv} <br />
              Rating: {this.props.beer.rating}/5.0 
            </p>
            <p>
              <a href={"/beers/" + this.props.beer.id + "/"} className="btn btn-primary">More Info</a>
            </p>
          </div>
        </div>
      </div>
    )
  }
}

class ProductTable extends React.Component {
  render() {
    var rows = [];

    var filteredProducts = _.filter(this.props.products, (beer) => {
      var type_matches = _.map(this.props.types, (type) => {
        console.log(type + "  : " + beer.style);
        return _.contains(beer.style.toLowerCase(), type);
      });
      var any_match = _.reduce(type_matches, (a,b) => {
        return a || b;
      }, false);
      var type_matches = _.isEmpty(this.props.types) || any_match;
      var rating_matches = beer.rating >= this.props.lowRating;
      return type_matches && rating_matches;
    });

    var sortedProducts = _.sortBy(filteredProducts, this.props.sortBy);
    if (!this.props.ascend) {
      sortedProducts.reverse();
    }

    sortedProducts.forEach((beer) => {
      rows.push(
        <Beer beer={beer}/>
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
    this.handleRatingChange = this.handleRatingChange.bind(this);
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

  handleRatingChange(e) {
    this.props.onRatingChange(e.target.id);
  }

  render() {
    return (
      <div>
        <div className="dropdown">
          <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Sort By
            <span className="caret"></span></button>
            <ul className="dropdown-menu" onClick={this.handleSortByChange}>
              <li><a href="#" id="name">Name</a></li>
              <li><a href="#" id='type'>Type</a></li>
              <li><a href="#" id='rating'>Rating</a></li>
            </ul>
        </div>

        <button type="button" className="btn btn-default ascdesc" aria-label="Left Align" onClick={this.handleOrderAscend}>
          <a href = "#" className="glyphicon glyphicon-arrow-up" aria-hidden="true"></a>
        </button>

        <button type="button" className="btn btn-default ascdesc" aria-label="Left Align" onClick={this.handleOrderDescend}>
          <a href = "#" className="glyphicon glyphicon-arrow-down" aria-hidden="true"></a>
        </button>

        <div className="dropdown">
          <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Type
            <span className="caret"></span></button>
            <ul className="dropdown-menu" onClick={this.handleTypeChange}>
              <li className= "boxes" ><input id="stout" type="checkbox"/> Stout <br /></li>
              <li className= "boxes" ><input id="ipa" type="checkbox"/> IPA <br /></li>
              <li className= "boxes" ><input id="sour" type="checkbox"/> Sour <br /></li>
            </ul>
        </div>

        <div className="dropdown">
          <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Rating
            <span className="caret"></span></button>
            <ul className="dropdown-menu" onClick={this.handleRatingChange}>
              <li className= "boxes" ><input id="2" type="checkbox"/> 2+ <br /></li>
              <li className= "boxes" ><input id="3" type="checkbox"/> 3+ <br /></li>
              <li className= "boxes" ><input id="4" type="checkbox"/> 4+</li>
            </ul>
        </div>

      </div>
    )
  }

}

class FilterableProductTable extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      beers: new Array(),
      sortBy: 'name',
      ascend: true,
      lowRating: 0,
      types: new Array()
    };
    
    this.handleSortInput = this.handleSortInput.bind(this);
    this.handleOrderInput = this.handleOrderInput.bind(this);
    this.handleTypeInput = this.handleTypeInput.bind(this);
    this.handleRatingInput = this.handleRatingInput.bind(this);
  }

  handleSortInput(sort_by) {
    console.log(sort_by);
    this.setState({
      sortBy: sort_by
    });
  }

  handleOrderInput(ascend) {
    console.log(ascend);
    this.setState({
      ascend: ascend
    });
  }

  handleTypeInput(type) {
    var newTypes = _.clone(this.state.types);
    if (_.contains(this.state.types, type)) {
      newTypes = _.filter(newTypes, (elem) => {
        return elem !== type;
      });
    }
    else {
      newTypes.push(type);
    }
    this.setState({
      types: newTypes
    });
    console.log(newTypes);
  }

  handleRatingInput(newRating) {
    console.log(newRating);
    this.setState({
      lowRating: newRating
    });
  }

  componentDidMount() {
    var _this = this;
    this.serverRequest = axios
      .get("http://localhost:5000/api/beers")
      .then(function(result) {
        console.log(result);   
        _this.setState({
          beers: result.data.result
        });
      })
  }

  componentWillUnmount() {
    this.serverRequest.abort();
  }

  render() {
    return (
      <div>
        <FilterBar
          onSortChange={this.handleSortInput}
          onOrderChange={this.handleOrderInput}
          onTypeChange={this.handleTypeInput}
          onRatingChange={this.handleRatingInput}
        />
        <ProductTable
          products={this.state.beers}
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}

          sortBy={this.state.sortBy}
          types={this.state.types}
          ascend={this.state.ascend}
          lowRating={this.state.lowRating}
        />
      </div>
    );
  }
}

ReactDOM.render(<FilterableProductTable/>,document.getElementById('beers'));
	