require('whatwg-fetch'); 

var axios = require('axios');

var App = React.createClass({

  getInitialState: function() {
    return {
      states: []
    }
  },

  componentDidMount: function() {
    var _this = this;
    this.serverRequest = 
      axios
        .get("/api/states")
        .then(function(result) {    
          _this.setState({
            states: result.data.result
          });
        })
  },

  componentWillUnmount: function() {
    this.serverRequest.abort();
  },

  render: function() {
    return (
      <div>
          {this.state.states.map(function(state) {
            return (
              <div className="col-md-3 col-sm-6 hero-feature text-center">
							<div className="thumbnail">
								<img src={"" + state.media} width = "150" alt=""/>
								<div className="caption">
									<h3>{state.name}</h3>
									<p>
										{state.capital} <br/>
										{state.flower}
									</p>
									<p>
										<a href={"/states/" + state.id + "/"} className="btn btn-primary">More Info</a>
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

ReactDOM.render(<App/>,document.getElementById('states'));
	