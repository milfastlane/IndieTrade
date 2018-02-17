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
    padding-top: 15px; 
} 
</style>

<script>
   
    
    // 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    //function list(page){
    //   location.href="${path}/board/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    //}
    
    function a(){

		  var searchOption = $("#searchOption").val();  
		   var searchString= $("#searchString").val();  
		    
	 document.location.href="admin_membersearch?searchOption="+searchOption+"&searchString="+searchString;
	
    }   
    
</script>

<div class="row content">
    <div class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
            
             <li class="active"><a href="admin_memberAll">전체 회원</a></li>
                  <li><a href="admin_memberAll_artist">가수 회원</a></li>
                  <li><a href="admin_memberAll_fan">팬 회원</a></li>
                  <li><a href="admin_unregisteredAll">탈퇴 이력</a></li>
      </ul><br>
     
    </div>
</div>
<p>
<div class="container-custom" style="margin-left:30px;">
<fieldset>
 
<!-- Form Name -->
<legend>조건에 맞는 회원 보기</legend>

    	
        <select name="searchOption" id="searchOption">
           <!--    검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="name">이름</option>
            <option value="id">아이디</option>
        </select>
         <input type="text" name="searchString" id="searchString" value="${searchString}">
         <button type="button" name="search" id="search" onclick="a();">조회</button> 

    
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
      <th>강제탈퇴</th>
   </tr>
   </thead>
   <tbody>
    <c:if test="${empty userAllList}">
      <tr>
         <td colspan=6>등록된 회원이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="dto" items="${userAllList}">
      <tr>
        <td>${dto.user_name}</td>
        <td>${dto.user_id}</td>
        <td>${dto.user_phone}</td>
        <td>${dto.user_authority}</td>
        <td>${dto.user_joindate}</td>
        <td>${dto.user_lastvisit}</td>
        <td align="center">${dto.user_totalvisit}</td>
        <td><a href="admin_terminate?user_no=${dto.user_no}">강제탈퇴</a></td>
      </tr>
      
     </c:forEach>
   </tbody>   
</table>


<div class="w3-center w3-padding-32">
      <div class="w3-bar">
      
        <c:if test="${a eq 'yes'}">
 
         <a href="admin_membersearch?searchOption=${searchOption}&searchString=${searchString}&pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="admin_membersearch?searchOption=${searchOption}&searchString=${searchString}&pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="admin_membersearch?searchOption=${searchOption}&searchString=${searchString}&pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>    
      </div>
</div>
   
   
   </fieldset>
   </div>
<!-- 
<c:import url="../bottom.jsp" charEncoding="utf-8"/>
 -->
