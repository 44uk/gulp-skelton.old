gulp     = require 'gulp'
plumber  = require 'gulp-plumber'
notify   = require 'gulp-notify'
ect      = require 'gulp-ect'
prettify = require 'gulp-prettify'
config   = require('../config').ect

gulp.task 'ect', ->
  gulp.src(config.src)
    .pipe plumber(
      errorHandler: notify.onError('<%= error.message %>')
    )
    .pipe ect(config.options)
    .pipe prettify(config.prettify)
    .pipe gulp.dest(config.dest)
