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
    if @$artistId.val().indexOf(albumString) is 0
      artist = @$albumId.val().replace(albumString, '')
      @trigger 'submit', artist
    @$artistId.val('')

  addSamples: ->
    @clear()

  clear: -> @trigger 'clear'


module.exports = ArtistFormView
