function addChart(album, showOverall) {
  $.getJSON("http://jaws.tomfleischer.com:5001/" + album).done(function(result) {
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
    var chart = new google.visualization.AreaChart($el[0]);
    chart.draw(dataTable, {
      title: '\'' + result.name + '\'' + ' by ' + result.artist,
      titleTextStyle: { fontSize: 16, color: '#E3D5B6' },
      areaOpacity: '0.6',
      lineWidth: 0,
      pointSize: 3,
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
        baselineColor: 'transparent',
        gridlines: { color: 'transparent' },
        viewWindow: { max: 1, min: 0 }
      }
    });
  });
}
