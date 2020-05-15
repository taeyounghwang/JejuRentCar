<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

  <head>
    <meta charset="utf-8">
    <title>Line_Controls_Chart</title>
 
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>

  <body>
 	
    <h2 class="sub-header">매출 현황 그래프</h2>
 
    <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
        </div>
  </body>
  
  
  
  <script>
  //데이터 값
  // 1월 총 매출, 예약 건수
  var price1 = '${price1}';
  price1 = Number(price1);
  var total1 = '${total1}'
  total1 = Number(total1);
  //2월 총 매출, 예약 건수
  var price2 = '${price2}';
  price2 = Number(price2);
  var total2 = '${total2}'
  total2 = Number(total2);
  //3월 총 매출, 예약 건수
  var price3 = '${price3}';
  price3 = Number(price3);
  var total3 = '${total3}'
  total3 = Number(total3);
  //4월 총 매출, 예약 건수
  var price4 = '${price4}';
  price4 = Number(price4);
  var total4 = '${total4}'
  total4 = Number(total4);
  // 5월 총 매출, 예약 건수
  var price5 = '${price5}';
  price5 = Number(price5);
  var total5 = '${total5}'
  total5 = Number(total5);
  //6월 총 매출, 예약 건수
  var price6 = '${price6}';
  price6 = Number(price6);
  var total6 = '${total6}'
  total6 = Number(total6);
  //7월 총 매출, 예약 건수
  var price7 = '${price7}';
  price7 = Number(price7);
  var total7 = '${total7}'
  total7 = Number(total7);
  //8월 총 매출, 예약 건수
  var price8 = '${price8}';
  price8 = Number(price8);
  var total8 = '${total8}'
  total8 = Number(total8);
  //9월 총 매출, 예약 건수
  var price9 = '${price9}';
  price9 = Number(price9);
  var total9 = '${total9}'
  total9 = Number(total9);
  //10월 총 매출, 예약 건수
  var price10 = '${price10}';
  price10 = Number(price10);
  var total10 = '${total10}'
  total10 = Number(total10);
  //11월 총 매출, 예약 건수
  var price11 = '${price11}';
  price11 = Number(price11);
  var total11 = '${total11}'
  total11 = Number(total11);
  //12월 총 매출, 예약 건수
  var price12 = '${price12}';
  price12 = Number(price12);
  var total12 = '${total12}'
  total12 = Number(total12);
  //차트
  var chartDrowFun = {
 
    chartDrow : function(){
        var chartData = '';
 		
        
        
        //날짜형식 변경
        var chartDateformat = 'yyyy년MM월';
        //라인차트의 라인 수
        var chartLineCount = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount = 10;
 		//이번년도 설정
        var s_year = new Date();//
 		var s_year = s_year.getFullYear();

 		function drawDashboard() {
 
          var data = new google.visualization.DataTable();
          //그래프에 표시할 컬럼 추가
          data.addColumn('datetime' , '날짜');
          data.addColumn('number'   , '예약건수');
          data.addColumn('number'   , '매출액');
 		  
          var dataRow = [];
          //그래프에 표시할 데이터
          /* var dataRow = [];
          for(var i = 0; i <= 11; i++){ //1월 부터 12월 까지
        	  
            var rsv_count = Math.floor(Math.random() * 300) + 1; //예약건수
            var sales = Math.floor(Math.random() * rsv_count) + 1; //월별 매출액
 
            dataRow = [new Date(s_month, i), rsv_count, sales];
            data.addRow(dataRow);
          } */
          
          //1월
          var rsv_count = total1; //예약건수
          var sales = price1; //월별 매출액
          
          dataRow = [new Date(s_year, 0), rsv_count, sales];
          data.addRow(dataRow);
		  
          //2월
          var rsv_count = total2; //예약건수
          var sales = price2; //월별 매출액
          
          dataRow = [new Date(s_year, 1), rsv_count, sales];
          data.addRow(dataRow);
          
          //3월
          var rsv_count = total3; //예약건수
          var sales = price3; //월별 매출액
          
          dataRow = [new Date(s_year, 2), rsv_count, sales];
          data.addRow(dataRow);
          
          //4월
          var rsv_count = total4; //예약건수
          var sales = price4; //월별 매출액
          
          dataRow = [new Date(s_year, 3), rsv_count, sales];
          data.addRow(dataRow);
          
          //5월
          var rsv_count = total5; //예약건수
          var sales = price5; //월별 매출액
          
          dataRow = [new Date(s_year, 4), rsv_count, sales];
          data.addRow(dataRow);
          
          //6월
          var rsv_count = total6; //예약건수
          var sales = price6; //월별 매출액
          
          dataRow = [new Date(s_year, 5), rsv_count, sales];
          data.addRow(dataRow);
          
          //7월
          var rsv_count = total7; //예약건수
          var sales = price7; //월별 매출액
          
          dataRow = [new Date(s_year, 6), rsv_count, sales];
          data.addRow(dataRow);
          
          //8월
          var rsv_count = total8; //예약건수
          var sales = price8; //월별 매출액
          
          dataRow = [new Date(s_year, 7), rsv_count, sales];
          data.addRow(dataRow);
          
          //9월
          var rsv_count = total9; //예약건수
          var sales = price9; //월별 매출액
          
          dataRow = [new Date(s_year, 8), rsv_count, sales];
          data.addRow(dataRow);
          
          //10월
          var rsv_count = total10; //예약건수
          var sales = price10; //월별 매출액
          
          dataRow = [new Date(s_year, 9), rsv_count, sales];
          data.addRow(dataRow);
          
          //11월
          var rsv_count = total11; //예약건수
          var sales = price11; //월별 매출액
          
          dataRow = [new Date(s_year, 10), rsv_count, sales];
          data.addRow(dataRow);
          
          //12월
          var rsv_count = total12; //예약건수
          var sales = price12; //월별 매출액
          
          dataRow = [new Date(s_year, 11), rsv_count, sales];
          data.addRow(dataRow);
          
          
            var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea', //라인 차트 생성할 영역
              options     : {
                              isStacked   : 'percent',
                              focusTarget : 'category',
                              height          : 500,
                              width              : '100%',
                              legend          : { position: "top", textStyle: {fontSize: 13}},
                              pointSize        : 5,
                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                  years : {format: ['yyyy년']},
                                                                  months: {format: ['MM월']},
                                                                  days  : {format: ['dd일']},
                                                                  hours : {format: ['HH시']}}
                                                                },textStyle: {fontSize:12}},
                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                animation        : {startup: true,duration: 1000,easing: 'in' },
                annotations    : {pattern: chartDateformat,
                                textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                              }
                            }
              }
            });
 
            var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',  //control bar를 생성할 영역
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                            gridlines:{count:controlLineCount,units: {
                                  years : {format: ['yyyy년']},
                                  months: {format: ['MM월']},
                                  days  : {format: ['dd일']},
                                  hours : {format: ['HH시']}}
                            }}
                        }
                  },
                    filterColumnIndex: 0
                }
            });
 
            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
            date_formatter.format(data, 0);
 
            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
            dashboard.bind([control], [chart]);
            dashboard.draw(data);
 
        }
          google.charts.setOnLoadCallback(drawDashboard);
 
      }
    }
 
$(document).ready(function(){
  google.charts.load('current', {'packages':['line','controls']});
  chartDrowFun.chartDrow(); //chartDrow() 실행
});
  </script>
