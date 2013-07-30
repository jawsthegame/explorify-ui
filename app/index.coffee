Quips = require 'quips'
$     = require 'jqueryify'

PopularityController = require 'controllers/popularity_controller'


class App

  constructor: (config) ->
    Quips.host = config?.host
    @showUI()

  showUI: ->
    $layout = $('body').empty().append(require 'templates/layout')
    $content = $layout.find('#main-content')

    new PopularityController(el: $content).activate()


module.exports = App
