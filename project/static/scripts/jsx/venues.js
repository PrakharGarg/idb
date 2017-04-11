require('whatwg-fetch'); 

var axios = require('axios');

var App = React.createClass({

  getInitialState: function() {
    return {
      venues: []
    }
  },

  componentDidMount: function() {
    var _this = this;
    this.serverRequest = 
      axios
        .get("http://pursuitofhoppyness.me/api/venues")
        .then(function(result) {    
          _this.setState({
            venues: result.data.result
          });
        })
  },

  componentWillUnmount: function() {
    this.serverRequest.abort();
  },

  render: function() {
    return (
      <div>
          {this.state.venues.map(function(venue) {
            return (
              <div className="col-md-3 col-sm-6 hero-feature text-center">
							<div className="thumbnail">
								<img src={"" + venue.label} width = "150" alt=""/>
								<div className="caption">
									<h3>{venue.name}</h3>
									<p>
										{venue.type} <br/>
										{venue.is_public} <br />
                    {venue.address}
									</p>
									<p>
										<a href={"/venues/" + venue.id + "/"} className="btn btn-primary">More Info</a>
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

ReactDOM.render(<App/>,document.getElementById('venues'));
	