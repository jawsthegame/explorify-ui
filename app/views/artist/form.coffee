Quips = require 'quips'


class ArtistFormView extends Quips.View
  template: require 'templates/artist/form'

  events:
    'click #add_artist':  'addArtist'
    'click #clear':       'clear'
    'click #samples':     'addSamples'

  elements:
    'input[name=artist_id]': '$artistId'

  addArtist: ->
    artistString = 'spotify:artist:'
    if @$artistId.val().indexOf(artistString) is 0
      artist = @$artistId.val().replace(artistString, '')
      @trigger 'submit', [artist]
    @$artistId.val('')

  addSamples: ->
    @clear()
    $.unblock = ->
    @trigger 'submit', ['2JpHk8yju1DH1l3c9sXzOS', '3xZBpeXHkSjTKQIR1OeKN0']

  clear: -> @trigger 'clear'


module.exports = ArtistFormView
