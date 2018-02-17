<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<c:import url="../top.jsp" charEncoding="utf-8"/>

<p>

<h1>전체 등록 음원 보기</h1>
<table class="table">
   <thead>
   <tr>
   	  <th>앨범.no</th>
      <th>앨범이름</th>
      <th>가수.no</th>
      <th>가수이름</th>
      <th>readcount</th>
      <th>like</th>
      <th>등록일</th>
      <th>발매일</th>
      <th>삭제</th>
   </tr>
   </thead>
   <tbody>
    <c:if test="${empty allMusicBoard_admin}">
      <tr>
         <td colspan=6>등록된 음원이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="dto" items="${allMusicBoard_admin}">
      <tr>
        <td>${dto.musicboard_no}</td>
        <td>${dto.musicboard_name}</td>
        <td>${dto.musicboard_artistno}</td>
        <td>${dto.musicboard_artistname}</td>
        <td>${dto.musicboard_readcount}</td>
        <td>${dto.musicboard_like}</td>
        <td>${dto.musicboard_regdate}</td>
        <td>${dto.musicboard_releasedate}</td>
        <td><a hidden="#">삭제</a>
      </tr>
      
     </c:forEach>
   </tbody>   
</table>


<div class="w3-center w3-padding-32">
      <div class="w3-bar">
      
      <c:if test="${a eq 'yes'}">
         <a href="allMusicBoard_admin?pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="allMusicBoard_admin?pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="allMusicBoard_admin?pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>      
      </div>
</div>
   
<!-- 
<c:import url="../bottom.jsp" charEncoding="utf-8"/>
 -->
