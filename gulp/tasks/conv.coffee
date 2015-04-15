gulp    = require 'gulp'
plumber = require 'gulp-plumber'
notify  = require 'gulp-notify'
replace = require 'gulp-replace'
conv    = require 'gulp-convert-encoding'
config  = require('../config').conv

gulp.task 'conv', ->
  gulp.src(config.src)
    .pipe plumber(
      errorHandler: notify.onError('<%= error.message %>')
    )
    .pipe replace(config.pattern, config.replace)
    .pipe conv(config.options)
    .pipe gulp.dest(config.dest)

