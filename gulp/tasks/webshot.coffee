gulp = require 'gulp'
shot = require 'gulp-webshot'
config = require('../config').webshot

gulp.task 'webshot', ->
  gulp.src(config.src)
    .pipe shot(config.options)
