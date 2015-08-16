path = require 'path'
transformTools = require 'browserify-transform-tools'

module.exports = transformTools.makeStringTransform "shaderify", {includeExtensions: ['.glsl']}, (content, opts, done) ->
  # chunkPath = opts.config.chunkPath || ''
  result = null
  if content?
    result = "module.exports = #{JSON.stringify(content)}"
  done null, result
