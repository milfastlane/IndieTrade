<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
.glyphicon {
    position: relative;
    top: 1px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: 400;
 	line-height: unset !important; 
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
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
     
</script>

<p>

<div class="container">
      <div class="row">
    
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">${dto.user_id}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> 
                 <c:if test="${dto.user_filename!=null}">
                 	<img alt="User Pic" src="./resources/img/client/${dto.user_filename}" class="img-circle img-responsive"> 
                 </c:if>
                 <c:if test="${dto.user_filename==null}">
                 	<img alt="User Pic" src="./resources/img/default.png" class="img-circle img-responsive"> 
                 </c:if>
                 
                </div>
                
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>이름</td>
                        <td>${dto.user_name}</td>
                      </tr>
                      <tr>
                        <td>가입날짜</td>
                        <td>${dto.user_joindate}</td>
                      </tr>
                      <tr>
                        <td>생년월일</td>
                        <td>${dto.user_birth}</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>성별</td>
                        <td>${dto.user_gender}</td>
                      </tr>
                        <tr>
                        <td>이메일</td>
                        <td>${dto.user_email}</td>
                      </tr>
                      <tr>
                        <td>연락처</td>
                        <td>${dto.user_phone}</td>
                      </tr>
                      <tr>
                        <td>권한</td>
                        <td>${dto.user_authority}</td>              
                      </tr>
             
                     
                    </tbody>
                  </table>
                  <span class="pull-right">
                  <a href="user_update?no=${sessionScope.no}" class="btn btn-primary">회원수정</a>
                  <a href="user_delete?no=${sessionScope.no}" class="btn btn-primary">회원탈퇴</a>
                  </span>
                </div>
              </div>
            </div>
            <!-- 
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
             -->
          </div>
        </div>
      </div>
    </div>

 


         

<c:import url="../bottom.jsp" charEncoding="utf-8" />