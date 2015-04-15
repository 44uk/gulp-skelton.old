path = require 'path'
fs   = require 'fs'

# directories
dest = 'public'
src  = 'src'
res  = 'res'
mock = 'mock'

destPath = path.relative '.', dest
srcPath  = path.relative '.', src
resPath  = path.relative '.', res
mockPath = path.relative '.', mock

pkg  = require(process.cwd() + '/package.json')
data = require(process.cwd() + '/res/data/site.json')

#srcPath = mockPath

module.exports =
  coffee:
    src: [
      srcPath + '/**/!(_)*.coffee'
    ]
    dest: destPath
    options:
      bare: true
    uglify:
      mangle: true
      preserveComments: 'some'

  spritesmith:
    src: [
      resPath + '/**/*.png'
    ]
    options:
      imgName: '__spriteSheet.png'
      cssName: '__spriteSheet.styl'
      imgPath: '__spriteSheet.png'
      algorithm: 'binary-tree'
      cssFormat: 'stylus'
      padding: 4
    dest:
      imgSpriteSheet: destPath + '/assets/css/'
      cssSpriteSheet: srcPath  + '/assets/css/'

  sass:
    src: [
      srcPath + '/**/!(_)*.{sass,scss}'
    ]
    dest: destPath
    options:
      indentedSyntax: true
      style: 'expanded'
      precision: 10
      sourceComments: false
      errLogToConsole: true

  stylus:
    src: [
      srcPath + '/**/!(_)*.styl'
    ]
    dest: destPath
    options: {}

  autoprefixer:
    cascade: false
    browsers: [
      'ie >= 8'
      'ff >= 34'
      'chrome >= 31'
      'safari >= 7'
      'opera >= 24'
      'ios >= 6.1'
      'android >= 4.0'
    ]

  ect:
    src: [
      '!' + srcPath + '/__partials/**/*.ect'
      srcPath + '/**/!(_)*.ect'
    ]
    dest: destPath
    options: {}
    prettify:
      indent_char: "\t"
      indent_size: 1

  jade:
    src: [
      '!' + srcPath + '/__partials/**/*.jade'
      srcPath + '/**/!(_)*.jade'
    ]
    dest: destPath
    options:
      basedir: srcPath
      pretty: true
      locals: {global: data}
    prettify:
      indent_char: "\t"
      indent_size: 1

  browserSync:
    options:
      server:
        baseDir: destPath
        directory: false
      port: 9000
      open: true
      notify: true
      ghostMode:
        clicks: true
        location: true
        forms: true
        scroll: true

  watch:
    coffee: srcPath + '/**/*.coffee'
    sass:   srcPath + '/**/*.sass'
    stylus: srcPath + '/**/*.styl'
    ect:    srcPath + '/**/*.ect'
    jade:   srcPath + '/**/*.jade'
    files:  srcPath + '/**/*.{html,htm,css,js,map,jpeg,jpg,gif,png,ico,svg,json,xml}'
    sprite: resPath + '/sprite/**/*.{jpeg,jpg,gif,png}'

  clear:
    src: destPath + '/*'

  clean:
    src: destPath + '/**/{Thumb.db,.DS_Store,.gitkeep,.gitignore}'

  copy:
    src: [
      srcPath + '/**/*.{html,htm,css,js,map,jpeg,jpg,gif,png,ico,svg,json,xml}'
    ]
    dest: destPath

  webshot:
    src: [
      'public/**/*.{html,htm}'
    ]
    options:
      dest: 'screenshot/'
      format: 'png'
      incremental: true
      root: 'public/'
      p: 12345
      renderDelay: 500
      windowSize:
        width:  1280
        height: 800
      shotSize:
        width:  'all'
        height: 'all'

  conv:
    src: [
      destPath + '/**/*.{html,htm,css,js}'
    ]
    dest: destPath
    pattern: /utf-?8/i
    replace: 'shift_jis'
    options:
      to: 'Shift_JIS'
