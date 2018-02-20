
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawSeriesChart);

function drawSeriesChart() {

$.get("data/cardioActivities.csv", function(csvString) {
    // transform the csv string into a 2D array 
    var arrayData = $.csv.toArrays(csvString, {onParseValue: $.csv.hooks.castToScalar});
    // create DataTable object to hold all the data 
    var data = new google.visualization.arrayToDataTable(arrayData);
    // select a subset of the data for the view 
    var view = new google.visualization.DataView(data); 
    view.setColumns(["Date", "Distance (mi)", "Average Pace", "Calories Burned", "Climb (ft)"]);

  var options = {
    title: 'calories burned',
    titleTextStyle: {
      bold: false
    },
    bubble: {textStyle: {color: 'none'}},
    hAxis: {title: 'Distance (mi)',
            viewWindow: {
              max: 15,
              min: 0
            }},
    vAxis: {title: 'Average pace (mph)',
            viewWindow: {
              max: 15,
              min: 5
            }},
    explorer: {
      actions: ['dragToZoom', 'rightClickToReset'],
      keepInBounds: true,
      maxZoomIn: 2
    }
  };

  var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
  chart.draw(view, options);
  })
}
