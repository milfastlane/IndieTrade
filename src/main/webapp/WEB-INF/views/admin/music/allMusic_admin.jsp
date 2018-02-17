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
function music_del(music_no){
	 var inputed = music_no;
    $.ajax({
       url: 'music_del',
       data: {music_no:inputed},
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
        <li><a href="allMusicBoard_admin">전체 앨범</a></li>
        <li class="active"><a href="allMusic_admin">전체 음원</a></li>

      </ul><br>
     
    </div>
</div>
<div class="container-custom" style="margin-left:30px;">
<fieldset>

<!-- Form Name -->
<legend>전체 등록 음원 보기</legend>

<table class="table" style="width: auto !important">
     <thead>
   <tr>
   	  <th>no</th>
      <th>가수</th>
      <th>앨범이름</th>
      <th>노래제목</th>
      <th>노래파일제목</th>
      <th>삭제</th>
   </tr>
   </thead>
   
	<tbody>
    <c:if test="${empty allMusic_admin}">
      <tr>
         <td colspan=6>등록된 음원이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="dto" items="${allMusic_admin}">
      <tr>
        <td>${dto.music_no}</td>
        <td>${dto.music_artistname}</td>
        <td>${dto.music_musicboardname}</td>
        <td>${dto.music_name}</td>
        <td>${dto.music_filename}</td>
        <td><a href="javascript:music_del(${dto.music_no});">삭제</a>
       
      </tr>
      
     </c:forEach>
   </tbody>  
  </table>
  <div class="w3-center w3-padding-32" style="margin-right:400px;">
      <div class="w3-bar">
      
      <c:if test="${a eq 'yes'}">
         <a href="allMusic_admin?pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="allMusic_admin?pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="allMusic_admin?pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>      
      </div>
</div>
  
</fieldset>
</div>
