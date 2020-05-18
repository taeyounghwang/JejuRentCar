<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" width="device-width" initial-scale="1">
<title>제주렌터카 :: 메인페이지</title>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<div>
<jsp:include page="header.jsp"/>
<jsp:include page="top.jsp"/>
</div>

<style>
#html{
width:1557px;
height:5000px;
}
</style>

<body>
<%
	String center =request.getParameter("Center");
	// 처음 실행시에는 center값이 넘어오지 않기때문에 
	if(center==null){//null 처리 해준다.
		center="center.jsp"; //default center 값을 부여
	}
%>



<jsp:include page="<%= center %>"/>

<!-- footer -->
<jsp:include page="footer.jsp"/>


</body>
</html>