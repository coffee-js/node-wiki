
define (require, exports) ->

  window.$ = (str) -> document.querySelector str

  byobu = $ '#byobu'

  show = require('./tool').show

  load = require('./fetch').load
  list = require('./describe').list
  show list

  require './slide'

  win =
    w: document.width
    h: document.height

  byobu.style.width = 0
  byobu.style.paddingRight = win.w - 700
  # byobu.css padding: "0px 500px 0px 200px"

  do render = ->
    load list.shift(), render
    show 'width', byobu.style.width, list

  return