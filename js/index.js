function addChart(album) {
  $.getJSON("http://jaws.tomfleischer.com:5001/" + album).done(function(result) {
    data = []
    result.tracks.forEach(function(track) {
      data.push([track.num, track.rel_pop, track.name])
    });
    var dataTable = new google.visualization.DataTable();
    dataTable.addColumn('number', 'Track');
    dataTable.addColumn('number', 'Popularity');
    dataTable.addColumn({type: 'string', role: 'tooltip'});
    dataTable.addRows(data);

    $el = $('<div>')
    $('.charts').append($el);
    var chart = new google.visualization.AreaChart($el[0]);
    chart.draw(dataTable, {
      title: '\'' + result.name + '\'' + ' by ' + result.artist,
      titleTextStyle: { fontSize: 18, color: '#E3D5B6' },
      areaOpacity: '0.6',
      backgroundColor: '#333',
      fontName: 'Raleway',
      chartArea: {
        top: 40,
        left: 0
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
        gridlines: { color: 'transparent' }
      }
    });
  });
}
