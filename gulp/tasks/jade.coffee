gulp     = require 'gulp'
plumber  = require 'gulp-plumber'
notify   = require 'gulp-notify'
jade     = require 'gulp-jade'
prettify = require 'gulp-prettify'
config   = require('../config').jade

gulp.task 'jade', ->
  gulp.src(config.src)
    .pipe plumber(
      errorHandler: notify.onError('<%= error.message %>')
    )
    .pipe jade(config.options)
    .pipe prettify(config.prettify)
    .pipe gulp.dest(config.dest)
