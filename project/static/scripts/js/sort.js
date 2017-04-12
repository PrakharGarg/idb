(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var App = React.createClass({displayName: "App",
  render: function() {
    return (
      React.createElement("div", {className: "col-md-3"}, 
        React.createElement("div", {className: "list-group"}, 
          React.createElement("div", {className: "dropdown"}, 
            React.createElement("button", {className: " list-group-item btn btn-default dropdown-toggle", type: "button", "data-toggle": "dropdown"}, "Sort By", 
              React.createElement("span", {className: "caret"})), 
              React.createElement("ul", {className: "dropdown-menu"}, 
                React.createElement("li", null, React.createElement("a", {href: "#"}, "Name")), 
                React.createElement("li", null, React.createElement("a", {href: "#"}, "Type")), 
                React.createElement("li", null, React.createElement("a", {href: "#"}, "Rating"))
              )
            ), 
            React.createElement("button", {type: "button", className: "btn btn-default ascdesc", "aria-label": "Left Align"}, 
              React.createElement("a", {href: "#", className: "glyphicon glyphicon-arrow-up", "aria-hidden": "true"})
            ), 
            React.createElement("button", {type: "button", className: "btn btn-default ascdesc", "aria-label": "Left Align"}, 
              React.createElement("a", {href: "#", className: "glyphicon glyphicon-arrow-down", "aria-hidden": "true"})
            ), 
            React.createElement("div", {className: "dropdown"}, 
              React.createElement("button", {className: " list-group-item btn btn-default dropdown-toggle", type: "button", "data-toggle": "dropdown"}, "Type", 
                React.createElement("span", {className: "caret"})), 
                React.createElement("ul", {className: "dropdown-menu"}, 
                  React.createElement("li", {className: "boxes"}, React.createElement("input", {type: "checkbox", id: "stout"}), " ", React.createElement("label", {htmlFor: "stout"}, " Stout"), React.createElement("br", null)), 
                  React.createElement("li", {className: "boxes"}, React.createElement("input", {type: "checkbox", id: "ipa"}), " ", React.createElement("label", {htmlFor: "ipa"}, " IPA"), React.createElement("br", null)), 
                  React.createElement("li", {className: "boxes"}, React.createElement("input", {type: "checkbox", id: "sour"}), " ", React.createElement("label", {htmlFor: "sour"}, " Sour"), React.createElement("br", null))
                )
              ), 
              React.createElement("div", {className: "dropdown"}, 
                React.createElement("button", {className: " list-group-item btn btn-default dropdown-toggle", type: "button", "data-toggle": "dropdown"}, "Rating", 
                  React.createElement("span", {className: "caret"})), 
                  React.createElement("ul", {className: "dropdown-menu"}, 
                    React.createElement("li", {className: "boxes"}, React.createElement("input", {type: "checkbox", id: "2"}), " ", React.createElement("label", {htmlFor: "2"}, " 2+"), React.createElement("br", null)), 
                    React.createElement("li", {className: "boxes"}, React.createElement("input", {type: "checkbox", id: "3"}), " ", React.createElement("label", {htmlFor: "3"}, " 3+"), React.createElement("br", null)), 
                    React.createElement("li", {className: "boxes"}, React.createElement("input", {type: "checkbox", id: "4"}), " ", React.createElement("label", {htmlFor: "4"}, " 4+"), React.createElement("br", null))
                  )
                )
              )
            )
    )
  }
});

ReactDOM.render(React.createElement(App, null),document.getElementById('sort'));

},{}]},{},[1]);
