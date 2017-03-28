<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


  <head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
    google.charts.load('current', { 'packages': ['map'] });
    google.charts.setOnLoadCallback(drawMap);

    function drawMap() {
      var data = google.visualization.arrayToDataTable([
        ['Country', 'Population'],
        ['China', '중국회원수: ${map.China}명'],
        ['India', '인도회원수: ${map.India}명'],
        ['US', '미국회원수: ${map.US}명'],
        ['Indonesia', '인도네시아회원수: ${map.Indonesia}명'],
        ['Brazil', '브라질회원수: ${map.Brazil}명'],
        ['Pakistan', '파키스탄회원수: ${map.Pakistan}명'],
        ['Nigeria', '나이지리아회원수: ${map.Nigeria}명'],
        ['Bangladesh', '방글라데시회원수: ${map.Bangladesh}명'],
        ['Russia', '러시아회원수: ${map.Russia}명'],
        ['Japan', '일본회원수: ${map.Japan}명'],
        ['Korea', '한국회원수: ${map.Korea}명']
      ]);

    var options = {
      showTooltip: true,
      showInfoWindow: true
    };

    var map = new google.visualization.Map(document.getElementById('chart_div'));

    map.draw(data, options);
  };
  </script>
  </head>
  <body>
  
  <h1>국가별 회원수</h1>
    <div id="chart_div"></div>
  </body>
</html>