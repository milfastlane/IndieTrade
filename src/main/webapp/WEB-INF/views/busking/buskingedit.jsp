<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div id="top_template">
<c:import url="../top.jsp" charEncoding="utf-8" />
</div>

<!-- 
<sec:authorize access="isAuthenticated()">   
    <%// response.sendRedirect("main"); %>
</sec:authorize>
-->

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



 #loader {
    bottom: 0;
    height: 175px;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: 0;
    width: 175px;
}
#loader {
    bottom: 0;
    height: 175px;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: 0;
    width: 175px;
}
#loader .dot {
    bottom: 0;
    height: 100%;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: 0;
    width: 87.5px;
}
#loader .dot::before {
    border-radius: 100%;
    content: "";
    height: 87.5px;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    transform: scale(0);
    width: 87.5px;
}
#loader .dot:nth-child(7n+1) {
    transform: rotate(45deg);
}
#loader .dot:nth-child(7n+1)::before {
    animation: 0.8s linear 0.1s normal none infinite running load;
    background: #00ff80 none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+2) {
    transform: rotate(90deg);
}
#loader .dot:nth-child(7n+2)::before {
    animation: 0.8s linear 0.2s normal none infinite running load;
    background: #00ffea none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+3) {
    transform: rotate(135deg);
}
#loader .dot:nth-child(7n+3)::before {
    animation: 0.8s linear 0.3s normal none infinite running load;
    background: #00aaff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+4) {
    transform: rotate(180deg);
}
#loader .dot:nth-child(7n+4)::before {
    animation: 0.8s linear 0.4s normal none infinite running load;
    background: #0040ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+5) {
    transform: rotate(225deg);
}
#loader .dot:nth-child(7n+5)::before {
    animation: 0.8s linear 0.5s normal none infinite running load;
    background: #2a00ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+6) {
    transform: rotate(270deg);
}
#loader .dot:nth-child(7n+6)::before {
    animation: 0.8s linear 0.6s normal none infinite running load;
    background: #9500ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+7) {
    transform: rotate(315deg);
}
#loader .dot:nth-child(7n+7)::before {
    animation: 0.8s linear 0.7s normal none infinite running load;
    background: magenta none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+8) {
    transform: rotate(360deg);
}
#loader .dot:nth-child(7n+8)::before {
    animation: 0.8s linear 0.8s normal none infinite running load;
    background: #ff0095 none repeat scroll 0 0;
}
#loader .lading {
    background-image: url("../images/loading.gif");
    background-position: 50% 50%;
    background-repeat: no-repeat;
    bottom: -40px;
    height: 20px;
    left: 0;
    position: absolute;
    right: 0;
    width: 180px;
}
@keyframes load {
100% {
    opacity: 0;
    transform: scale(1);
}
}
@keyframes load {
100% {
    opacity: 0;
    transform: scale(1);
}
}
 
.spacer_ {
	height: 20px;
}
</style>
<script>
    
    function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("file").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };
    
   function del(){
      $("#file").val("");
       $("#uploadPreview").attr("src","./resources/img/banner.jpg");
      $("#file").css('color', 'transparent');
   }
    
   
   function addOption(){
       var frm = document.kk1;
       var op = new Option();
          op.value = 1+frm.dd.length; // 값 설정
           op.text = 1+frm.dd.length;
           frm.dd.options.add(op);
           op.selected = true;
           
   }
   
   $( function() {
	    $( "#datepicker" ).datepicker();
	  } );
</script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<div id="custom_loading">
<div class="container">
   <div class="row">
      <div id="loader">
          <div class="dot"></div>
         <div class="dot"></div>
         <div class="dot"></div>
         <div class="dot"></div>
         <div class="dot"></div>
         <div class="dot"></div>
         <div class="dot"></div>
         <div class="dot"></div>
         <div class="lading"></div>
               <h4 style="margin-top: 180px; color:gray;">
				<b> 요청 처리중입니다...</b></h4>
      </div>
   </div>
</div>
</div>

<p>

