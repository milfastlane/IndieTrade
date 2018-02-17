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
    width: 95%; 
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
input{
	height:34px;
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
                <li class="active">
                    <a href="#">보낸 쪽지함	</a>
                    
                </li>
               
         </ul>
        </div>
        <!-- /#sidebar-wrapper -->
        <div id="page-content" style="margin-left:-80px;">
         <div class="spacer_"></div> 
<h2>보낸 쪽지 목록</h2>
<hr>
	 <span class="text-muted" style="margin-left:10px;"><span class="label label-info">Info:-</span>
그동안 보냈던 쪽지 목록입니다</span><br>
<div class="spacer_20"></div>
<script>
   
    
    // 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    //function list(page){
    //   location.href="${path}/board/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    //}
    
    function a(){

		 // var searchOption = $("#searchOption").val();  
		   var searchString= $("#searchString").val();  
		    
	 document.location.href="user_sentmessagesearch?searchString="+searchString;
	
    }   
    
</script>
	<div align="center">
         <input type="text" name="searchString" id="searchString"
         style="border-radius: 4px;" value="${searchString}" placeholder="제목으로 검색">
         <button type="button" class="btn btn-primary" name="search" id="search" onclick="a();">조회</button> 
  </div>   
	 <!--  
	<div align="center">
 
  <h2>NOTICE BOARD</h2>

    </div>

 
    <button type="button" onclick="location.href='admin_message'">글쓰기</button>
   -->

   <br>
  
<h6 style="margin-left:10px;">보낸 쪽지  ${count} 개</h6>
    <table border="1" width="600px">
        <tr>
             <th>번호</th>
            <th>제목</th>
            <th>보낸날짜</th>
            <th>받는이</th>
            <th>읽음상태</th>
            <th>발송취소(상대방이 읽지 않은 쪽지만 가능)</th>
            <th>보낸쪽지삭제(상대방의 쪽지함에선 삭제되지 않습니다)</th>
        </tr>
     <c:if test="${empty sentlistfromuser}">
      <tr>
         <td colspan=7>보낸 쪽지가 없습니다.</td>
      </tr>   
     </c:if>    
     <c:forEach var="dto" items="${sentlistfromuser}">
        <tr>

       		 <c:if test="${(dto.message_hide eq 'N' and dto.message_isdeletedbysender eq 'N')}">

            <td>${dto.message_no}</td>
            
            <!-- 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
            <td>
                <a href="user_messagecontent?message_no=${dto.message_no}&message_read=n">${dto.message_title} 
                </a>
            </td>
            
            <td>${dto.message_datesent}</td>
             <td>${dto.message_receiverid}</td>
            
            <td>
             
             <c:if test="${dto.message_receiverid != 'all'}">
             ${dto.message_read}
             </c:if>
            </td>
            
            <td>
            <c:if test="${dto.message_read=='N' and dto.message_receiverid!='all'}">
             <a href="user_sentmessagedelete?message_no=${dto.message_no}">취소
                </a>
            </c:if>
            </td>
            <td>
            
             <a href="user_sentmessagehide?message_no=${dto.message_no}">삭제</a>
          
            </td>
   			
   			</c:if>
   		
        </tr>    
      </c:forEach>
      
  
</table>


<div class="spacer_20"></div>
<div class="w3-center w3-padding-32" align="center">
      <div class="w3-bar">
      
      <c:if test="${a eq 'yes'}">
         <a href="user_sentmessagesearch?searchString=${searchString}&pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
      </c:if>
      <c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
       <a href="user_sentmessagesearch?searchString=${searchString}&pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
      </c:forEach>
      <c:if test="${b eq 'yes'}">
      <a href="user_sentmessagesearch?searchString=${searchString}&pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
      </c:if>      
      </div>
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