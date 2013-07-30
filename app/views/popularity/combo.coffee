Quips = require 'quips'


class PopularityComboView extends Quips.View
  template:   require 'templates/popularity/combo'
  className:  'col-10'

  elements:
    '.combo-chart': '$chart'

  render: (result) ->
    super
    @_prepareChart(result)
    this

  drawChart: ->
    @chart.draw @dataTable,
      title: @title
      titleTextStyle:
        fontSize: 16
        color: '#E3D5B6'
      areaOpacity: '0.6'
      seriesType: 'area'
      series:
        1:
          type: 'line'
          lineWidth: 2
      lineWidth: 0
      pointSize: 0
      colors: ['#3497C2', '#DBAB39']
      backgroundColor: '#333'
      fontName: 'Raleway'
      chartArea:
        top:    40
        left:   0
        height: 120
        width:  @$chart.width()
      legend:
        position: 'none'
      hAxis:
        textPosition: 'none',
        baselineColor: 'transparent',
        gridlines: color: 'transparent'
      vAxis:
        textPosition: 'none',
        baselineColor: '#444',
        gridlines: color: 'transparent',
        viewWindow:
          max: 1
          min: 0

  _prepareChart: (result) ->
    data = ([t.num, t.rel_pop, t.name, t.pop, t.name] for t in result.tracks)

    @dataTable = new google.visualization.DataTable
    @dataTable.addColumn 'number', 'Track'
    @dataTable.addColumn 'number', 'Relative'
    @dataTable.addColumn type: 'string', role: 'tooltip'
    @dataTable.addColumn 'number', 'Overall'
    @dataTable.addColumn type: 'string', role: 'tooltip'
    @dataTable.addRows(data)

    @chart = new google.visualization.ComboChart @$chart[0]
    @title = "'#{result.name}' by #{result.artist}"


module.exports = PopularityComboView
