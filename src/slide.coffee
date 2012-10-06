
define (require, exports) ->

  $ = require 'jquery'
  b = $ 'body'

  slide_left = ->
    b.animate scrollLeft: (b.scrollLeft() - 700), 200
  slide_right = ->
    b.animate scrollLeft: (b.scrollLeft() + 700), 200

  $('#slide-left').click slide_left
  $('#slide-right').click slide_right

  $('body').keydown (e) ->
    if e.keyCode is 37
      do slide_left
      e.preventDefault()
    else if e.keyCode is 39
      do slide_right
      e.preventDefault()

  return