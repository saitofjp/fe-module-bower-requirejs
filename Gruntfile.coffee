module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      compile:
        files: [
          expand: true
          cwd: 'public/'
          src: '**/*.coffee'
          dest: 'public'
          ext: '.js'
        ]

    requirejs:
      optimize:
        options:
          findNestedDependencies: true
          optimize: "none" # 有効にするとminifyされないのでデバッグしやすい
          appDir : "public"
          baseUrl: "."
          mainConfigFile: "public/require-config.js"
          dir :"dest"
          name: "main" #このモジュールにまとめられる

    connect:
      server:
        options:
          base: 'public'
          keepalive: true
          port: 80
          debug:true


  # Load task
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'

  # Register custom tasks
  grunt.registerTask 'default', ['requirejs:optimize']
  grunt.registerTask 'server', [ 'connect:server:keepalive']