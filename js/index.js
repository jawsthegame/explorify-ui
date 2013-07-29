function addChart(album, showOverall) {
  var url = "http://server.jawsapps.com/explorify/" + album
  $.getJSON(url).done(function(result) {
    data = []
    result.tracks.forEach(function(track) {
      if (showOverall) {
        row = [track.num, track.rel_pop, track.name, track.pop, track.name]
      } else {
        row = [track.num, track.rel_pop, track.name]
      }
      data.push(row)
    });
    var dataTable = new google.visualization.DataTable();
    dataTable.addColumn('number', 'Track');
    dataTable.addColumn('number', 'Relative');
    dataTable.addColumn({type: 'string', role: 'tooltip'});
    if (showOverall) {
      dataTable.addColumn('number', 'Overall');
      dataTable.addColumn({type: 'string', role: 'tooltip'});
    }
    dataTable.addRows(data);

    $el = $('<div>')
    $('.charts').append($el);
    var chart = new google.visualization.ComboChart($el[0]);
    chart.draw(dataTable, {
      title: '\'' + result.name + '\'' + ' by ' + result.artist,
      titleTextStyle: { fontSize: 16, color: '#E3D5B6' },
      areaOpacity: '0.6',
      seriesType: 'area',
      series: { 1: { type: 'line', lineWidth: 2 } },
      lineWidth: 0,
      pointSize: 0,
      colors: ['#3497C2', '#DBAB39'],
      backgroundColor: '#333',
      fontName: 'Raleway',
      chartArea: {
        top:    40,
        left:   0,
        height: 80
      },
      legend: {
        position: 'none'
      },
      hAxis: {
        textPosition: 'none',
        baselineColor: 'transparent',
        gridlines: { color: 'transparent' }
      },
      vAxis: {
        textPosition: 'none',
        baselineColor: '#444',
        gridlines: { color: 'transparent' },
        viewWindow: { max: 1, min: 0 }
      }
    });
  });
}
