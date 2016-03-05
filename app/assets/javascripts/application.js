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

var showOrHideMenu = function() {
  var menuButton = document.getElementById('menu-button-a');
  var menuList = document.getElementById('menu-list');
  switch (menuButton.className) {
    case 'unactive': menuButton.className = 'active'; menuList.className = 'opened'; break;
    case 'active': menuButton.className = 'unactive'; menuList.className = 'closed'; break;
    default: console.log('undefined');
  }
}

window.onload = function() {
  var pathname = window.location.pathname.replace(/\//g, '');
  switch (pathname) {
    case "":
    case "events": 
      document.getElementById("menu-context").innerHTML = "HOJE";
      // document.getElementById("nav-a-events").className += " active";
      break;
    case "eventssearch":
      // document.getElementById("nav-a-search").className += " active";
      break;
    case "eventscolaborate":
      document.getElementById('menu-back').className = 'visible';
      // document.getElementById("menu-context").innerHTML = "COLABORAR";
      // document.getElementById("nav-a-colaborate").className += " active";
      break;
    default:
      document.getElementById('menu-back').className = 'visible';
      // document.getElementById("menu-context").innerHTML = "DETALHE";
  }
}