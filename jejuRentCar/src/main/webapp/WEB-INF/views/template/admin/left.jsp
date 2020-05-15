<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

 <ul class="nav nav-sidebar">
 
            <li class="active"><a>회원 관리<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/memberlist/memberList">회원 리스트 조회</a></li>
            
            <li class="active"><a>차량 관리<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/carlist/carList">차량 조회</a></li>
            <li><a href="/admin/carlist/carListInsertForm">차량 등록</a></li>
            
            <li class="active"><a>예약관리<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/memreservation/memRes">회원 예약 내역</a></li>
            <li><a href="/admin/carres/carRes">차량 예약 관리</a></li>
            <li><a href="/admin/refund/reFund">환불 관리</a></li>
            
            <li class="active"><a>게시판 관리<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/noticeboard/notice">공지사항</a></li>
            <li><a href="/admin/qnaboard/qnaboard">문의 게시판</a></li>
            <li><a href="/admin/reviewboard/review">후기 게시판</a></li>
            
            <li class="active"><a>통계<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/memreservation/stat">매출 통계</a></li>
</ul>