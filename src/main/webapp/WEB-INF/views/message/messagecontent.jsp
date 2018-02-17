<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8"/>

<c:import url="../top.jsp" charEncoding="utf-8" />

<style>
#wrapper {
   padding-left: 0;
   -webkit-transition: all 0.5s ease;
   -moz-transition: all 0.5s ease;
   -o-transition: all 0.5s ease;
   transition: all 0.5s ease;
}

#wrapper.toggled {
   padding-left: 250px;
}

#sidebar-wrapper {
   width: 200px;
   float: left;
   display: inline-block;
   height: auto;
}

#sidebar-wrapper {
   z-index: 1000;
   position: fixed;
   left: 250px;
   width: 0;
   height: 100%;
   margin-left: -250px;
   overflow-y: auto;
   float: left;
   background: #959595;
   border-right: 4px solid #5cb03b;
   -webkit-transition: all 0.5s ease;
   -moz-transition: all 0.5s ease;
   -o-transition: all 0.5s ease;
   transition: all 0.5s ease;
}

#wrapper.toggled #sidebar-wrapper {
   width: 200px;
   float: left;
}

#page-content-wrapper {
   width: 100%;
   height: 100%;
   position: absolute;
   padding: 15px;
   float: left;
}

#wrapper.toggled #page-content-wrapper {
   position: absolute;
   margin-right: -250px;
   float: left;
}
/* Sidebar Styles */
.sidebar-nav {
   position: absolute;
   top: 0;
   width: 117px;
   margin: 0;
   padding: 0;
   list-style: none;
   float: left;
}

.sidebar-nav li {
   background-color: #959595;
}

.sidebar-nav li a {
   display: block;
   padding: 7px 10px;
   text-decoration: none;
   color: #d9e2e3;
}

.sidebar-nav li a:hover {
   text-decoration: none;
   color: #fff;
   background: rgba(255, 255, 255, 0.2); /* white */
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
   text-decoration: none;
}

.sidebar-nav li.active>a {
   background: #5cb03b;
   color: #ffffff;
}

.sidebar-nav li.parent>a {
   background: #002c31;
   color: #ffffff;
}

.sidebar-nav .dropdown li {
   text-indent: 30px;
}

.sidebar-nav .dropdown .dropdown-icon {
   position: absolute;
   top: 0;
   right: 4px;
   z-index: 2000;
}

.sidebar-nav .dropdown .dropdown-submenu {
   list-style: none;
   padding-left: 0;
}

.sidebar-nav .dropdown .dropdown-submenu li {
   text-indent: 10px;
}

.sidebar-nav .dropdown .dropdown-submenu .dropdown-submenu li {
   text-indent: 20px;
}

.sidebar-nav>.sidebar-brand {
   height: 65px;
   font-size: 18px;
   line-height: 60px;
}

.sidebar-nav>.sidebar-brand a {
   color: #999999;
}

.sidebar-nav>.sidebar-brand a:hover {
   color: #fff;
   background: none;
}

@media ( min-width : 768px) {
   #wrapper {
      padding-left: 250px;
      float: left;
      width: 100%;
      height: 600px;
   }
   #wrapper.toggled {
      padding-left: 0;
   }
   #sidebar-wrapper {
      width: 120px;
      float: left;
      display: inline-block;
      height: 600px;
      z-index: 1000;
      position: fixed;
      left: 250px;
      margin-left: -250px;
      overflow-y: unset !important;
      background: #959595;
      border-right: 3px solid #5cb03b;
      transition: all 0.5s ease;
   }
   #wrapper.toggled #sidebar-wrapper {
      width: 0;
   }
   #page-content-wrapper {
      padding: 20px;
      position: relative;
      display: inline-block;
   }
   #wrapper.toggled #page-content-wrapper {
      position: relative;
      margin-right: 0;
      display: inline-block;
   }
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

.spacer_ {
   height: 30px;
}
.spacer_20 {
   height: 20px;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 90%; 
    border: 1px solid #c7c7c7;
    margin-left:-50px;
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

<div class="spacer_"></div>
<div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
         <div class="spacer_"></div> 
            <ul class="sidebar-nav">
                <li>
                <div class="spacer_"></div>
                </li>
                <li>
                    <a href="user_messagebox">관리자에게 1:1 쪽지</a>
                </li>
         		         <c:if test = "${user_id != null}">
          
        		<li>
                    <a href="user_messageindividual">1:1 쪽지</a>
                </li>
                
        	</c:if>
                <li>
                    <a href="user_messagereceived">받은 쪽지함</a>
                </li>
                <li>
                    <a href="user_messagesent">보낸 쪽지함	</a>
                    
                </li>
               
         </ul>
        </div>
        <!-- /#sidebar-wrapper -->
       <div id="page-content" style="margin-left:-80px;">
         <div class="spacer_"></div> 
      <h1 style="margin-bottom:20px;">내용 보기</h1>
      <hr>

<div align="center">

	<table border="1" width="600">
		<tr>
			<th width="15%">쪽지번호</th>
			<td align="center" width="35%">${messageinfo.message_no}</td>
			<th width="15%">쪽지받는이</th>
			<td align="center" width="35%">${messageinfo.message_receiverid}</td>
		</tr>
		<tr>		
			<th width="15%">보낸날짜</th>
			<td colspan=3 align="center" width="35%">${messageinfo.message_datesent}</td>
		</tr>
		<tr>
			<th width="15%">쪽지제목</th>
			<td align="center" colspan="3">${messageinfo.message_title}</td>
		</tr>
		<tr>
			<th width="15%">쪽지내용</th>
			<td colspan="3">${messageinfo.message_context}</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" class="btn btn-primary" value="쪽지목록"
					onclick="history.go(-1);"></td>
		</tr>
	</table>

</div>

<!-- 
      <h4 style="margin-bottom:20px;">Click the arrow to the right of Cats2 :P</h4>
      <h4 style="margin-bottom:20px;">Click the arrow to the right of Cats3 :P</h4>
 -->        
        </div>
        </div>
 <div class="spacer_"></div>   
 

<!--   	
<c:import url="../bottom.jsp" charEncoding="utf-8"/>
 -->