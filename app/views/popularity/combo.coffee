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
