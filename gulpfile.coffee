gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
livereload = require 'gulp-livereload'
jade = require 'gulp-jade'

gulp.task 'default', ->
    console.log 'hello world'

gulp.task 'dev', ->
    nodemon {
        script: 'app.coffee',
        ext: '',
        ignore: ['']
        }

gulp.task 'jade', ->
    gulp.src 'layout/**'
        .pipe jade {
            pretty: true
        }
        .pipe(gulp.dest 'static')

gulp.task 'watch', ['jade', 'dev'], ->
    server = livereload()
    gulp.watch 'layout/**', ['jade']
    gulp.watch('static/**').on 'change', (file) ->
        server.changed file.path
