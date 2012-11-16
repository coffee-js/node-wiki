// Generated by CoffeeScript 1.4.0
(function() {

  define(function(require, exports) {
    var b, slide_left, slide_right;
    b = $('body');
    slide_left = function() {
      return b.scrollLeft = b.scrollLeft - 700;
    };
    slide_right = function() {
      return b.scrollLeft = b.scrollLeft + 700;
    };
    $('#slide-left').onclick = slide_left;
    $('#slide-right').onclick = slide_right;
    $('body').onkeydown = function(e) {
      console.log(e);
      if (e.keyCode === 37) {
        slide_left();
        e.cancelBubble = true;
      } else if (e.keyCode === 39) {
        slide_right();
        e.cancelBubble = true;
      }
      return false;
    };
  });

}).call(this);