<div id="custom_signin">
<div class="container">
   <div class="row">
      <div class="col-md-8">
         <div class="account-box">

            <h2 class="entry-title">
               <span>Edit Page</span>
            </h2>
            
            <hr>
            <form class="form-horizontal" action="busking_edit" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                 <label class="control-label col-sm-3">버스킹 명 <span
                     class="text-danger">*</span></label>
                 <div class="col-md-8 col-sm-9">
                        <input type="text"
                           class="form-control" name="busking_name" id="busking_name" value="${getBusking.busking_name}"
                           placeholder="Enter Event Name" maxlength="16" autocomplete="off" required autofocus>
                     </div>
                  </div>
  
    	<div class="form-group">
                 <label class="control-label col-sm-3">버스킹 날짜 <span
                     class="text-danger">*</span></label>
              <div class="col-md-8 col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon">
                    <i class="glyphicon glyphicon-calendar"></i></span>
                     <input type="date" class="form-control" value="${getBusking.busking_date}" name="busking_date">
                  </div>
              </div>
          </div>
  
               <div class="form-group">
                  <label class="control-label col-sm-3">버스킹 시간 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                  <div class="input-group">
                   <span class="input-group-addon">
                    <i class="fa fa-clock-o" aria-hidden="true"></i></span>
                     <input type="time" class="form-control" value="${getBusking.busking_time}" name="busking_time">
                  </div>
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label col-sm-3">공연 러닝 타임(분)</label>
                  <div class="col-md-5 col-sm-5">
                 	<div class="input-group">
                   <span class="input-group-addon">
                    <i class="fa fa-music" aria-hidden="true"></i></span>
			 <input type="text" value="${getBusking.busking_duration}" class="form-control" name="busking_duration" 
			 id="busking_duration" maxlength="40" autocomplete="off" required>
                     </div>
                     </div>
                     </div>
                     
               <div class="form-group">
                  <label class="control-label col-sm-3">버스킹 장소 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                   <div class="input-group">
                   <span class="input-group-addon">
                    <i class="fa fa-map-marker" aria-hidden="true"></i></span>
                       <input type="text"
                           class="form-control" value="${getBusking.busking_place} " name="busking_place" id="busking_place" placeholder="거주지를 입력해주세요" maxlength="40" required>
                     </div>
                  </div>
               </div>
              <div class="form-group">
                  <label class="control-label col-sm-3">예약 링크</label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                      <span class="input-group-addon">
                    <i class="fa fa-link" aria-hidden="true"></i></span>
                         <input type="text"
                           class="form-control" value="${getBusking.busking_bookinglink}" name="busking_bookinglink" id="busking_bookinglink"
                           required>
                     </div>
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label col-sm-3">입장료 (원)<span
                     class="text-danger">*</span></label>
                  <div class="col-md-5 col-sm-8">
                         <input type="text"
                           class="form-control" name="busking_ticketprice" value="${getBusking.busking_ticketprice}" id="busking_ticketprice"
                           required>
                     </div>
                  </div>
  
               <div class="form-group">
                  <label class="control-label col-sm-3">출연진들 </label>
                  <div class="col-md-5 col-sm-8">
                                     <div class="input-group">
                   <span class="input-group-addon">
                    <i class="fa fa-users" aria-hidden="true"></i></span>
                       <input type="text"
                           class="form-control" value="${getBusking.busking_username}" name="busking_username" id="busking_username"
                             required />
                     </div>
                  </div>
               </div>
            <div class="form-group">
                  <label class="control-label col-sm-3">주최 </label>
                  <div class="col-md-5 col-sm-8">
                        <input type="text"
                           class="form-control" value="${getBusking.busking_host}" name="busking_host" id="busking_host"
                             required>
                     </div>
                  </div>
        
              <div class="form-group">
                  <label class="control-label col-sm-3">후원</label>
                  <div class="col-md-5 col-sm-8">
                        <input type="text"
                           class="form-control" name="busking_sponsor" id="busking_sponsor" value="${getBusking.busking_sponsor}"
                             required>
                     </div>
                  </div>

       <div class="form-group">
                  <label class="control-label col-sm-3">연락처 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-5 col-sm-8">
                                     <div class="input-group">
                   <span class="input-group-addon">
                    <i class="fa fa-mobile" aria-hidden="true"></i></span>
                         <input type="text"
                           class="form-control" name="busking_contact" id="busking_contact" value="${getBusking.busking_contact}"
                           placeholder="Enter your Primary contact no."autocomplete="off" maxlength="11" required>
                     </div>
                  </div>
               </div>
                
               
              <div class="form-group">
                     <label class="control-label col-sm-3">포스터<br>
                     <small>권장비율(3:1)</small></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                           <div class="tdcell">
                            <div class="profile_photo">                              
                         <img id="uploadPreview" style="width: 300px; height: 100px;" src="./resources/img/banner.jpg" />
                            </div>
                            <p class="btn_area_btm">
                                <span class="btn_file" >
                                	<input type="hidden" id="busking_poster" name="busking_poster" value="${getBusking.busking_poster}"/>
                                	<input type="hidden" id="busking_no" name="busking_no" value="${getBusking.busking_no}"/>
                                    <label for="file" class="btn_model"><b id="btnChangeProfile" class="btn2" style="border-radius: 4px;">사진변경</b></label>
                                    <input type="file" name="file" class="form-control upload" id="file" onchange="PreviewImage();" onclick="a()" />
                                </span>
                                <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2" onclick="del()">삭제</b></a>
                            </p>
                        </div>      
                     </div>
                     </div>
               </div>
               <div class="spacer_"></div>
                <div class="form-group">
                  <label class="control-label col-sm-3">기타 정보</label>
                  <div class=" col-sm-8">
                     <div class="input-group">
                     <textarea rows="4" cols="50" id="busking_otherinfo" name="busking_otherinfo">${getBusking.busking_otherinfo}</textarea>
                     </div>
                  </div>
               </div>
               <br>
                
               <div class="form-group">
                  <div class="col-xs-offset-3 col-xs-10">
                  
                  <button id="signinBT" type="submit" class="signupbtn btn btn-default">등록</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
</div>
<p>

<div id="bottom_template">
<c:import url="../bottom.jsp" charEncoding="utf-8" />
</div>