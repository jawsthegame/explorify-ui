Quips = require 'quips'


class PopularityFormView extends Quips.View
  template: require 'templates/popularity/form'

  events:
    'click #add_album': 'addAlbum'
    'click #clear':     'clear'
    'click #samples':   'addSamples'

  elements:
    'input[name=album_id]': '$albumId'
    'input[name=show_pie]': '$showPie'

  addAlbum: ->
    albumString = 'spotify:album:'
    if @$albumId.val().indexOf(albumString) is 0
      album = @$albumId.val().replace(albumString, '')
      @trigger 'submit', album, @_showPie()
    @$albumId.val('')

  addSamples: ->
    @clear()
    @trigger 'submit', '0yphhvodu9wyvksSgwJ7F1', @_showPie()
    @trigger 'submit', '0Y0V072vxDWEvCelPBaWAO', @_showPie()
    @trigger 'submit', '6J6nlVu4JMveJz0YM9zDgL', @_showPie()
    @trigger 'submit', '3LIsuX99RAJJTq0L1gHh4g', @_showPie()
    @trigger 'submit', '4UlA8Vpl8B7vzVvyigEpNJ', @_showPie()

  clear: -> @trigger 'clear'

  _showPie: -> @$showPie.prop('checked')


module.exports = PopularityFormView
