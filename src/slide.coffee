
define (require, exports) ->

  b = $ 'body'

  slide_left = ->
    b.scrollLeft = (b.scrollLeft - 700)
  slide_right = ->
    b.scrollLeft = (b.scrollLeft + 700)

  $('#slide-left').onclick = slide_left
  $('#slide-right').onclick = slide_right

  $('body').onkeydown = (e) ->
    console.log e
    if e.keyCode is 37
      do slide_left
      e.cancelBubble = yes
    else if e.keyCode is 39
      do slide_right
      e.cancelBubble = yes
    false

  return