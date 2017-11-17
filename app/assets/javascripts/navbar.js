
window.onscroll = function() {myFunction()};

function myFunction() {
  lowerText();
  if (document.documentElement.scrollTop > 30) {
    document.getElementById("icon-1").className = "slideUp";
    document.getElementById("icon-2").className = "slideUp";
    document.getElementById("icon-3").className = "slideUp";
    document.getElementById("header").className = "slideUp";
  } else {
    document.getElementById("icon-1").className = 'hidden';
    document.getElementById("icon-2").className = 'hidden';
    document.getElementById("icon-3").className = 'hidden';
    document.getElementById("header").className = 'hidden';
  };
}

function lowerText() {
  if (document.documentElement.scrollTop > 460) {
    document.getElementById("resto-content").className = "slideUp";
  } else {
    document.getElementById("resto-content").className = 'hidden';
  }
}
