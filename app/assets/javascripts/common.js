$(document).ready(function() {
  if (window.location.hash && window.location.hash === "#_=_") {
    if (window.history && history.replaceState) {
      window.history.replaceState("", document.title, window.location.pathname);
    } else {
      var scroll = {
        top: document.body.scrollTop,
        left: document.body.scrollLeft
      };
      window.location.hash = "";
      document.body.scrollTop = scroll.top;
      document.body.scrollLeft = scroll.left;
    }
  }
});
