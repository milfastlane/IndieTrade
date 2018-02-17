<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 95%;
    border: 1px solid #c7c7c7;
    margin-left:30px;
}

th , td {
    text-align: center !important;
    padding: 5px !important;
}

tr:nth-child(even) {
    background-color: #f2f2f2
}
.spacer_{
   height: 10px;
}
.spacer_20{
   height: 20px;
}
.spacer_60{
   height: 60px;
}
.group{
	margin-left:35px;
}

select, input{
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	height:30px;
}
</style>
<html>
<body>

<c:import url="../top.jsp" charEncoding="utf-8"/>
<script type="text/javascript">
	function checkDel(busking_no, busking_poster){
		var isDel = confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="busking_delete_artist?busking_no="+busking_no+"&busking_poster="+busking_poster
			
		}
	}
</script>
<div class="spacer_60"></div>
	<table border = "1">
		<tr>
			<th>번호</th>
			<th>공연명</th>
			<th>라인업</th>
			<th>버스킹 시간 (러닝타임)</th>
			<th>버스킹 장소</th>
			<th>포스터</th>
			<th>연락처</th>
			<th>수정|삭제</th>
		</tr>

		<c:if test="${empty buskingMyList}">
      <tr>
         <td colspan=8>신청한 버스킹 내역이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="list" items="${buskingMyList}">
      <tr>
      	<td>${list.busking_no}
        <td><a href="busking_view?busking_no=${list.busking_no}">${list.busking_name} </a></td>
        <td>${list.busking_username}</td>
        <td>${list.busking_time} ( ${list.busking_duration} 분)</td>
        <td>${list.busking_place}</td>
        <c:if test="${list.busking_poster!=null}">
        <td><img src="resources/buskingimg/${list.busking_poster}" style= "height : 150px ; width : 150px"></td>
        </c:if>
        <c:if test="${list.busking_poster==null}">
        <td><img src="resources/img/banner.jpg" style= "height : 150px ; width : 150px" alt="no image"></td>
        </c:if>
        <td>0${list.busking_contact}</td>
        <td>
			<a href="busking_edit?busking_no=${list.busking_no}">수정</a> | 
			<a href="javascript:checkDel('${list.busking_no}', '${list.busking_poster}')">삭제</a> </td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  <div class="spacer_"></div>
   <div align="center">
  <button class="btn btn-default" onclick="window.location.href='busking_main'">버스킹 메인</button>
</div>
</body>
</html>