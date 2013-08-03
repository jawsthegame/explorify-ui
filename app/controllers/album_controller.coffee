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
    'formView.submit-album':  'addCharts'
    'formView.submit-artist': 'addChartsForArtist'
    'formView.clear':         'clear'

  routes:
    'album': 'activate'

  constructor: ->
    @formView = new AlbumFormView().render()
    @chartsView = new AlbumChartsView().render()
    super

  addCharts: (albums, showPie) ->
    @formView.block message: 'Loading Album Data...'
    processed = 0
    for album in albums
      url = "#{Quips.host}/album/#{album}"
      getJSON(url).done (result) =>
        @chartsView.add(result, showPie)
        if processed is albums.length - 1
          @formView.unblock()
        processed++

  addChartsForArtist: (artist, showPie) ->
    @formView.block message: 'Loading Artist Data...'
    url = "#{Quips.host}/artist/#{artist}/albums"
    getJSON(url).done (result) =>
      @addCharts(
        (album.replace('spotify:album:', '') for album in result),
        showPie)

  clear: -> @chartsView.clear()


module.exports = AlbumController
