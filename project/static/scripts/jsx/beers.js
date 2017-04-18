var axios = require('axios');

class ProductCategoryRow extends React.Component {
  render() {
    return (<tr><th colSpan="2">{this.props.category}</th></tr>);
  }
}

class ProductRow extends React.Component {
  render() {
    var name = this.props.product.id ?
      this.props.product.name :
      <span style={{color: 'red'}}>
        {this.props.product.name}
      </span>;
    return (
      <tr>
        <td>{name}</td>
        <td>{this.props.product.id}</td>
      </tr>
    );
  }
}

class ProductTable extends React.Component {
  render() {
    var rows = [];
    var lastCategory = null;
    console.log(this.props.inStockOnly);
    this.props.products.forEach((product) => {
      if (product.name.indexOf(this.props.filterText) === -1 || (!product.id && this.props.inStockOnly)) {
        return;
      }
      if (product.category !== lastCategory) {
        rows.push(<ProductCategoryRow category={product.category} key={product.category} />);
      }
      rows.push(<ProductRow product={product} key={product.name} />);
      lastCategory = product.category;
    });
    return (
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>{rows}</tbody>
      </table>
    );
  }
}


class SearchBar extends React.Component {
  constructor(props) {
    super(props);
    this.handleFilterTextInputChange = this.handleFilterTextInputChange.bind(this);
    this.handleInStockInputChange = this.handleInStockInputChange.bind(this);
  }
  
  handleFilterTextInputChange(e) {
    this.props.onFilterTextInput(e.target.value);
  }
  
  handleInStockInputChange(e) {
    this.props.onInStockInput(e.target.checked);
  }
  
  render() {
    return (
      <form>
        <input
          type="text"
          placeholder="Search..."
          value={this.props.filterText}
          onChange={this.handleFilterTextInputChange}
        />
        <p>
          <input
            type="checkbox"
            checked={this.props.inStockOnly}
            onChange={this.handleInStockInputChange}
          />
          {' '}
          Only show products in stock
        </p>
      </form>
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
    this.props.onSortChange(e);
  }

  handleOrderAscend(e) {
    this.props.onOrderChange(true);
  }

  handleOrderDescend(e) {
    this.props.onOrderChange(false);
  }

  handleTypeChange(e) {
    this.props.onTypeChange(e);
  }

  handleRatingChange(e) {
    this.props.onRatingChange(e);
  }

  render() {
    return (
      <div>

        <div className="dropdown">
          <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Sort By
            <span className="caret"></span></button>
            <ul className="dropdown-menu">
              <li><a href="#">Name</a></li>
              <li><a href="#">Type</a></li>
              <li><a href="#">Rating</a></li>
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
            <ul className="dropdown-menu">
              <li class = "boxes" ><input type="checkbox"/> Stout <br /></li>
              <li class = "boxes" ><input type="checkbox"/> IPA <br /></li>
              <li class = "boxes" ><input type="checkbox"/> Sour <br /></li>
            </ul>
        </div>

        <div className="dropdown">
          <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Rating
            <span className="caret"></span></button>
            <ul className="dropdown-menu">
              <li class = "boxes" ><input type="checkbox"/> 2+ <br /></li>
              <li class = "boxes" ><input type="checkbox"/> 3+ <br /></li>
              <li class = "boxes" ><input type="checkbox"/> 4+</li>
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
      filterText: '',
      inStockOnly: false,
      beers: new Array(),
      all_states: ['TX','AL','CA'],
      filtering_states: new Array(),

      ascending: true,
      ratings: new Array(),
      types: new Array()
    };
    
    this.handleFilterTextInput = this.handleFilterTextInput.bind(this);
    this.handleInStockInput = this.handleInStockInput.bind(this);

    this.handleSortInput = this.handleSortInput.bind(this);
    this.handleOrderInput = this.handleOrderInput.bind(this);
    this.handleTypeInput = this.handleTypeInput.bind(this);
    this.handleRatingInput = this.handleRatingInput.bind(this);
  }

  handleSortInput(e) {
    console.log(e);
  }

  handleOrderInput(ascend) {
    this.setState({
      ascending: ascend
    });
  }

  handleTypeInput(e) {
    console.log(e);
  }

  handleRatingInput(e) {
    console.log(e);
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

  handleFilterTextInput(filterText) {
    this.setState({
      filterText: filterText
    });
  }
  
  handleInStockInput(inStockOnly) {
    this.setState({
      inStockOnly: inStockOnly
    })
  }

  render() {
    return (
      <div>
        <SearchBar
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}
          onFilterTextInput={this.handleFilterTextInput}
          onInStockInput={this.handleInStockInput}
        />
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
        />
      </div>
    );
  }
}

ReactDOM.render(<FilterableProductTable/>,document.getElementById('beers'));
	