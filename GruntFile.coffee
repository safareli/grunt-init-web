module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    config: grunt.file.readJSON 'config.json'
    coffeelint:
      options:
        max_line_length:
          level: 'ignore'
      lint:
        files:
          src: [
            '<%= config.dir.source %>/<%= config.dir.scripts %>/**/*.coffee'
            'GruntFile.coffee'
          ]
    coffee:
      compile:
        files: [
          expand: true
          cwd: "<%= config.dir.source %>/"
          src: ["<%= config.dir.scripts %>/**/*.coffee"]
          dest: "<%= config.dir.build %>/"
          ext: ".js"
        ]
    uglify:
      options:
        mangle: false
      compress:
        files:[
          expand: true
          cwd: "<%= config.dir.build %>/"
          src: ["<%= config.dir.scripts %>/**/*.js"]
          dest: "<%= config.dir.build %>/"
          extDot: 'first'
          ext: ".min.js"
        ]
    stylus:
      compile:
        options:
          use: [require 'nib']
          import: ['nib']
        files: [
          expand: true
          cwd: "<%= config.dir.source %>/"
          src: ["<%= config.dir.styles %>/**/*.styl"]
          dest: "<%= config.dir.build %>/"
          ext: ".css"
        ]
    jade:
      compile:
        options:
          data:
            debug: true
            timestamp: "<%= new Date().getTime() %>"
        files: [
          expand: true
          cwd: "<%= config.dir.source %>/"
          src: ["**/*.jade"]
          dest: "<%= config.dir.build %>/"
          ext: ".html"
        ]
    clean:
      build:
        src: ["<%= config.dir.build %>"]
    watch:
      options:
        livereload: '<%= config.server.livereload %>'
      coffee:
        files: ['<%= config.dir.source %>/<%= config.dir.scripts %>/**/*.coffee']
        tasks: [
          'newer:coffeelint:lint'
          'newer:coffee:compile'
          'newer:uglify:compress'
        ]
      stylus:
        files: ['<%= config.dir.source %>/<%= config.dir.styles %>/**/*.styl']
        tasks: ['newer:stylus:compile']
      jade:
        files: ['<%= config.dir.source %>/**/*.jade']
        tasks: ['newer:jade:compile']
    connect:
      live:
        options:
          hostname: '<%= config.server.hostname %>',
          livereload: '<%= config.server.livereload %>',
          base: '<%= config.dir.build %>',
          port: '<%= config.server.port %>'
      alive:
        options:
          hostname: '<%= config.server.hostname %>',
          base: '<%= config.dir.build %>',
          port: '<%= config.server.port %>',
          keepalive:true
        
  # load all grunt tasks matching the `grunt-*` pattern
  require('load-grunt-tasks') grunt
 
  grunt.registerTask "build", [
    "clean"
    "coffeelint"
    "coffee"
    "uglify"
    "jade"
    "stylus"
  ]

  grunt.registerTask 'dev', [
    'connect:live'
    'watch'
  ]

  grunt.registerTask 'default', [
    'build'
    'dev'
  ]


  grunt.registerTask 'check', 'connect:alive'
