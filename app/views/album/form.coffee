Quips = require 'quips'


class AlbumFormView extends Quips.View
  template: require 'templates/album/form'

  events:
    'click #add_album': 'addAlbum'
    'click #clear':     'clear'
    'click #samples':   'addSamples'

  elements:
    'input[name=id]': '$id'
    'input[name=show_pie]': '$showPie'

  addAlbum: ->
    albumString = 'spotify:album:'
    artistString = 'spotify:artist:'
    id = @$id.val()
    if id.indexOf(albumString) is 0
      album = id.replace(albumString, '')
      @trigger 'submit-album', [album], @_showPie()
    else if id.indexOf(artistString) is 0
      artist = id.replace(artistString, '')
      @trigger 'submit-artist', artist, @_showPie()
    @$id.val('')

  addSamples: ->
    @clear()
    @trigger 'submit', [
      '0yphhvodu9wyvksSgwJ7F1',
      '0Y0V072vxDWEvCelPBaWAO',
      '6J6nlVu4JMveJz0YM9zDgL',
      '3LIsuX99RAJJTq0L1gHh4g',
      '4UlA8Vpl8B7vzVvyigEpNJ'
      ], @_showPie()

  clear: -> @trigger 'clear'

  _showPie: -> @$showPie.prop('checked')


module.exports = AlbumFormView
