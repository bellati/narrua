// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .

window.onload = function() {
  var pathname = window.location.pathname.replace(/\//g, '');
  switch (pathname) {
    case "":
    case "events": 
      document.getElementById("nav-a-events").className += " active";
      break;
    case "eventssearch":
      document.getElementById("nav-a-search").className += " active";
      break;
  }
  //alert(document.referrer);
  //window.history.back();
}