<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:import url="../top.jsp" charEncoding="utf-8" />
<style type="text/css">
@import
	url(http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700);

@import
	url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);

body {
	background: #fff;
	font-family: 'Roboto', sans-serif;
	color: #333;
	line-height: 22px;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color: #111;
	margin-top: 5px;
	margin-bottom: 5px;
}

h1, h2, h3 {
	text-transform: uppercase;
}

input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 12px;
	cursor: pointer;
	opacity: 1;
	filter: alpha(opacity = 0);
}
#file{
   position: relative;
   text-align: right;
   -moz-opacity:0 ;
   filter:alpha(opacity: 0);
   opacity: 0;
   z-index: 2;
}

.account-box {
	border: 2px solid rgba(153, 153, 153, 0.75);
	border-radius: 7px;
	-moz-border-radius: 7px;
	-webkit-border-radius: 7px;
	-khtml-border-radius: 7px;
	-o-border-radius: 7px;
	z-index: 3;
	font-size: 13px !important;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	background-color: #ffffff;
	padding: 20px;
	 margin-left : 240px;
    margin-right : -180px;
}
.account-box .btn:hover {
	color: #fff;
}
.or-box {
	position: relative;
	border-top: 1px solid #dfdfdf;
	padding-top: 20px;
	margin-top: 20px;
}

.form-inline .form-group {
	margin-left: 0;
	margin-right: 0;
}
.control-label {
	color: #333333;
}
.btn_file input[type=file] {
    position: absolute;
    overflow: hidden;
    clip: rect(0,0,0,0);
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    border: 0;
}
.btn_file label .btn2 {
    color: #333;
}
.btn_file label {
    display: inline-block;
    width: 77px;
    height: 33px;
    cursor: pointer;
}
.btn_file {
    position: relative;
    display: inline-block;
    float: left;
    margin-left: 8px;
}
.btn_model .btn1, .btn_model .btn2, .btn_model .btn3 {
    min-width: 78px;
    height: 33px;
    padding: 10px 12px 0;
    color: #a3a3a3;
    margin-left: 0px;
    margin-top:-25px;
}
.btn_model b, .btn_model>em, .btn_model>span {
    display: inline-block;
    overflow: hidden;
    text-align: center;
    vertical-align: top;
    letter-spacing: -1px;
}
.btn_model .btn2 {
    border: 1px solid #bfbfbf;
    background: #fff;
}
.btn_area_btm { 
    overflow: hidden;
    margin-left: -8px;
    padding-top: 27px;
    text-align: left;
    margin-bottom: -50px;
    
}
.btn_model {
    font-size: 12px;
    line-height: 14px;
    display: inline-block;
    vertical-align: top;
    text-decoration: none!important;
}
table, textarea {
    font-family: 돋움, Dotum, sans-serif;
    font-size: 12px;
}
.btn_area_btm .btn_model .btn_disable {
    color: #c2c2c2;
}
.btn_model[href] .btn2 {
    color: #333;
    border-radius: 4px;
}

.btn_model[href] b, .btn_model[href]>em, .btn_model[href]>span {
    cursor: pointer;
}

</style>
<script>
function PreviewImage() {
    var oFReader = new FileReader();
    oFReader.readAsDataURL(document.getElementById("musicboard_imgname").files[0]);

    oFReader.onload = function (oFREvent) {
        document.getElementById("albumview_img").src = oFREvent.target.result;
    };
};
function del(){
    
    $("#musicboard_imgname").val("");
     $("#albumview_img").attr("src","./resources/img/album.jpg");
 }


 function check(){
	 
	 var chrTmp;
	 var inputed = $("#musicboard_name").val();
	 var strLen = inputed.length;

	 if(strLen > 0){
		   for (var i=0; i<inputed.length; i++)
	        {
	            chrTmp = inputed.charCodeAt(i);
	            if (!((chrTmp > 47 && chrTmp < 58) || (chrTmp > 64 && chrTmp < 91) || (chrTmp > 96 && chrTmp < 123) || (chrTmp > 44031 && chrTmp < 55203) || (chrTmp > 12592 && chrTmp < 12644)))
	            {
	            	alert('앨범명은 영문,한글,숫자만 빈 칸 없이 입력해주세요.')
	            	$("musicboard_name").focus();
	                return false;
	            }
	          
	        }
	 }
	 
		
	document.getElementById("step1").submit();
		 
	 
 }
 

