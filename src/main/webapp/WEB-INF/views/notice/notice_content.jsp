<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:import url="../top.jsp" charEncoding="utf-8" />
<style>
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 60%;
    border: 1px solid #ddd;
    margin-left:13px;
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
   height: 30px;
}
</style>
<script>
</script>


<p><p>
<!-- 메인에서 오는 공지컨텐츠 화면 -->
<h2 align="center">공지사항 글 보기</h2>
<div align="center">
	<table border="1" width="500">
		<tr>
			<th width="15%">글번호</th>
			<td align="center" width="35%">${getNoticeBoard.noticeboard_no}</td>
			<th width="15%">조회수</th>
			<td align="center" width="35%">${getNoticeBoard.noticeboard_viewcnt}</td>
		</tr>
		<tr>
			<th width="15%">작성자</th>
			<td align="center" width="35%">관리자</td>
			<th width="15%">작성일</th>
			<td align="center" width="35%">${getNoticeBoard.noticeboard_regdate}</td>
		</tr>
		<tr>
			<th width="15%">글제목</th>
			<td align="center" colspan="3">${getNoticeBoard.noticeboard_title}</td>
		</tr>
		<tr>
			<th width="15%">글내용</th>
			<td colspan="3">${getNoticeBoard.noticeboard_content}</td>
		</tr>

		<tr>
			<th colspan="4">
				<input type="button" value="메인" class="btn btn-primary" 
					onclick="window.location='/indietrade/'"><!-- ★★★★★ --></th>
		</tr>
	</table>
    <div class="spacer_"></div>    
 
</div>



<c:import url="../bottom.jsp" charEncoding="utf-8" />
