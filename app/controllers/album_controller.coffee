Quips   = require 'quips'
getJSON = require('jqueryify').getJSON

AlbumChartsView  = require 'views/album/charts'
AlbumFormView    = require 'views/album/form'


class AlbumController extends Quips.Controller
  layout: require 'templates/album/layout'

  views:
    '#album_form':  'formView'
    '.charts':      'chartsView'

  events:
    'formView.submit':  'addCharts'
    'formView.clear':   'clear'

  routes:
    'album': 'activate'

  constructor: ->
    @formView = new AlbumFormView().render()
    @chartsView = new AlbumChartsView().render()
    super

  addCharts: (album, showPie) ->
    url = "#{Quips.host}/album/#{album}"
    getJSON(url).done (result) =>
      @chartsView.add(result, showPie)

  clear: -> @chartsView.clear()


module.exports = AlbumController
