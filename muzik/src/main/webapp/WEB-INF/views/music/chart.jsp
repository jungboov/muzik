<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['period', '태연', '방탄소년단'],
          ['week1',  30,      		1],
          ['week2',  20,     		 50],
          ['week3',  5,      		 55],
          ['week4',  1,     		 70]
        ]);

        var options = {
          title: '주간 순위 변경',
          curveType: 'function',
          legend: { position: 'bottom' },
          reverseCategories :'true',
          vAxis : {direction: -1},
          hAxis : {direction: -1}
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<div id="curve_chart" style="width: 900px; height: 500px"></div>
</body>
</html>