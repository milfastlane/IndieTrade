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
function aaaa() {
	
	var a = $("#qnaboard_title").val();  
    var b = $("#qnaboard_content").val();  
   var c = $("#qnaboard_passwd").val(); 
   var d = $("#qnaboard_no").val();
   
   var flag = 0;
   
   if(a==""){
   	
   	alert('Please fill in the title')
   	$("#qnaboard_title").focus()
   	return;
   }
   if(b==""){
   	alert('Please fill in the content')
   	$("#qnaboard_content").focus()
   	return;
   } 
   if(c==""){
   	alert('Please fill in the passwd')
   	$("#qnaboard_passwd").focus()
   	return;
   }
   	
   flag = 1;
	$.ajax({
        url: '/indietrade/qnaboard_update',
        data: {qnaboard_title:a , qnaboard_content:b , qnaboard_passwd:c, qnaboard_no:d},
        type: 'POST',
        success: function(data){

	    if(flag==1 && data==0){
	    	alert('비밀번호가 올바르지 않습니다.')
	
	      }else{
	    	//  $("#id-modal").modal("hide");
	    	// $("#id_confirm-modal").modal("show");
	      	alert('수정 성공')
	      	location.href='qnamain'
	      }
        	//alert('asd')
           // location.reload();
        }
        
    });
}

/*
function a(){			
			var qnaboard_title = $("#qnaboard_title").val();  
		    var qnaboard_content = $("#qnaboard_content").val();  
		   var qnaboard_passwd = $("#qnaboard_passwd").val();   
		    var flag = 0;
		    	    
		    if(qnaboard_title==""){
		    	
		    	alert('Please fill in the title')
		    	$("#qnaboard_title").focus()
		    	return;
		    }
		    if(qnaboard_content==""){
		    	alert('Please fill in the content')
		    	$("#qnaboard_content").focus()
		    	return;
		    } 
		    if(qnaboard_passwd==""){
		    	alert('Please fill in the passwd')
		    	$("#qnaboard_passwd").focus()
		    	return;
		    }
		    	
		    flag = 1;
		    
		 //   alert('3개성공')
		    
		//    alert(flag)
		    
		    $.ajax({
		    	type: 'GET',
		    	url: "qnaboard_update",
		    	data: {
		    		qnaboard_title : $("#qnaboard_title").val(), 
		    		qnaboard_content : $("#qnaboard_content").val(), 
		    		qnaboard_passwd : $("#qnaboard_passwd").val()
		    	},
		    	success: function(res) {	    		
		    			alert('씹')
			    	 
		    	    	//if(flag==1 && data==0){
		    	    //	alert('비밀번호가 올바르지 않습니다.')
		    	
		    	     // }else{
		    	    	 // $("#id-modal").modal("hide");
		    	    	  //$("#id_confirm-modal").modal("show");
		    	     // 	alert('수정 성공')
		    	      	//location.href='qnamain'
		    	      //}		    	      
		    	   },
		    	   error: function (error) {
		    		    alert('실패.')
		    		}
		    });

}
*/

function b(){
	
	$("#qnaboard_title").val("");  
     $("#qnaboard_content").val("");  
    $("#qnaboard_passwd").val("");
	
}
</script>

<p><p>
<div align="center">
<input type="hidden" name="qnaboard_no" id="qnaboard_no" value="${getQnaBoard.qnaboard_no}"/>
	<table border=1>
	<tr>
    	<td>작성자</td> 
    	<td>${getQnaBoard.qnaboard_writer}</td>
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
				<button name="sm" id="sm" class="btn btn-primary" onclick="aaaa()">수정</button>
				<!-- <input type="submit" name="sm" id="sm" value="수정sss">  -->
				<button name="reset" id="reset" class="btn btn-primary" onclick="b()">취소</button>
				<input type="button" value="목록보기" class="btn btn-primary"	onclick="window.location='qnamain'">
			</td>	
	</tr>
</table>
</div>
<div class="spacer_"></div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />