Quips = require 'quips'

ArtistFormView = require 'views/artist/form'


class ArtistController extends Quips.Controller
  layout: require 'templates/artist/layout'

  views:
    '#artist_form': 'formView'

  routes:
    'artist': 'activate'

  constructor: ->
    @formView = new ArtistFormView().render()
    super


module.exports = ArtistController
