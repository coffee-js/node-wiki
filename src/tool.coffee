
define (require, exports) ->

  exports.show = (args...) -> console.log.apply console, args

  return