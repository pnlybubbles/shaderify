path = require 'path'
browserify = require 'browserify'
shaderify = require '../src/shaderify'
chai = require 'chai'
expect = chai.expect
fs = require 'fs'

describe "shaderify", ->
  it "should be return glsl content", (done) ->
    correct = 'sample\n'
    b = browserify()
    b
      .add path.resolve(__dirname, './sample/sample-js.js')
      .transform shaderify
      .bundle (err, buf) ->
        fs.open path.resolve(__dirname, './sample/sample-output.js'), 'w', (err_, fd) ->
          fs.write fd, buf, 0, buf.length, null, ->
            fs.close fd, ->
              require path.resolve(__dirname, './sample/sample-output.js')
              result = global.result
              expect(result).to.equal(correct)
              done()
