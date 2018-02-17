<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>IndieTrade | All About K-Indie. Completely Free. Completely Legal.</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
<link rel="shortcut icon" href="./resources/favicon_music.png" type="image/x-icon" />   
<style>

body {
   background: #F5F5F5 !important;
   
}

p {
   margin-bottom: 7rem;
}


/*scroll effect*/
.navbar-trans {
  background-color: transparent;
  border: none;
  transition: top 1s ease;
}
 
/*double row*/
.navbar-doublerow > .navbar{
   display: block;   
   padding: 0px auto;
   margin: 0px auto;
   min-height: 25px;
}
.navbar-doublerow .nav{
   padding: 0px auto;
}

.navbar-doublerow .dividline{
  margin: 5px 100px;
  padding-top: 1px;
   
}
/*top nav*/
.navbar-doublerow .navbar-top ul>li>a {
   padding: 10px auto;
   font-size: 12px;
} 
/*down nav*/
.navbar-doublerow .navbar-down .navbar-brand {
   padding: 0px auto;
   float: left;
   color:    #2F4F4F;
   font-size: 20px;
}
.navbar-doublerow .navbar-down ul>li>a{
   font-size: 14px;
   color:    #2F4F4F;
   transition: border-bottom .2s ease-in , transform .2s ease-in-out;
}
.navbar-doublerow .navbar-down ul>li>a:hover{
   border-bottom: 1px solid #fff;
   color: #fff;
}
.navbar-doublerow .navbar-down .dropdown{
    padding: 5px;
    color: #000;
}
.navbar-doublerow .navbar-down .dropdown ul>li>a,
.navbar-doublerow .navbar-down .dropdown ul>li>a:hover{
  color: #000;
  border-bottom: none;
}
   
.navbar-doublerow.navbar-trans.afterscroll {
   top:-50px;
}   


/*text*/
.text-white,.text-white-hover:hover{color:#fff!important}
/*fontcolor*/
.light-grey {color:#fff!important;background-color:#E6E9ED!important}

#contact .card:hover i,#contact .card:hover h4{
   color: #87d37c;
}

#video { 
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
}

body, html {
    height:100%;
    margin:0;
    padding:0;
}
#content {
    height:100%;
    min-height:300px; /* This is the height of your content + height of the footer */
}

#footer {
    margin-top:-100px;
    height:100px;
    background:#e9e9e9;
   
    margin-left: auto;
    margin-right: auto;
    margin-bottom: auto; 
    margin-top: auto;
    display:flex;
    align-items:center;
   
}
.footer-mute {
   color: #949494;
}
.navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
     color: #2F4F4F;
     font-weight:bold;
}
.input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group {
    z-index: 2;
    margin-left: -1px;
    height: 34px;
}
</style>


<base target="_self">

</head>
<body style="height: 1000px">
navbar navbar-inverse
<nav class="navbar navbar-default navbar-doublerow navbar-fixed-top">
  <!-- down nav -->
  <nav class="navbar navbar-down">
    <div class="container-fluid">
      <div class="flex-container">  
      
          <!--  <div class="navbar-brand">INDIETRADE</div>--> 
            
            <a href="/indietrade" class="navbar-left"><img src="./resources/img/logo1.jpg" width=100 height=50></a>
        
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
       
        <c:forEach var="aclist" items="${aclist}" begin="0" end="${fn:length(aclist)}" step="1">
         <ul class="nav navbar-nav">
                <li><a class="dropdown-toggle"
               data-toggle="dropdown" href="#">${aclist}<i class="fa fa-angle-down" ></i></a>
               <ul class="dropdown-menu">
               <c:forEach var="clist" items="${clist}" begin="0" end="${fn:length(clist)}" step="1">
               <c:if test="${clist.category_major eq aclist}">
             
                  <c:choose>
                    
                     <c:when test="${clist.category_major eq 'MUSIC'}">
                     <li><a href="searchGenre?genre=${clist.category_minor}"><span style="color:#000000;">${clist.category_minor}</span></a></li>
                     </c:when>
                     <c:otherwise>
                     <li><a href="${clist.category_link}"><span style="color:#000000;">${clist.category_minor}</span></a></li>   
                     </c:otherwise>
                    
                  </c:choose>
                  
                  </c:if>
             </c:forEach>
               </ul>
         </li>
         </ul>
           </c:forEach>
        <ul class="nav navbar-nav pull-right">
     
        <li><a href="snspage_main" class="">SNS</a></li>
        <li><a href="busking_main" class="">BUSKING</a></li>        
        <li><a href="faqmain" class="">FAQ</a></li>
        
         <c:choose>
           <c:when test="${sessionScope.authuser == null}">
             <li><a href="user_aorf" class="">SIGN UP</a></li>
             <li><a href="user_login" class="">LOGIN</a></li>
          </c:when>
          <c:otherwise>
          <c:if test = "${sessionScope.authorities == 'ROLE_ADMIN'}">
              <li><a href="admin_main" class="">ADMIN</a></li>
           </c:if>
       
           <li>
              
              
              <a class="dropdown-toggle"
               data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-user"></i> ${sessionScope.username} 님<i class="fa fa-angle-down" ></i> </a>
            <ul class="dropdown-menu">
               
                  <li><a href="user_info?no=${sessionScope.no}"><span style="color:#000000;">회원정보</span></a></li>
                  <li><a href="user_update?no=${sessionScope.no}"><span style="color:#000000;">회원정보수정</span></a></li>
                   <c:if test = "${sessionScope.authorities == 'ROLE_USER' or sessionScope.authorities == 'ROLE_ARTIST'}">
                   <li><a href="user_messagebox"><span style="color:#000000;">쪽지</span></a></li>
                  </c:if>
<!--                    <li><a href="signupok"><span style="color:#000000;">signup</span></a></li> -->
<!--                    <li><a href="emailAuthOk"><span style="color:#000000;">emailAuthOk</span></a></li> -->
                  <c:if test = "${sessionScope.authorities == 'ROLE_ARTIST' && issnspage eq 1}">
              <li><a href="sns?name=${sessionScope.userid}" class="">MY SNS</a></li>
           </c:if>
           <li><a href="like_mylist?user_id=${sessionScope.userid}"><span style="color:#000000;"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> my like</span></a></li>
                  <li><a href="user_logouta"><span style="color:#000000;">LOGOUT</span></a></li>
            </ul>
         </li>   
          </c:otherwise>
      </c:choose>
 
        </ul>
         
          <div class="col-sm-3 col-md-3 navbar-right">
      <form class="navbar-form" action="search" role="search">
       <div class="input-group">
           <input type="text" class="form-control" placeholder="Search" name="searchString">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </div>
        </form>
    </div>
        </div>  
      </div>
    </nav>
  </nav> 
  