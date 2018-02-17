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
<script>
function snspage_del(user_no){
	 var inputed = user_no;
    $.ajax({
       url: 'snspage_del',
       data: {user_no:inputed},
       type: 'POST',
       success: function(result){
    	   location.reload();
       }
   });
}
</script>

<p></p>
<div class="row content" style="margin-left:20px;">
    <div class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="allSns_admin">전체 SNS</a></li>

      </ul><br>
     
    </div>
</div>

<div class="container-custom" style="margin-left:30px;">
<fieldset>

<!-- Form Name -->
<legend>SNS 전체 보기</legend>

<table class="table" style="width: 80%">
   <thead>
   <tr>
      <th>no</th>
      <th>아이디</th>
      <th>페이지 이름</th>
      <th>정지/삭제</th>
   </tr>
   </thead>
   <tbody>
    <c:if test="${empty allSns_admin}">
      <tr>
         <td colspan=6>등록된 회원이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="dto" items="${allSns_admin}">
      <tr>
        <td>${dto.user_no}</td>
        <td>${dto.snspage_artistid}</td>
        <td>${dto.snspage_name}</td>
        <th><a href="javascript:snspage_del(${dto.user_no});">삭제</a></th>
      </tr>
      
     </c:forEach>
   </tbody>   
</table>

<div class="w3-center w3-padding-32" style="margin-right:400px;">
      <div class="w3-bar">
      
      <c:if test="${a eq 'yes'}">
         <a href="allSns_admin?pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="allSns_admin?pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="allSns_admin?pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>      
      </div>
</div>
  
</fieldset>
</div>
 