(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
// import 'whatwg-fetch'; 

var foo = React.createClass({displayName: "foo",
	render: function() {
		return (
			
			React.createElement("div", {className: "col-md-3 col-sm-6 hero-feature text-center"}, 
			
							React.createElement("div", {className: "thumbnail"}, 
								React.createElement("img", {src: "#", width: "150", alt: ""}), 
								React.createElement("div", {className: "caption"}, 
									React.createElement("h3", null, "name"), 
									React.createElement("p", null, 
										"style ", React.createElement("br", null), 
										"ABV: abv ", React.createElement("br", null), 
										"Rating: rating/5.0 ", React.createElement("br", null)
									), 
									React.createElement("p", null, 
										React.createElement("a", {href: "#", className: "btn btn-primary"}, "More Info")
									)
								)
							)
						)
		);
	}
});

ReactDOM.render(React.createElement(foo,null),document.getElementById('app'));

},{}]},{},[1]);
