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
  	
  	var pwdCheck = 0; 
    var phoneCheck = 0;
  
    //비밀번호 체크 (비밀번호와 비밀번호확인과 일치여부, 비밀번호 6~12제한 확인)
    function checkPwd() {
        var inputed = $("#passwd").val();
        var reinputed = $("#repassword").val();
        
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
           
            $(".signupbtn").prop("disabled", true);
            //$(".signupbtn").css("background-color", "#aaaaaa");
             $("#passwd").css("background-color", "#FFCECE");
            $("#repassword").css("background-color", "#FFCECE");
           
        } else if (inputed == reinputed) {
           $("#repassword").css("background-color", "#B0F6AC");
           
           if (inputed == reinputed && inputed.length>5) {
               $("#passwd").css("background-color", "#B0F6AC");
               $("#repassword").css("background-color", "#B0F6AC");
                
                pwdCheck = 1;
                if(pwdCheck == 1 && phoneCheck==1) {
                   
                    $(".signupbtn").prop("disabled", false);
                    signupCheck();
                }
                
                
            }
                      
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".signupbtn").prop("disabled", true);
            $("#passwd").css("background-color", "#FFCECE");
            
            $("#repassword").css("background-color", "#FFCECE");
            
        }
    }
    
    
    function checkPhone() {
      var inputed = $("#phone").val();
       var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
      var originalPhoneNum = '${dto.user_phone}';
      
   $.ajax({
           
           type : 'POST',
            data : { user_phone : inputed }, 
            url : "user_checkPhone",
            success : function(data) {
            	
            	
            	 
               if(inputed=="" && (!regPhone.test(inputed) || regPhone.test(inputed)) && data=='1'){
                  $(".signupbtn").prop("disabled", true);
                    $("#phone").css("background-color", "#FFCECE");
            }else if(regPhone.test(inputed) && data=='0' || originalPhoneNum==inputed){
               $("#phone").css("background-color", "#B0F6AC");
              
              
               phoneCheck = 1;
                 if(pwdCheck == 1 && phoneCheck==1) {
                    
                     $(".signupbtn").prop("disabled", false);
                
                     signupCheck();
                  
                 }
            }else if(!regPhone.test(inputed) || data=='1'){
               phoneCheck = 0; 
               $(".signupbtn").prop("disabled", true);
                  $("#phone").css("background-color", "#FFCECE");
               }
            }
        });
    }
     
    function signupCheck() {
        //var name = $("#nickname").val();
       // var email = $("#email").val();
        var phone = $("#phone").val();
       // var name = $("name").val();
       // alert('${dto.user_phone}')
     
        
        //alert(a)
        //alert('ddd')
        if(phone=="") {
            $(".signupbtn").prop("disabled", true);
         } else{
        	 
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
          document.getElementById("kk1").submit();
       }); 
    
   });
 
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
               <span>update user</span>
            </h2>
            
            <hr>
            <form class="form-horizontal" action="user_update" method="post" enctype="multipart/form-data" name="kk1" id="kk1">
       
               <div class="form-group">
                  <label class="control-label col-sm-3">아이디 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <div class="input-group">
                        <span class="input-group-addon"><i
                           class="glyphicon glyphicon-user"></i></span> <input type="text"
                           class="form-control" name="id" id="id" oninput="checkId()"
                           placeholder="Enter your ID" maxlength="16" autocomplete="off" value="${dto.user_id}" required autofocus disabled>
                     </div>
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
                     <input type="text" class="form-control" name="name" oninput="checkName()"
                        id="name" maxlength="30" placeholder="Enter your Name" autocomplete="off" value="${dto.user_name}" required disabled>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">이메일 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <div class="input-group">
                        <span class="input-group-addon"><i
                           class="glyphicon glyphicon-envelope"></i></span> <input type="text"
                           class="form-control" name="email" id="email" oninput="checkEmail()"
                           placeholder="Enter your Email ID" maxlength="40" autocomplete="off" value="${dto.user_email}" required disabled >
                        
                     </div>
               
             
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">비밀번호<span
                     class="text-danger">*</span></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                        <span class="input-group-addon"><i
                           class="glyphicon glyphicon-lock"></i></span> <input type="password"
                           class="form-control" name="passwd" id="passwd"
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
                  <label class="control-label col-sm-3">성별<span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <label> <input name="gender" type="radio" value="Male"
                        checked> 남자
                     </label> <label> <input name="gender" type="radio" value="Female">여자
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
                           class="form-control" name="phone" id="phone"
                           placeholder="Enter your Primary phone no." oninput=checkPhone() autocomplete="off" maxlength="11" required>
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
                            
                              <c:if test="${dto.user_filesize eq 0}">
                            
                               <img id="uploadPreview" alt="No Default Image" style="width: 100px; height: 100px;" src="./resources/img/default.png" />
                        
                              </c:if>
                              
                              <c:if test="${dto.user_filesize ne 0}">
                               <img id="uploadPreview" alt="No Image" style="width: 100px; height: 100px;" src="./resources/img/client/${dto.user_filename}" />
                        
                              </c:if>
                                              
                       
                        
                        
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
               
               <div class="form-group">
                  <div class="col-xs-offset-3 col-md-8 col-sm-9">
                     <span class="text-muted"><span class="label label-danger">Note:-</span>
                        By clicking Sign Up, you agree to our <a href="#">Terms</a> and
                        that you have read our <a href="#">Policy</a>, including our <a
                        href="#">Cookie Use</a>.</span>
                  </div>
               </div>
               
               <div class="form-group">
                  <div class="col-xs-offset-3 col-xs-10">
                  
                  <button id="signinBT" type="submit" class="signupbtn btn btn-default" disabled="disabled" >수정하기</button>
                  <button id="goBack" type="button" class="signupbtn btn btn-default" onclick="javascript:history.back()">돌아가기</button>
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