gulp = require 'gulp'
seq  = require 'run-sequence'

gulp.task 'build', ['build:development']

gulp.task 'build:development', (cb)-> seq(
  ['clear', 'spritesmith'],
  ['coffee', 'sass', 'stylus', 'jade', 'ect'],
  'copy',
  'clean',
  cb
)
