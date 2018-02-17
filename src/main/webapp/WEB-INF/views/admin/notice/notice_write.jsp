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
</style>
<script>



function check() {
	
	var title = $("#noticeboard_title").val();  
    var content = $("#noticeboard_content").val();  
   
   if(title==""){
   	
   	alert('Please fill in the title')
   	$("#noticeboard_title").focus()
   	return;
   }
   if(content==""){
   	alert('Please fill in the content')
   	$("#noticeboard_content").focus()
   	return;
   } 
   

	$.ajax({
        url: '/indietrade/admin_noticewrite',
        data: {noticeboard_title:title , noticeboard_content:content},
        type: 'POST',
        success: function(data){

	    if(data==1){
	    	alert('공지 입력 성공')
	    	location.href='admin_noticeindex'
	      }
        	
        }
        
    });
}

function rewrite(){

	$("#noticeboard_title").val("");  
   	$("#noticeboard_content").val(""); 
  
}
</script>

<p><p>

<h2 style="margin-left:20px;">공지사항 작성</h2>


<table border=1>	
    <tr>
    	<td>작성자</td> 
    	<td>관리자</td>
    </tr>
    <tr>
    	<td>제목</td> 
    	<td><input type="text" name="noticeboard_title" id="noticeboard_title" size="100" placeholder="제목을 입력해주세요"/> </td>
    </tr>
    <tr>
    	<td>공지내용</td> 
    	<td><textarea name="noticeboard_content" id="noticeboard_content" rows="4" cols="100" placeholder="공지 내용을 입력해주세요"></textarea></td>
    </tr>
	<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-primary" onclick="check();">글쓰기</button> 
				<input type="reset" class="btn btn-primary" onclick="rewrite();" value="다시작성">
				<input type="button" class="btn btn-primary" value="목록보기" onclick="window.location='admin_noticeindex'">
			</td>	
		</tr>
</table>




<!-- 
<c:import url="../bottom.jsp" charEncoding="utf-8" />
-->