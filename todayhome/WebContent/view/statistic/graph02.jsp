<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['country', 'rate'],
          ['미국',     ${map.usa}],
          ['중국',      ${map.china}],
          ['대한민국',  ${map.korea}],
          ['영국', ${map.uk}],
          ['그리스',    ${map.greece}],
          ['필리핀',    ${map.philipin}],
          ['호주',    ${map.austrailia}]
        ]);
         

        var options = {
          title: '국가별 호스팅 비율',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
      
      
      
      
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['country', 'rate'],
          ['미국',     ${mapmember.usa}],
          ['중국',      ${mapmember.china}],
          ['대한민국',  ${mapmember.korea}],
          ['영국', ${mapmember.uk}],
          ['그리스',    ${mapmember.greece}],
          ['필리핀',    ${mapmember.philipin}],
          ['호주',    ${mapmember.austrailia}],
          ['일본',    ${mapmember.japan}]
        ]);

        var options = {
          title: '국가별 회원 비율',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
        chart.draw(data, options);
      }
      
      
      
      
      
      
    </script>
  </head>
  <body>
  <h2 align="center">국적비율</h2>
  <div class="row">
    <div id="donutchart" style="width: 900px; height: 500px;float: left;"></div>
    <div id="donutchart2" style="width: 900px; height: 500px;float: right;"></div>
    </div>
  </body>
</html>