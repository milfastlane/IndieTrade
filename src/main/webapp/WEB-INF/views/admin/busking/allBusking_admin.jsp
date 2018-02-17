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
	function checkDel(busking_no, busking_poster){
		var isDel = confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="busking_delete?busking_no="+busking_no+"&busking_poster="+busking_poster
		}
	}
	
	
	function chsuccess(busking_no , busking_visibility){
			var input = busking_no;
			var input2 = busking_visibility;
			$.ajax({
	           url: 'busking_approval',
	           data: {busking_no:input , busking_visibility:input2},
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
        <li class="active"><a href="busking_admin">공연 관리</a></li>
      </ul><br>
     
    </div>
</div>
<div class="container-custom" style="margin-left:30px;">
<fieldset>

<!-- Form Name -->
<legend>등록 공연 전체 보기</legend>

<table class="table" style="width: 80%">
		<caption>승인 대기 목록</caption>
		<tr>
			<th>번호</th>
			<th>공연명</th>
			<th>라인업</th>
			<th>버스킹 시간 (러닝타임)</th>
			<th>버스킹 장소</th>
			<th>연락처</th>
			<th>view | 삭제</th>
		</tr>
		
		<c:if test="${empty buskingList}">
      <tr>
         <td colspan=8>신청된 버스킹 내역이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="list" items="${buskingList}">
      <tr>
      	<td>${list.busking_no}
        <td><a href="busking_view?busking_no=${list.busking_no}">${list.busking_name} </a></td>
        <td>${list.busking_username}</td>
        <td>${list.busking_time} ( ${list.busking_duration} 분)</td>
        <td>${list.busking_place}</td>
        <td>0${list.busking_contact}</td>
        <td>
        <c:choose>
        	<c:when test="${list.busking_visibility eq 0}">
        	<a href="javascript:chsuccess('${list.busking_no}', 1);">승인</a> |
        	</c:when>
        	<c:otherwise>
        	<a href="javascript:chsuccess('${list.busking_no}', 0);">승인 해지</a> |
        	
        	</c:otherwise>
        </c:choose>
			
			<a href="javascript:checkDel('${list.busking_no}', '${list.busking_poster}')">삭제</a> </td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  <div class="w3-center w3-padding-32" style="margin-right:400px;">
      <div class="w3-bar">
      
      <c:if test="${a eq 'yes'}">
         <a href="busking_admin?pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="busking_admin?pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="busking_admin?pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>      
      </div>
</div>
  
</fieldset>
</div>
<!-- 
<c:import url="../bottom.jsp" charEncoding="utf-8"/>
 -->
