var App = React.createClass({
  render: function() {
    return (
      <div className="col-md-3">
        <div className="list-group">
          <div className="dropdown">
            <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Sort By
              <span className="caret"></span></button>
              <ul className="dropdown-menu">
                <li><a href="#">Name</a></li>
                <li><a href="#">Type</a></li>
                <li><a href="#">Rating</a></li>
              </ul>
            </div>
            <button type="button" className="btn btn-default ascdesc" aria-label="Left Align">
              <a href = "#" className="glyphicon glyphicon-arrow-up" aria-hidden="true"></a>
            </button>
            <button type="button" className="btn btn-default ascdesc" aria-label="Left Align">
              <a href = "#" className="glyphicon glyphicon-arrow-down" aria-hidden="true"></a>
            </button>
            <div className="dropdown">
              <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Type
                <span className="caret"></span></button>
                <ul className="dropdown-menu">
                  <li className = "boxes" ><input type="checkbox" id = "stout"/> <label htmlFor="stout"> Stout</label><br /></li>
                  <li className = "boxes" ><input type="checkbox" id = "ipa"/> <label htmlFor="ipa"> IPA</label><br /></li>
                  <li className = "boxes" ><input type="checkbox" id = "sour"/> <label htmlFor="sour"> Sour</label><br /></li>
                </ul>
              </div>
              <div className="dropdown">
                <button className=" list-group-item btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Rating
                  <span className="caret"></span></button>
                  <ul className="dropdown-menu">
                    <li className = "boxes" ><input type="checkbox" id = "2"/> <label htmlFor="2"> 2+</label><br /></li>
                    <li className = "boxes" ><input type="checkbox" id = "3"/> <label htmlFor="3"> 3+</label><br /></li>
                    <li className = "boxes" ><input type="checkbox" id = "4"/> <label htmlFor="4"> 4+</label><br /></li>
                  </ul>
                </div>
              </div>
            </div>
    )
  }
});

ReactDOM.render(<App/>,document.getElementById('sort'));
	