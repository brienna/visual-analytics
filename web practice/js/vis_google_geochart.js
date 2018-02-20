// Load the visualization library
google.charts.load('current', {
   'packages': ['geochart'],
   // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
   'mapsApiKey': 'AIzaSyDhfIsZPuYY73d9c_RsjyTRINLbX4py-jE'
 });

// Set a listener with a callback
google.charts.setOnLoadCallback(drawMarkersMap);

// Define the callback
function drawMarkersMap() {
  // grab the csv
  $.get("data/output.csv", function(csvString) {
    // transform the csv string into a 2D array 
    var arrayData = $.csv.toArrays(csvString, {onParseValue: $.csv.hooks.castToScalar});
    // create DataTable object to hold all the data 
    var data = new google.visualization.arrayToDataTable(arrayData);
    // select a subset of the data for the view (first two columns must be coordinates)
    var view = new google.visualization.DataView(data); 
    view.setColumns(["Latitude", "Longitude", "Date", "Distance (mi)"]);

    var options = {
      region: 'US',
      displayMode: 'markers',
      colorAxis: {colors: ['yellow', 'red']},
      datalessRegionColor: '#F5F5F5',
      magnifyingGlass: {enable: true, zoomFactor: 55.0}
    };

    var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
    chart.draw(view, options);
  });
}

