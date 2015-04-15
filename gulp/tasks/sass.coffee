gulp         = require 'gulp'
plumber      = require 'gulp-plumber'
notify       = require 'gulp-notify'
sass         = require 'gulp-sass'
autoprefixer = require 'gulp-autoprefixer'
cmq          = require 'gulp-combine-media-queries'
sourcemaps   = require 'gulp-sourcemaps'
csscomb      = require 'gulp-csscomb'
csso         = require 'gulp-csso'
config       = require('../config')

gulp.task 'sass', ->
  gulp.src(config.sass.src)
    .pipe plumber(
      errorHandler: notify.onError('<%= error.message %>')
    )
    .pipe sourcemaps.init()
    .pipe sass(config.sass.options)
    .pipe autoprefixer(config.autoprefixer)
    .pipe cmq()
    .pipe csscomb()
    .pipe sourcemaps.write()
    .pipe gulp.dest(config.sass.dest)
