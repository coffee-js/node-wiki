
define (require, exports) ->

  window.$ = require 'jquery'

  byobu = $ '#byobu'

  show = require('./tool.coffee').show

  load = require('./fetch.coffee').load
  list = require('../docs/describe.coffee').list
  show list

  require './slide.coffee'

  win =
    w: $(window).width()
    h: $(window).height()

  byobu.width 0
  byobu.css 'padding-right': (win.w - 700)
  # byobu.css padding: "0px 500px 0px 200px"

  do render = ->
    load list.shift(), render
    show 'width', byobu.width(), list

  return