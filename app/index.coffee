Quips     = require 'quips'
$         = require 'jqueryify'
Backbone  = require 'backbone'

ArtistController      = require 'controllers/artist_controller'
PopularityController  = require 'controllers/popularity_controller'


class App

  constructor: (config) ->
    Quips.host = config?.host
    @showUI()

  showUI: ->
    $layout = $('body').empty().append(require 'templates/layout')
    $content = $layout.find('#main-content')

    new ArtistController(el: $content)
    new PopularityController(el: $content)

    Backbone.history.start()

    unless window.location.hash
      Backbone.history.navigate '#/popularity'


module.exports = App
