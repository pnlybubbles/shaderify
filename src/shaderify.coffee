path = require 'path'
transformTools = require 'browserify-transform-tools'

module.exports = transformTools.makeStringTransform "shaderify", {includeExtensions: ['.glsl']}, (content, opts, done) ->
  # if !opts.config then return done new Error("Could not find configuration for shaderify")
  # chunkPath = opts.config.chunkPath || ''
  result = null
  if content?
    result = "module.exports = #{JSON.stringify(content)}"
  done null, result
