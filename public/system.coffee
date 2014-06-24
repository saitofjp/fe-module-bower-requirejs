define (require)->
    init : (run)->
      require "sugar"
      window.$ = require "jquery"

      run()


