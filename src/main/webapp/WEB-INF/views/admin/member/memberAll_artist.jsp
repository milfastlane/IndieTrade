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

<style>
ol, ul {
    margin-top: 20px;
    margin-bottom: 10px;
}
.container-custom {
    padding-left: 180px;
    padding-top: 15px ; 
}
</style>
<div class="row content">
    <div class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
            
             <li><a href="admin_memberAll">전체 회원</a></li>
                  <li class="active"><a href="admin_memberAll_artist">가수 회원</a></li>
                  <li><a href="admin_memberAll_fan">팬 회원</a></li>
                  <li><a href="admin_unregisteredAll">탈퇴 이력</a></li>
      </ul><br>
     
    </div>
</div>
<p>
<div class="container-custom" style="margin-left:30px;">
<fieldset>

<!-- Form Name -->
<legend>가수 회원 보기</legend>
<table class="table" style="width: auto !important">
   <thead>
   <tr>
      <th>이름</th>
      <th>아이디</th>
      <th>연락처</th>
      <th>권한</th>
      <th>가입일</th>
      <th>마지막 방문일</th>
      <th>총 방문 일수</th>
      
      
   </tr>
   </thead>
   <tbody>
    <c:if test="${empty userAllArtist}">
      <tr>
         <td colspan=5>등록된 회원이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="dto" items="${userAllArtist}">
      <tr>
        <td>${dto.user_name}</td>
        <td>${dto.user_id}</td>
        <td>${dto.user_phone}</td>
        <td>${dto.user_authority}</td>
        <td>${dto.user_joindate}</td>
        <td>${dto.user_lastvisit}</td>
        <td align="center">${dto.user_totalvisit}</td>
      </tr>
      
     </c:forEach>
   </tbody>   
</table>
<!-- 
<div class="align_center">
			<c:if test="${a eq 'yes'}">
				<a href="search?searchString?&pageNum=${startPage - pageBlock}"
					class="paged">&lt;</a>		
			</c:if>
			<c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
				<a href="search?searchString?&pageNum=${i}"
					class="paged paged_on">${i}</a>
			</c:forEach>
			<c:if test="${b eq 'yes'}">
				<a href="search?searchString?&pageNum=${startPage + pageBlock}" class="paged">&gt;</a>
			</c:if>
		</div>
 -->
<div class="w3-center w3-padding-32" style="margin-right:400px;">
      <div class="w3-bar">
      
      <c:if test="${a eq 'yes'}">
         <a href="admin_memberAll_artist?pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="admin_memberAll_artist?pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="admin_memberAll_artist?pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>      
      </div>
</div>
   
   </fieldset>
   </div>

<!-- 
<c:import url="../bottom.jsp" charEncoding="utf-8"/>
 -->
