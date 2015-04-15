gulp         = require 'gulp'
plumber      = require 'gulp-plumber'
notify       = require 'gulp-notify'
stylus       = require 'gulp-stylus'
autoprefixer = require 'gulp-autoprefixer'
cmq          = require 'gulp-combine-media-queries'
sourcemaps   = require 'gulp-sourcemaps'
csscomb      = require 'gulp-csscomb'
csso         = require 'gulp-csso'
config       = require('../config')

gulp.task 'stylus', ->
  gulp.src(config.stylus.src)
    .pipe plumber(
      errorHandler: notify.onError('<%= error.message %>')
    )
    .pipe sourcemaps.init()
    .pipe stylus(config.stylus.options)
    .pipe autoprefixer(config.autoprefixer)
    .pipe cmq()
    .pipe csscomb()
    .pipe sourcemaps.write()
    .pipe gulp.dest(config.stylus.dest)
