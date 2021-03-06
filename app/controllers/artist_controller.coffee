Quips = require 'quips'
getJSON = require('jqueryify').getJSON

ArtistFormView = require 'views/artist/form'
ArtistChartsView = require 'views/artist/charts'


class ArtistController extends Quips.Controller
  layout: require 'templates/artist/layout'

  views:
    '#artist_form': 'formView'
    '.charts':      'chartsView'

  events:
    'formView.submit':  'addCharts'
    'formView.clear':   'clear'

  routes:
    'artist': 'activate'

  constructor: ->
    @formView = new ArtistFormView().render()
    @chartsView = new ArtistChartsView().render()
    super

  addCharts: (artists) ->
    @formView.block message: 'Loading Artist Data...'
    processed = 0
    for artist in artists
      url = "#{Quips.host}/artist/#{artist}"
      getJSON(url).done (result) =>
        @chartsView.add(result)
        if processed is artists.length - 1
          @formView.unblock()
        processed++

  clear: -> @chartsView.clear()


module.exports = ArtistController
