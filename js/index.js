function addComboChart(result, $el) {
  data = []
  result.tracks.forEach(function(track) {
    row = [track.num, track.rel_pop, track.name, track.pop, track.name]
    data.push(row)
  });
  var dataTable = new google.visualization.DataTable();
  dataTable.addColumn('number', 'Track');
  dataTable.addColumn('number', 'Relative');
  dataTable.addColumn({type: 'string', role: 'tooltip'});
  dataTable.addColumn('number', 'Overall');
  dataTable.addColumn({type: 'string', role: 'tooltip'});
  dataTable.addRows(data);

  $container = $('<div>').addClass('col-10')
  $combo = $('<div>');
  $container.append($combo);
  $el.append($container);
  var chart = new google.visualization.ComboChart($combo[0]);
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
      height: 120
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
}

function addPieChart(result, $el) {
  data = []
  result.tracks.forEach(function(track) {
    row = [track.name, track.share_pop]
    data.push(row)
  });
  var dataTable = new google.visualization.DataTable();
  dataTable.addColumn('string', 'Track');
  dataTable.addColumn('number', 'Share');
  dataTable.addRows(data);

  $container = $('<div>').addClass('col-2');
  $pie = $('<div>');
  $container.append($pie);
  $el.append($container);
  var chart = new google.visualization.PieChart($pie[0]);
  chart.draw(dataTable, {
    legend: { position: 'none' },
    backgroundColor: '#333',
    pieSliceBorderColor: '#444',
    pieResidueSliceColor: '#444',
    chartArea: {
      height: 120,
      top:    40,
      left:   0
    },
    lineWidth: 0,
    tooltip: {
      text: 'percentage',
      textStyle: { fontName: 'Raleway', fontSize: 12 }
    },
    pieSliceText: 'none',
    sliceVisibilityThreshold: '0.04',
    width: 300
  });
}

function addChart(album, showPie) {
  // var url = "http://server.jawsapps.com/explorify/" + album
  var url = "http://localhost:5001/" + album
  $.getJSON(url).done(function(result) {
    $el = $('<div>').addClass('row');
    $('.charts').append($el);
    addComboChart(result, $el);
    if (showPie) {
      addPieChart(result, $el);
    }
  });
}
