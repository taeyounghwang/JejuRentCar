<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 소개</title>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>

</head>

<style>
.index1{
overflow:auto; 
}

.one{
border:none;
border:1px solid gray;
}

.content{
	background-color: #FFFFFF;
}
</style>

<body>
   <div class="content">
      <br>
      <label style="margin-left:30px;">메인페이지 > 제주렌터카 소개</label>
      <hr class="one">
      <br>
      <div class="index1" align="center">
      	<div style="background-color: #F6F6F6;">
         <h1 style="font-size: 80px;">제주 렌터카 소개</h1>
         </div>
         <img src="resources/images/jejuintro.jpg">
         <div align="center" style="margin-top:20px; background-color: #F6F6F6;">
         <label style="font-family: 'Jua', sans-serif; font-size: 60px; margin-top: 10px;">오시는 길</label>
         </div>
         <br>
         <div id="map" style="width: 1200px; height: 800px;" align="center"></div>
         
      </div>
   </div>
   

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2dca9350ad7f34452b8fc0d2e2fe138c"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(33.5023024998099, 126.49834563617907), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 마커가 표시될 위치입니다 
      var markerPosition = new kakao.maps.LatLng(33.5023024998099, 126.49834563617907);

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
         position : markerPosition
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      var iwContent = '<div style="padding:5px;">제주 렌트카 <br><a href="https://map.kakao.com/link/map/제주렌트카,33.5023024998099,126.49834563617907" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/제주렌트카,33.5023024998099,126.49834563617907" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
      iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

      // 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
         position : iwPosition,
         content : iwContent
      });

      // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
      infowindow.open(map, marker);
   </script>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>