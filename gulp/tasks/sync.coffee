gulp = require 'gulp'
seq  = require 'run-sequence'

gulp.task 'sync', (cb)-> seq(
  'build',
  ['browserSync', 'watch'],
  cb
)
