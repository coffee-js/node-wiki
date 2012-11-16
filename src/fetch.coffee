
define (require, exports) ->

  show = require('./tool').show
  delay = (t, f) -> setTimeout f, t

  wrap = (name) -> "../docs/#{name}.docs"

  render = (data) ->
    lines = data.split '\n'
    lines = lines.map (line) ->
      line
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/\s/g, '&nbsp;')
        .replace(/(https?:\S+)/g, '<a href="$1">$1</a>')
    text = lines.join '<br>'
    $('#byobu').insertAdjacentHTML 'beforeend', "<div class='card'>#{text}</div>"
    # $('#byobu>.card:last-child').onclick = (event) ->

  exports.load = (name, cb) ->
    if name? and name.length? and (name.length > 0)
      req = new XMLHttpRequest
      req.open 'get', (wrap name)
      req.send()
      req.onload = (data) ->
        data = data.target.response
        render data
        w = $('#byobu').clientWidth
        # w = Number w.match(/\d+/)[0]
        width = w + 700
        $('#byobu').style.width = "#{width}px"
        (delay 0, cb) if cb?
      # $('#byobu>.card:first-child').click()

  return