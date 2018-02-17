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
<script>
function check(){
	if (f.qnaboard_title.value==""){
		alert("제목을 입력해 주세요!!")
		f.qnaboard_title.focus()
		return false
	}
	if (f.qnaboard_content.value==""){
		alert("내용을 입력해 주세요!!")
		f.qnaboard_content.focus()
		return false
	}
	if (f.qnaboard_passwd.value==""){
		alert("비밀번호를 입력해 주세요!!")
		f.qnaboard_passwd.focus()
		return false
	}
	 $("#f").submit();
}
</script>

<div class="spacer_"></div>
<div align="center">
<h3>게시글 작성</h3>

<form name="f" id="f" action="qnaboard_write" onsubmit="return check()" method="post">
<table border=1>
	
    <tr>
    	<td>작성자</td> 
    	<td>${dto.user_id}</td>
    </tr>
    <tr>
    	<td>제목</td> 
    	<td><input type="text" name="qnaboard_title" id="qnaboard_title" size="80" placeholder="제목을 입력해주세요"/> </td>
    </tr>
    <tr>
    	<td>문의내용</td> 
    	<td><textarea name="qnaboard_content" id="qnaboard_content" rows="4" cols="80" placeholder="문의내용을 입력해주세요"></textarea></td>
    </tr>
    <tr>
    	<td>비밀번호</td> 
    	<td><input type="password" name="qnaboard_passwd" id="qnaboard_passwd" size="80" placeholder="비밀번호를 입력해주세요"/> </td>
    </tr>
	<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-primary" value="글쓰기">
				<input type="reset" class="btn btn-primary" value="다시작성">
				<input type="button" class="btn btn-primary" value="목록보기" onclick="window.location='qnamain'">
			</td>	
		</tr>
</table>

</form> 
</div>
<div class="spacer_"></div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />