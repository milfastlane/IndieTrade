<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div id="top_template">
<c:import url="../top.jsp" charEncoding="utf-8" />
</div>

<sec:authorize access="isAuthenticated()">   
    <% response.sendRedirect("/indietrade/"); %>
</sec:authorize>

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

.or {
   color: #666666;
   background-color: #ffffff;
   position: absolute;
   text-align: center;
   top: -8px;
   width: 40px;
   left: 90px;
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
 

</style>
<script>
 
//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    var nameCheck = 0;
    var emailCheck = 0;
    var phoneCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
        var inputed = $("#user_id").val();
        $.ajax({
           
           type : 'POST',
            data : { user_id : inputed }, 
            url : "user_checkId",
            success : function(data) {
                if(inputed=="" && data=='0') {
                   $(".signupbtn").prop("disabled", true);
                    $("#user_id").css("background-color", "#FFCECE");
                    idCheck = 0;
                    
                } else if (data == '0') {
                   $("#user_id").css("background-color", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                        $(".signupbtn").prop("disabled", false);
                        signupCheck();   
                    } 
                    
                } else if (data != '0') { //1일때 뿐만아니라 2이상일때.. 
                   $(".signupbtn").prop("disabled", true);
                    
                    $("#user_id").css("background-color", "#FFCECE");
                    idCheck = 0;
                } 
            }
        });
    }
    
    function checkName() {
       var inputed = $("#user_name").val();
       
       if(inputed==""){
             $(".signupbtn").prop("disabled", true);
                $("#user_name").css("background-color", "#FFCECE");
       }else{
          $("#user_name").css("background-color", "#B0F6AC");
           nameCheck = 1;
             if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                
                 $(".signupbtn").prop("disabled", false);
                 signupCheck();
             }
       }
       
    }
    
    //비밀번호 체크 (비밀번호와 비밀번호확인과 일치여부, 비밀번호 6~12제한 확인)
    function checkPwd() {
        var inputed = $("#user_passwd").val();
        var reinputed = $("#repassword").val();
        
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
           
            $(".signupbtn").prop("disabled", true);
            //$(".signupbtn").css("background-color", "#aaaaaa");
             $("#user_passwd").css("background-color", "#FFCECE");
            $("#repassword").css("background-color", "#FFCECE");
           
        } else if (inputed == reinputed) {
           $("#repassword").css("background-color", "#B0F6AC");
           
           if (inputed == reinputed && inputed.length>5) {
               $("#user_passwd").css("background-color", "#B0F6AC");
               $("#repassword").css("background-color", "#B0F6AC");
                
                pwdCheck = 1;
                if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                   
                    $(".signupbtn").prop("disabled", false);
                    signupCheck();
                }
                
                
            }
                      
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".signupbtn").prop("disabled", true);
            $("#user_passwd").css("background-color", "#FFCECE");
            
            $("#repassword").css("background-color", "#FFCECE");
            
        }
    }
    
    
    function checkEmail() {
       var inputed = $("#user_email").val();
       var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      
      $.ajax({
           
           type : 'POST',
            data : { user_email : inputed }, 
            url : "user_checkEmail",
            success : function(data) {
               if(inputed=="" && (!regEmail.test(inputed) || regEmail.test(inputed)) && data=='1'){
                  $(".signupbtn").prop("disabled", true);
                     $("#user_email").css("background-color", "#FFCECE");
            }else if(regEmail.test(inputed) && data=='0'){
               $("#user_email").css("background-color", "#B0F6AC");
                  
               emailCheck = 1;
                 if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                    
                     $(".signupbtn").prop("disabled", false);
                     signupCheck();
                 }
            }else if(!regEmail.test(inputed) || data=='1'){
               emailCheck = 0; 
               $(".signupbtn").prop("disabled", true);
                  $("#user_email").css("background-color", "#FFCECE");
               }
            }
        });
       
    }
    
    function checkPhone() {
      var inputed = $("#user_phone").val();
       var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
      
       
   $.ajax({
           
           type : 'POST',
            data : { user_phone : inputed }, 
            url : "user_checkPhone",
            success : function(data) {
               if(inputed=="" && (!regPhone.test(inputed) || regPhone.test(inputed)) && data=='1'){
                  $(".signupbtn").prop("disabled", true);
                    $("#user_phone").css("background-color", "#FFCECE");
            }else if(regPhone.test(inputed) && data=='0'){
               $("#user_phone").css("background-color", "#B0F6AC");
                  
               phoneCheck = 1;
                 if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                    
                     $(".signupbtn").prop("disabled", false);
                     signupCheck();
                 }
            }else if(!regPhone.test(inputed) || data=='1'){
               phoneCheck = 0; 
               $(".signupbtn").prop("disabled", true);
                  $("#user_phone").css("background-color", "#FFCECE");
               }
            }
        });
    }
     
    function signupCheck() {
        var email = $("#user_email").val();
        var phone = $("#user_phone").val();
        var name = $("user_name").val();
        
        if(name=="" || email=="" || phone=="") {
            $(".signupbtn").prop("disabled", true);
         } else {
        }
    }
    
   function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("file").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };
    
   function del(){      
      $("#file").val("");
      $("#uploadPreview").attr("src","./resources/img/default.png");
      $("#file").css('color', 'transparent');
   }
    
   function a(){
	      $('input[type="file"]').change(function () {
	           if ($(this).val() != "") {
	                  $(this).css('color', '#333');
	           }else{
	                  $(this).css('color', 'transparent');
	           }
	      });
	   }
   
   function addOption(){
       var frm = document.kk1;
       var op = new Option();
          op.value = 1+frm.dd.length; // 값 설정
           op.text = 1+frm.dd.length;
           frm.dd.options.add(op);
           op.selected = true;
           
   }
   
   //윤년 체크로직  
   function getLastDay(solar_date)
   {
   var MonthTable = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
   if (((solar_date.getYear() % 4 == 0) && (solar_date.getYear() % 100 != 0)) || (solar_date.getYear()% 400 == 0))
   MonthTable[1] = 29;
   else
   MonthTable[1] = 28;
   return MonthTable[solar_date.getMonth()];
   }

   
  

   
   $(document).ready(function () {
      
      $('#mm').change(function(){
         $('#dd').find("option").remove();

         var nowDate = new Date();
         var yyyy = $('#yyyy').val(); 
         nowDate.setYear(yyyy)
         var mm=$(this).val();
         if(mm=='01' || mm=='03' || mm=='05' || mm=='07' || mm=='08' || mm=='10' || mm=='12'){
            nowDate.setMonth(1-1);
         }else if(mm=='04' || mm=='06' || mm=='09' || mm=='11'){
            nowDate.setMonth(4-1);  
         }else{
            nowDate.setMonth(2-1);
         }
         nowDate.date= getLastDay(nowDate); //월의 마지막일         
         for(i = 0; i < nowDate.date; i++) {
              addOption();
      }
         
      });
      
       $("#signinBT").click(function (e) {
          
          // 우클릭방지
          oncontextmenu='return false' 
          // 드래그 방지
         ondragstart='return false'
         //새로고침, 뒤로가기 막기 (키보드에서만, 브라우저상으로는 불가.)
         document.onkeydown = function(e) {
            key = (e) ? e.keyCode : event.keyCode;
            if(key==8 || key==116) {
               if(e) {
                  e.preventDefault();
               } else {
                  event.keyCode = 0;
                  event.returnValue = false;

                 }
             }
         }
         

          //hide.
          document.getElementById('custom_signin').style.display = 'none';
          document.getElementById('top_template').style.display = 'none';
          document.getElementById('bottom_template').style.display = 'none';
          
          //show.
          document.getElementById('custom_loading').style.display = 'block';
          //$(this).html('<img src="http://www.bba-reman.com/images/fbloader.gif" />');
          
       }); 
    
   });
 
   window.onload = function(){
	   document.getElementById('custom_loading').style.display = 'none';
	}
   
  
</script>
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
               <span>Sign Up</span>
            </h2>
            
            <hr>
            <form class="form-horizontal" action="user_signup" method="post" enctype="multipart/form-data" name="kk1">
               <input type="hidden" name="authority" value="${param.a}">
               <div class="form-group">
                  <label class="control-label col-sm-3">아이디 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <div class="input-group">
                        <span class="input-group-addon"><i
                           class="glyphicon glyphicon-user"></i></span> <input type="text"
                           class="form-control" name="user_id" id="user_id" oninput="checkId()"
                           placeholder="Enter your ID" maxlength="16" autocomplete="off" required autofocus>
                     </div>
                     
                     <small> 한글로 된 아이디는 지원하지 않으니 영문과 숫자로만 입력해 주시기 바랍니다.</small>
                  </div>
               </div>
               
               <!-- 
               <c:out value="${param.a}"></c:out>
               <c:out value="${param.a}"></c:out>
                 -->
             
               
               <div class="form-group">
                  <label class="control-label col-sm-3">이름 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <input type="text" class="form-control" name="user_name" oninput="checkName()"
                        id="user_name" maxlength="30" placeholder="Enter your Name" autocomplete="off" required>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">이메일 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <div class="input-group">
                        <span class="input-group-addon"><i
                           class="glyphicon glyphicon-envelope"></i></span> <input type="text"
                           class="form-control" name="user_email" id="user_email" oninput="checkEmail()"
                           placeholder="Enter your Email ID" maxlength="40" autocomplete="off" required>
                        
                     </div>
               
                     <small> 이메일은 계정 복구 및 인증에 활용되니 유효한 이메일을 입력해주시기 바랍니다.</small>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">비밀번호 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                        <span class="input-group-addon"><i
                           class="glyphicon glyphicon-lock"></i></span> <input type="password"
                           class="form-control" name="user_passwd" id="user_passwd"
                           placeholder="Choose password(6-12 chars)"  maxlength="12"  oninput=checkPwd() required>
                           
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">비밀번호 확인 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                        <span class="input-group-addon"><i
                           class="glyphicon glyphicon-lock"></i></span> <input type="password"
                           class="form-control" name="repassword" id="repassword"
                           placeholder="Confirm your password" maxlength="12" oninput=checkPwd() required>
                     </div>
                  </div>
               </div>

               <div class="form-group">
                  <label class="control-label col-sm-3">생년월일 <span
                     class="text-danger">*</span></label>
                  <div class="col-xs-8">
                     <div class="form-inline">
                        <div class="form-group">
                           <select id="yyyy" name="yyyy" class="form-control">
                              <c:forEach var="i" begin="0" end="${2006-1955}">
                                 <c:set var="yearOption" value="${1955+i}"/>
                                 <option value="${yearOption}">${yearOption}</option>
                              </c:forEach>
                              
                           </select>
                        </div>
                        
                        <div class="form-group">
                           <select id="mm" name="mm" class="form-control">
                              <option value="01">Jan</option>
                              <option value="02">Feb</option>
                              <option value="03">Mar</option>
                              <option value="04">Apr</option>
                              <option value="05">May</option>
                              <option value="06">Jun</option>
                              <option value="07">Jul</option>
                              <option value="08">Aug</option>
                              <option value="09">Sep</option>
                              <option value="10">Oct</option>
                              <option value="11">Nov</option>
                              <option value="12">Dec</option>
                           </select>
                        </div>
                        <div class="form-group">
                           <select id="dd" name="dd" class="form-control" >
                           	<c:forEach var="i" begin="1" end="${31}">
                                 <option value="${i}">${i}</option>
                              </c:forEach>
                           </select>
                           
                        </div>   
                     </div>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">성별 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <label> <input name="user_gender" type="radio" value="Male"
                        checked> 남자
                     </label> <label> <input name="user_gender" type="radio" value="Female">여자
                     </label>
                     <input type="hidden" name="checked" value="checked"/>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">휴대폰 번호 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                        <span class="input-group-addon"><i
                           class="glyphicon glyphicon-phone"></i></span> <input type="text"
                           class="form-control" name="user_phone" id="user_phone"
                           placeholder="Enter your phone no." oninput=checkPhone() autocomplete="off" maxlength="11" required>
                     </div>
                  </div>
               </div>
             <div class="form-group">
                     <label class="control-label col-sm-3">프로필 사진<br>
                     <small>(선택사항)</small></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                           <div class="tdcell">
                            <div class="profile_photo">                              
                        <img id="uploadPreview" style="width: 100px; height: 100px;" src="./resources/img/default.png" />
                            </div>
                            <p class="btn_area_btm">
                                <span class="btn_file" >
                                    <label for="file" class="btn_model"><b id="btnChangeProfile" class="btn2" style="border-radius: 4px;">사진변경</b></label>
                                    <input type="file" name="file" class="form-control upload" id="file" onchange="PreviewImage();" onclick="a()" />
                                </span>
                                <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2" onclick="del()">삭제</b></a>
                            </p>
                        </div>      
                     </div>
                     </div>
               </div>
               <br>
               <!-- 
               <div class="form-group">
                  <div class="col-xs-offset-3 col-md-8 col-sm-9">
                     <span class="text-muted"><span class="label label-danger">Note:-</span>
                        By clicking Sign Up, you agree to our <a href="#">Terms</a> and
                        that you have read our <a href="#">Policy</a>, including our <a
                        href="#">Cookie Use</a>.</span>
                  </div>
               </div>
                -->
               <div class="form-group">
                  <div class="col-xs-offset-3 col-xs-10">
                  
                  <button id="signinBT" type="submit" class="signupbtn btn btn-default" disabled="disabled">sign up</button>
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