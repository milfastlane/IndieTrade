<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:import url="../top.jsp" charEncoding="utf-8" />
<style>
.spacer_ {
   height: 80px;
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
	//listReply(); // **댓글 목록 불러오기
	//listReply(); // ** json 리턴방식
	
	listReply(); //** 댓글 목록 불러오기
	
	function a() {

		// ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)

		var replytext = $("#replytext").val();
		var bno = ${getQnaBoard.qnaboard_no};
		var param = "reply_text=" + replytext + "&qnaboard_no=" + bno;
		// alert(replytext)
		//alert(bno)
		//  alert(param)
		
		if(replytext==""){
		    	alert('Please fill in the replytext')
		    	return
		}
		
		$.ajax({
			type : "post",
			url : "insert_reply",
			async : false,
			data : param,
			success : function() {
				alert("댓글이 등록되었습니다.");
				listReply();
			}

		});
	}
	function b(){
		
		 if(confirm("정말 삭제하시겠습니까?")){
			 //alert('asd');
			 var rno = $("#aaa").attr('name');
			 var bno = ${getQnaBoard.qnaboard_no};
			 //alert('rno는 ' + rno)
			var param = "reply_no=" + rno + "&qnaboard_no=" + bno;
	
				$.ajax({
					type : "post",
					url : "delete_reply",
					async : false,
					data : param,
					success : function(result) {
					if(result==1){
						alert("댓글이 삭제되었습니다.");
					}else{
						alert("댓글 삭제 중에 오류가 발생했습니다.")
					}				
						listReply();				
					}

				});

         }
		
	}

	function listReply() {
		
		$.ajax({
			type : "get",
			url : "list_replies?qnaboard_no=${getQnaBoard.qnaboard_no}",
			success : function(result) {
	             //alert('성공')
	               //$("#mytable").html(result);
				 	var output = "";
	                for(var i in result){
	                    output += "<tr>";
	                    output += "<td>"+result[i].reply_writer;
	                    output += "("+changeDate(result[i].reply_regdate)+")<br>";
	                    output += result[i].reply_text
	                  	
	           
	                    if('${sessionScope.authuser}'==result[i].reply_writer){
	                    	//alert(result[i].rno)
	                    	//alert('asd')
	                    	var a = result[i].reply_no;
	         output += " <input id=\"aaa\" name="+ result[i].reply_no +" type=\"button\" align=\"right\" class=\"btn btn-default btn-xs\" value=\"삭제\" onclick=\"b();\"/>" ;
	                    }else{                                   
	                    	//alert('쉿')
	                    }
	  
	                    output += "</td>";
	                    
	                    output += "<tr>";
                  
	                }
	                
				   $("#listReply").html(output);
					
			},
			error : function(result){
				alert('실패')
			}
		
		});
	}

	// **날짜 변환 함수 작성
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute
				+ ":" + second;
		return strDate;
	}

</script>

<p>

	
<div align="center">
<h3>게시글 보기</h3>
	<table border="1" width="600">
		<tr>
			<th width="15%">글번호</th>
			<td align="center" width="35%">${getQnaBoard.qnaboard_no}</td>
			<th width="15%">조회수</th>
			<td align="center" width="35%">${getQnaBoard.qnaboard_viewcnt}</td>
		</tr>
		<tr>
			<th width="15%">작성자</th>
			<td align="center" width="35%">${getQnaBoard.qnaboard_writer}</td>
			<th width="15%">작성일</th>
			<td align="center" width="35%">${getQnaBoard.qnaboard_regdate}</td>
		</tr>
		<tr>
			<th width="15%">글제목</th>
			<td align="center" colspan="3">${getQnaBoard.qnaboard_title}</td>
		</tr>
		<tr>
			<th width="15%">글내용</th>
			<td colspan="3">${getQnaBoard.qnaboard_content}</td>
		</tr>

		<tr>
			<td colspan="4" align="right"><c:if
					test="${sessionScope.userid == getQnaBoard.qnaboard_writer}">

					<input type="button" value="글수정" class="btn btn-primary" 
						onclick="window.location='qnaboard_update?qnaboard_no=${getQnaBoard.qnaboard_no}'">
					<input type="button" value="글삭제" class="btn btn-primary" 
						onclick="window.location='qnaboard_delete?qnaboard_no=${getQnaBoard.qnaboard_no}'">

				</c:if> <input type="button" value="글목록" class="btn btn-primary"  
				onclick="window.location='qnamain'"></td>
		</tr>
		<tr>
		<td colspan="4">
		<textarea rows="5"  style="margin-top:10px; margin-left:8px; width:650px;" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
		</td>
		</tr>
		<tr>
		<td colspan="4" align="right">
			<c:choose>
				<c:when test="${empty sessionScope.userid}">
					<button type="button" id="btnReply" class="btn btn-primary"
						onclick="a()" disabled>댓글 작성</button>
				</c:when>
				<c:otherwise>
					<button type="button" id="btnReply" class="btn btn-primary"
						onclick="a()">댓글 작성</button>
				</c:otherwise>
			</c:choose>
			</td>
			</tr>

	<!-- **댓글 목록 출력할 위치 -->
	<tr>
	<td colspan="4">
	 <div id="listReply"></div></td></tr>
	</table>
 
</div>

 <div class="spacer_"></div>  

