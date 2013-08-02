Quips = require 'quips'
$     = require 'jqueryify'

AlbumComboView = require 'views/album/combo'
AlbumPieView   = require 'views/album/pie'


class AlbumChartsView extends Quips.View
  template:   require 'templates/album/charts'

  add: (result, showPie) ->
    $row = $('<div>').addClass 'row'
    @$el.append($row)
    @_addCombo(result, $row)
    @_addPie(result, $row) if showPie

  clear: ->
    @$el.empty()

  _addCombo: (result, $row) ->
    combo = new AlbumComboView().render(result)
    $row.append combo.$el
    combo.drawChart()

  _addPie: (result, $row) ->
    pie = new AlbumPieView().render(result)
    $row.append pie.$el
    pie.drawChart()


module.exports = AlbumChartsView
