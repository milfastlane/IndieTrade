<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="../top.jsp" charEncoding="utf-8" />
<style>
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 95%;
    border: 1px solid #ddd;
    margin-left:30px;
}

th {
    text-align: center;
    padding: 10px;
}
td {
    text-align: left;
    padding: 15px;
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
.group{
	margin-left:35px;
}
</style>

<script>
   
   function a(){
	   var choice = $('input[name="choose"]:checked').val();
	   if(choice==null){
		   alert('대표 공지사항을 선택해 주세요')
		   return
	   }
	   
	   document.location.href="admin_noticerepresent?noticeboard_no="+choice;
	   
	   
	   
	   //alert(a)
	  
	
   }
  
</script>
<p><p>
	<div align="center">
    <h2>NOTICE BOARD</h2>
    </div>
<div class="group">
    <button type="button" class="btn btn-primary" onclick="location.href='admin_noticewrite'">글쓰기</button>
  
  <div class="spacer_"></div> 
  
   <button type="button" class="btn btn-primary" onclick="a();">대표공지사항지정</button>

   
   <div class="spacer_"></div> 
   
   <!--  레코드의 갯수를 출력--> 
   ${count}개의 공지사항이 있습니다.
</div>
    <div class="spacer_"></div>    
    <table border="1" width="600px">
        <tr>
        	<th>선택</th>
            <th>번호</th>
            <th>제목</th>
            <th>이름</th>
            <th>작성일</th>
            <th>조회수</th>
 
        </tr>
     <c:if test="${empty noticeboardlist}">
      <tr>
         <td colspan=5>등록된 공지사항이 없습니다.</td>
      </tr>   
     </c:if>    
     <c:forEach var="dto" items="${noticeboardlist}">
        <tr>
        
        	<td><input type="radio" id="choose" name="choose" value="${dto.noticeboard_no}"></td>
            <td>${dto.noticeboard_no}</td>
            
            <!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
            <td>
                <a href="admin_noticecontent?noticeboard_no=${dto.noticeboard_no}">${dto.noticeboard_title}
                </a>
            </td>
            
            <td>관리자</td>
            
            <td>
                <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
                <fmt:formatDate value="${dto.noticeboard_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            
            <td>${dto.noticeboard_viewcnt}</td>
   
        </tr>    
      </c:forEach>
      
  
</table>
<!-- onclick="location.href='admin_noticerepresent'" -->


<div class="spacer_20"></div>
<div class="w3-center w3-padding-32" align="center">
      <div class="w3-bar">
      
      <c:if test="${a eq 'yes'}">
         <a href="admin_noticeindex?pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="admin_noticeindex?pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="admin_noticeindex?pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>      
      </div>
</div>
   

<!-- 
<c:import url="../bottom.jsp" charEncoding="utf-8" />
 -->