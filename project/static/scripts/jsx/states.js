var axios = require('axios');
var _ = require('lodash');

class State extends React.Component {
  render () {
    return (
      <div className="col-md-3 col-sm-6 hero-feature text-center">
        <div className="thumbnail">
          <img src={"" + this.props.state.media} width = "150" alt=""/>
          <div className="caption">
            <h3>{this.props.state.name}</h3>
            <p>
              Capital: {this.props.state.capital} <br />
              Abbreviation: {this.props.state.abbreviation} <br />
              State Flower: {this.props.state.flower} <br />
            </p>
            <p>
              <a href={"/states/" + this.props.state.id + "/"} className="btn btn-primary">More Info</a>
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

    var filteredProducts = _.filter(this.props.products, (state) => {
      return true;
    });

    var sortedProducts = _.sortBy(filteredProducts, this.props.sortBy);
    if (!this.props.ascend) {
      sortedProducts.reverse();
    }

    sortedProducts.forEach((state) => {
      rows.push(
        <State state={state}/>
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

  

  render() {
    return (
      <div className="col-md-3">
        <div className="list-group">
          <div className="dropdown">
            <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Sort By
              <span className="caret"></span></button>
              <ul className="dropdown-menu" onClick={this.handleSortByChange}>
                <li><a href="#" id="name">Name</a></li>
              </ul>
          </div>

          <button type="button" className="btn btn-default ascdesc" aria-label="Left Align" onClick={this.handleOrderAscend}>
            <a href = "#" className="glyphicon glyphicon-arrow-up" aria-hidden="true"></a>
          </button>

          <button type="button" className="btn btn-default ascdesc" aria-label="Left Align" onClick={this.handleOrderDescend}>
            <a href = "#" className="glyphicon glyphicon-arrow-down" aria-hidden="true"></a>
          </button>

          

          
        </div>
      </div>
    )
  }

}

class FilterableProductTable extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      states: new Array(),
      sortBy: 'name',
      ascend: true,
    };
    
    this.handleSortInput = this.handleSortInput.bind(this);
    this.handleOrderInput = this.handleOrderInput.bind(this);
    
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

  

  componentDidMount() {
    var _this = this;
    this.serverRequest = axios
      .get("/api/states")
      .then(function(result) {
        console.log(result);   
        _this.setState({
          states: result.data.result
        });
      })
  }

  componentWillUnmount() {
    this.serverRequest.abort();
  }

  render() {
    return (
      <div className="grid row">
        <FilterBar
          onSortChange={this.handleSortInput}
          onOrderChange={this.handleOrderInput}
          
        />
        <ProductTable
          products={this.state.states}
          filterText={this.state.filterText}
          inStockOnly={this.state.inStockOnly}

          sortBy={this.state.sortBy}
          ascend={this.state.ascend}
        />
      </div>
    );
  }
}

ReactDOM.render(<FilterableProductTable/>,document.getElementById('states'));
  