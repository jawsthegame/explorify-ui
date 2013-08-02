Quips = require 'quips'


class AristComboView extends Quips.View
  template:   require 'templates/artist/combo'
  className:  'col-10'

  elements:
    '.combo-chart': '$chart'

  render: (result) ->
    super
    @_prepareChart(result)
    this

  drawChart: ->
    @chart.draw @dataTable,
      areaOpacity: '0.6'
      backgroundColor: '#333'
      chartArea:
        height: 120
        left:   0
        top:    40
        width:  @$chart.width()
      colors: ['#3497C2', '#DBAB39']
      fontName: 'Raleway'
      hAxis:
        baselineColor: 'transparent'
        gridlines: color: 'transparent'
        textPosition: 'none'
      legend:
        position: 'none'
      lineWidth: 0
      pointSize: 0
      series:
        1:
          lineWidth: 2
          type: 'line'
      seriesType: 'area'
      title: @title
      titleTextStyle:
        color: '#E3D5B6'
        fontSize: 16
      vAxis:
        baselineColor: '#444'
        gridlines: color: 'transparent'
        textPosition: 'none'
        viewWindow:
          max: 1
          min: 0

  _prepareChart: (result) ->
    data = []
    for a, i in result.albums
      tooltip = "#{a.name} (#{a.year})"
      data.push [i, a.rel_pop, tooltip, a.pop, tooltip]

    @dataTable = new google.visualization.DataTable
    @dataTable.addColumn 'number', 'Index'
    @dataTable.addColumn 'number', 'Relative'
    @dataTable.addColumn type: 'string', role: 'tooltip'
    @dataTable.addColumn 'number', 'Overall'
    @dataTable.addColumn type: 'string', role: 'tooltip'
    @dataTable.addRows(data)

    @chart = new google.visualization.ComboChart @$chart[0]
    @title = result.artist


module.exports = AristComboView