</script>
<p>
<form class="form-horizontal" action="writeForm_step2" method="post" enctype="multipart/form-data" 
onsubmit="check(); return false;" id="step1">
<div class="container">
	<div class="row">
		<div class="col-md-8">
			<div class="account-box">
				<h2 class="entry-title">
					<span>앨범 등록</span>
					<div align="right">
					<font size="3">
						<font color="red">step1</font> | step2 | step3</font>
					</div>
				</h2>
				
				<hr>
				
					<div class="form-group">
						<label class="control-label col-sm-3">앨 범 이 름 <span
							class="text-danger">*</span></label>
						<div class="col-md-5 col-sm-5">
								


								
								 <input type="text" class="form-control" name="musicboard_name" id="musicboard_name"
								 placeholder="Only allowed Letters and numbers" maxlength="16" autocomplete="off" required autofocus>
								
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3">가 수 이 름 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<input type="text" class="form-control" name="musicboard_artistname" id="musicboard_artistname" maxlength="30" value="${sessionScope.username}" disabled="disabled">
						<input type="hidden" value="${sessionScope.userno}" name="musicboard_artistno">
						</div>
					</div>
					

					<div class="form-group">
						<label class="control-label col-sm-3">장르 <span
							class="text-danger">*</span></label>
						<div class="col-xs-8">
							<div class="form-inline">
								<div class="form-group">
									<select id="musicboard_genre" name="musicboard_genre" class="form-control">
									<c:forEach var="clist" items="${clist}" begin="0" end="${fn:length(clist)}" step="1">
										<c:if test="${clist.category_major eq 'MUSIC'}">
										<option value="${clist.category_minor}">${clist.category_minor}</option>
										</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">발매일 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<input type="date" class="form-control" name="musicboard_releasedate" 
								id="musicboard_releasedate" maxlength="30" placeholder="" autocomplete="off" required>
						</div>
					</div>
				<div class="form-group">
						<label class="control-label col-sm-3">앨범 설명 <span
							class="text-danger"></span></label>
						<div class="col-md-8 col-sm-9">
							<textarea name="musicboard_content" id="musicboard_content" rows="13" cols="50" class="box"></textarea>
						</div>
					</div>
					<div class="form-group">
						   <label class="control-label col-sm-3">앨범 사진<br>
						   <small>권장비율(1:1)</small></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                           <div class="tdcell">
                            <div class="profile_photo">                              
                        <img id="albumview_img" name="albumview_img" style="width: 100%; height: 400;" 
                        src="/resources/img/album.jpg"
                        onerror="this.src='/indietrade/resources/img/album.jpg'"/>
                            </div>
                            <p class="btn_area_btm">
                                <span class="btn_file" >
                                    <label for="musicboard_imgname" class="btn_model"><b id="btnChangeProfile" class="btn2" style="border-radius: 4px;" >사진변경</b></label>
                                    <input type="file" name="musicboard_imgname" class="form-control upload" id="musicboard_imgname" onchange="PreviewImage();"/>
                                </span>
                                <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2" onclick="del()">삭제</b></a>
                            </p>
                        </div>      
                     </div>
                     </div>
					</div>
					<br>
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-10">
						<span><font color="red">※한번 등록된 앨범은 삭제 수정이 불가능합니다※</font></span><br>
						<button onclick="history.go(-1); return false;" class="signupbtn btn btn-default" >뒤로</button>
						<button type="submit" class="signupbtn btn btn-default" >다음</button>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
	</form>
<p>
<c:import url="../bottom.jsp" charEncoding="utf-8" />
