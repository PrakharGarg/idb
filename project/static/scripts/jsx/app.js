var axios = require('axios');

var Beers = React.createClass({

	getInitialState: function() {
		return {
			beers: []
		};
	},

	componentDidMount: function() {
	    var _this = this;
	    this.serverRequest =
		    axios.request({
		      	method: 'get',
		      	url: 'http://pursuitofhoppyness.me/api/beers',
		      	headers: {'Access-Control-Allow-Origin': '*'}
		    })
	        .then(function(result) {    
	          _this.setState({
	            beers: result
	          });
	        })
	  },

	render: function() {
		var items = this.state.beers.map(function(item) {
	      return (
	        <li>hello</li>
	      );
	    });

		return (
			<div>
				<ul>
					{items}
				</ul>
			</div>
		)
	}
});

var Beer = React.createClass({
	render: function() {
		return (
			<div>
				goo!
			</div>
		)
	}
});

ReactDOM.render(<Beers/>, document.getElementById('beers'));