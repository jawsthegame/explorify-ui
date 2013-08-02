Quips = require 'quips'
$     = require 'jqueryify'

ArtistComboView = require 'views/artist/combo'


class ArtistChartsView extends Quips.View
  template:   require 'templates/artist/charts'

  add: (result, showPie) ->
    $row = $('<div>').addClass 'row'
    @$el.append($row)
    @_addCombo(result, $row)

  clear: ->
    @$el.empty()

  _addCombo: (result, $row) ->
    combo = new ArtistComboView().render(result)
    $row.append combo.$el
    combo.drawChart()


module.exports = ArtistChartsView
