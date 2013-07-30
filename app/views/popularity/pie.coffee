Quips = require 'quips'


class PopularityPieView extends Quips.View
  template:   require 'templates/popularity/pie'
  className:  'col-2'

  elements:
    '.pie-chart': '$chart'

  render: (result) ->
    super
    @_prepareChart(result)
    this

  drawChart: ->
    @chart.draw @dataTable,
      backgroundColor: '#333'
      chartArea:
        height: 120
        left:   0
        top:    40
      legend:
        position: 'none'
      lineWidth: 0
      pieResidueSliceColor: '#444'
      pieSliceBorderColor: '#444'
      pieSliceText: 'none'
      sliceVisibilityThreshold: '0.04'
      tooltip:
        text: 'percentage'
        textStyle:
          fontName: 'Raleway'
          fontSize: 12
      width: 300

  _prepareChart: (result) ->
    data = ([t.name, t.share_pop] for t in result.tracks)

    @dataTable = new google.visualization.DataTable
    @dataTable.addColumn 'string', 'Track'
    @dataTable.addColumn 'number', 'Share'
    @dataTable.addRows data

    @chart = new google.visualization.PieChart @$chart[0]


module.exports = PopularityPieView
