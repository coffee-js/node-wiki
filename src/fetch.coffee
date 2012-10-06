
define (require, exports) ->

  $ = require 'jquery'
  show = require('./tool.coffee').show
  delay = (t, f) -> setTimeout f, t

  wrap = (name) -> "../docs/#{name}"

  render = (data) ->
    lines = data.split '\n'
    lines = lines.map (line) ->
      line
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/\s/g, '&nbsp;')
        .replace(/(https?:\S+)/g, '<a href="$1">$1</a>')
    text = lines.join '<br>'

    $('#byobu').append "<div class='card'>#{text}</div>"

  exports.load = (name, cb) ->
    if name? and name.length? and (name.length > 0)
      $.get (wrap name), (data) ->
        render data
        width = $('#byobu').innerWidth() + 700
        show width
        $('#byobu').width width
        (delay 0, cb) if cb?

  return