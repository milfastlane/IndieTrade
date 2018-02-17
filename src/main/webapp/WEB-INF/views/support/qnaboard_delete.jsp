<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="../top.jsp" charEncoding="utf-8" />
<style>
.spacer_ {
   height: 50px;
}
.spacer_20 {
   height: 20px;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
/*     width: 90%;  */
    border: 1px solid #c7c7c7;
    margin-left:3px;
}

th {
    text-align: center;
    padding: 10px;
}
td {
/*     text-align: left; */
    padding: 15px;
}

tr:nth-child(even) {
    background-color: #f2f2f2
}
</style>

<p>
	<div align="center">
	<h3>글삭제</h3>
	<form name="f" action="qnaboard_delete" method="post">
		<input type="hidden" name="qnaboard_no" value="${param.qnaboard_no}"/>
		<table border="1" width="300">
			<tr>
				<th>비밀번호를 입력해 주세요</th>
			</tr>
			<tr>
				<td align="center">
					비밀번호 : <input type="password" name="passwd" class="box">
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" class="btn btn-primary" value="글삭제">
					<input type="button" value="글목록" class="btn btn-primary" onclick="window.location='qnamain'">
				</td>
			</tr>
		</table>
	</form>
</div>
</div>


<div class="spacer_"></div>
<c:import url="../bottom.jsp" charEncoding="utf-8" />