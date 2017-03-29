<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <script type='text/javascript'>
     google.charts.load('current', {'packages': ['geochart']});
     google.charts.setOnLoadCallback(drawMarkersMap);
      function drawMarkersMap() {
      var data = google.visualization.arrayToDataTable([
        ['도시',   '호스팅개수', '방개수'],
        ['Seoul',      ${map.SeoulHosting},    ${map.SeoulRoomcnt}],
        ['Yongin',      ${map.YonginHosting},    ${map.YonginRoomcnt}],
        ['Anyang',      ${map.AnyangHosting},    ${map.AnyangRoomcnt}],
        ['Ansan',      ${map.SeoulHosting},    ${map.AnsanRoomcnt}],
        ['Incheon',      ${map.InchunHosting},    ${map.InchunRoomcnt}],
        ['Jeju',      ${map.JejuHosting},    ${map.JejuRoomcnt}],
        ['Bucheon',      ${map.BuchunHosting},    ${map.BuchunRoomcnt}],
        ['Busan',      ${map.BusanHosting},    ${map.BusanRoomcnt}]
      ]);
      var options = {
        region: 'KR',
        displayMode: 'markers',
        colorAxis: {colors: ['pink', 'red']}
      };
      var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    };
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
  </body>
</html>