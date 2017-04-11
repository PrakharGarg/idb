require('whatwg-fetch'); 

var foo = React.createClass({
	render: function() {
    
    fetch('http://pursuitofhoppyness.me/api/beers')  
    .then(function(response) {
      
    });
	}
});

ReactDOM.render(React.createElement(foo,null),document.getElementById('app'));
	