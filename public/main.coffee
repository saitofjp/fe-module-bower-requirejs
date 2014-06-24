define (require)->
  system = require "system"
  system.init  ->
    App = require("app")
    app  = window.app = new App
    app.start()
