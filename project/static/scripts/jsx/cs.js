require('whatwg-fetch'); 

var axios = require('axios');

var App = React.createClass({

  getInitialState: function() {
    return {
      beers: []
    }
  },

  componentDidMount: function() {
    var _this = this;
    this.serverRequest = 
      axios
        .get("http://pursuitofhoppyness.me/api/beers")
        .then(function(result) {    
          _this.setState({
            beers: result.data.result
          });
        })
  },

  componentWillUnmount: function() {
    this.serverRequest.abort();
  },

  render: function() {
    return (
      <div>
          <h1>Beers!</h1>
          {this.state.beers.map(function(beer) {
            return (
              <div className="col-md-3 col-sm-6 hero-feature text-center">
							<div className="thumbnail">
								<img src="{beer.label}" width = "150" alt=""/>
								<div className="caption">
									<h3>{beer.name}</h3>
									<p>
										{beer.style} <br/>
										ABV: {beer.abv} <br />
										Rating: {beer.rating}/5.0 
									</p>
									<p>
										<a href="/beers/{{beer.id}}/" className="btn btn-primary">More Info</a>
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

ReactDOM.render(<App/>,document.getElementById('app'));
	