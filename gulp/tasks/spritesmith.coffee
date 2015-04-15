gulp        = require 'gulp'
plumber     = require 'gulp-plumber'
notify      = require 'gulp-notify'
spritesmith = require 'gulp.spritesmith'
config      = require('../config').spritesmith

gulp.task 'spritesmith', ->
  spriteData = gulp.src(config.src)
    .pipe plumber(
      errorHandler: notify.onError('<%= error.message %>')
    )
    .pipe spritesmith(config.options)

  spriteData.img
    .pipe gulp.dest(config.dest.imgSpriteSheet)

  spriteData.css
    .pipe gulp.dest(config.dest.cssSpriteSheet)
