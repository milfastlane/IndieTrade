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
    border: 1px solid #c7c7c7;
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
.spacer_40{
   height: 40px;
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

<script>
    // 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    //function list(page){
    //   location.href="${path}/board/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    //}
    
    function a(){
		  var searchOption = $("#searchOption").val();  
		   var searchString= $("#searchString").val();  
		    
	 document.location.href="qnaboard_search?searchOption="+searchOption+"&searchString="+searchString;
	
    }      
</script>
<p><p>
	<div align="center">
    <h2>Q & A 게시판</h2>
    </div>
<div class="spacer_"></div>  
    <div align="center" style="margin-right:60px;">	
        <select name="searchOption" id="searchOption" style="border-radius: 4px;">
           <!--    검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all">ALL</option>
            <option value="name">이름</option>
            <option value="content">내용</option>
            <option value="title">제목</option>
        </select>
        <input type="text" name="searchString" id="searchString" value="${searchString}" style="border-radius: 4px;">
         <button type="button" name="search" id="search" class="btn btn-primary" onclick="a();">조회</button> 
    <!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
    <c:if test="${sessionScope.authuser != null}">
        <button type="button" class="btn btn-primary" onclick="location.href='qnaboard_write'">글쓰기</button>
    </c:if>
</div>
	<br>
   <!--  레코드의 갯수를 출력--> 
<h6 style="margin-left:50px; margin-top:-15px;">${count}개의 게시물이 있습니다.</h6>

    
    <table border="1" width="600px">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>이름</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
     <c:if test="${empty qnaboardlist}">
      <tr>
         <td colspan=5>등록된 QNA 글이 없습니다.</td>
      </tr>   
     </c:if>    
     <c:forEach var="dto" items="${qnaboardlist}">
        <tr>
            <td>${dto.qnaboard_no}</td>
            
            <!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
            <td>
                <a href="qnaboard_content?qnaboard_no=${dto.qnaboard_no}">${dto.qnaboard_title} 
                    <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                    <c:if test="${dto.qnaboard_recnt > 0}">
                        <span style="color: red;">(${dto.qnaboard_recnt})</span>
                    </c:if>
                </a>
            </td>
            
            <td>${dto.qnaboard_writer}</td>
            
            <td>
                <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
                <fmt:formatDate value="${dto.qnaboard_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            
            <td>${dto.qnaboard_viewcnt}</td>
            
        </tr>    
      </c:forEach>
</table>
<div class="spacer_20"></div>

<div class="w3-center w3-padding-32" align="center"> 
      <div class="w3-bar">
      
      <c:if test="${a eq 'yes'}">
         <a href="qnaboard_search?searchOption=${searchOption}&searchString=${searchString}&pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="qnaboard_search?searchOption=${searchOption}&searchString=${searchString}&pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="qnaboard_search?searchOption=${searchOption}&searchString=${searchString}&pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>      
      </div>
</div>
<div class="spacer_40"></div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />