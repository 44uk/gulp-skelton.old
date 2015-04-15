gulp       = require 'gulp'
plumber    = require 'gulp-plumber'
notify     = require 'gulp-notify'
coffee     = require 'gulp-coffee'
sourcemaps = require 'gulp-sourcemaps'
stripDebug = require 'gulp-strip-debug'
config     = require('../config').coffee

gulp.task 'coffee', ->
  gulp.src(config.src)
    .pipe plumber(
      errorHandler: notify.onError('<%= error.message %>')
    )
    .pipe sourcemaps.init()
    .pipe coffee(config.options)
    .pipe sourcemaps.write()
    .pipe gulp.dest(config.dest)
