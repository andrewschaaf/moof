
fs = require 'fs'
{noisyExec} = require 'tafa-misc-util'
{bodystitch} = require 'coffeesurgeon'
coffee_script = require 'coffee-script'


throwe = (callback) ->
  (e, args...) ->
    throw e if e
    callback e, args...

buildMerged = () ->
  CODEPATH = ["#{__dirname}/src"]
  bodystitch {main:'moof_bodystitch_main', codepath:CODEPATH}, throwe (e, {coffee}) ->
    fs.writeFileSync "build/moof.coffee", coffee
    js = coffee_script.compile coffee, bare:true
    fs.writeFileSync "build/moof-bare.js", js

task 'build', () ->
  noisyExec "coffee -co lib src"
  buildMerged()
