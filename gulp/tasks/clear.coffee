gulp = require 'gulp'
del  = require 'del'
config = require('../config').clear

gulp.task 'clear', (cb)->
  del(config.src, cb)
