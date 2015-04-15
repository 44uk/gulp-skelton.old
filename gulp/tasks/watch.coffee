gulp   = require 'gulp'
config = require('../config').watch

gulp.task 'watch', ->
  gulp.watch config.coffee, ['coffee', 'bsReload']
  gulp.watch config.jade,   ['jade', 'bsReload']
  gulp.watch config.ect,    ['ect', 'bsReload']
  gulp.watch config.stylus, ['stylus', 'bsReload']
  gulp.watch config.sass,   ['sass', 'bsReload']
  gulp.watch config.files,  ['copy', 'bsReload']
  gulp.watch config.sprite, ['spritesmith', 'bsReload']
