require('whatwg-fetch'); 

var axios = require('axios');

var App = React.createClass({

  getInitialState: function() {
    return {
      breweries: []
    }
  },

  componentDidMount: function() {
    var _this = this;
    this.serverRequest = 
      axios
        .get("/api/breweries")
        .then(function(result) {    
          _this.setState({
            breweries: result.data.result
          });
        })
  },

  componentWillUnmount: function() {
    this.serverRequest.abort();
  },

  render: function() {
    return (
      <div>
          {this.state.breweries.map(function(brewery) {
            return (
              <div className="col-md-3 col-sm-6 hero-feature text-center">
							<div className="thumbnail">
								<img src={"" + brewery.label} width = "150" alt=""/>
								<div className="caption">
									<h3>{brewery.name}</h3>
									<p>
										{2017 - Math.floor(brewery.founded/365)} <br/>
										{brewery.address}
									</p>
									<p>
										<a href={"/breweries/" + brewery.id + "/"} className="btn btn-primary">More Info</a>
									</p>
								</div>
							</div>
						</div>
            );
          })}
        </div>
    )
  }
});

ReactDOM.render(<App/>,document.getElementById('breweries'));
	