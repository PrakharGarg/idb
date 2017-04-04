$(document).ready(function(){
  // Get the modal
  var modal = document.getElementById('myModal');
  
  // Get the button that opens the modal
  var btn = document.getElementById("myBtn");
  
  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // When the user clicks on the button, open the modal 
  btn.onclick = function() {
    modal.style.display = "block";
    var text = document.getElementById('myText');

    $.ajax({
      type: "POST",
      url: "/test/",
      dataType: "html",

      success: function(response) {
          console.log(response);
          text.innerHTML = response;
      },
      error: function(response) {
          console.log(response);
      }
    });
  }
  
  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
    modal.style.display = "none";
  }
  
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  } 
})
