Quips = require 'quips'
$     = require 'jqueryify'

PopularityComboView = require 'views/popularity/combo'
PopularityPieView   = require 'views/popularity/pie'


class PopularityChartsView extends Quips.View
  template:   require 'templates/popularity/charts'

  add: (result, showPie) ->
    $row = $('<div>').addClass 'row'
    @$el.append($row)
    @_addCombo(result, $row)
    @_addPie(result, $row) if showPie

  clear: ->
    @$el.empty()

  _addCombo: (result, $row) ->
    combo = new PopularityComboView().render(result)
    $row.append combo.$el
    combo.drawChart()

  _addPie: (result, $row) ->
    pie = new PopularityPieView().render(result)
    $row.append pie.$el
    pie.drawChart()


module.exports = PopularityChartsView
