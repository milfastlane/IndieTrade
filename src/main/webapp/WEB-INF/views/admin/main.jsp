<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>

<c:import url="top.jsp" charEncoding="utf-8"/>

<script>

function goMemberAll(){
	location.href='admin_memberAll'	
}
function goMusicBoardAll(){
	location.href='allMusicBoard_admin'	
}
</script>

<div class="container" id="content"><p>  
    <div class="col-sm-12">
     
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
            <h4>총 유저수</h4> <!-- 최신 가입 등록되는 순서대로 테이블 가져와서 가장 최신 1,2,3 보여줌 -->
            <p>${usersTotal}</p>  
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>총 음원수</h4> <!-- 최신 등록되는 순서대로 테이블 가져와서 1,2,3 까지 보여줌 -->
            <p>${musicsTotal}</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>오늘 방문자수</h4> <!-- 페이지 클릭 높은 순서대로 1,2,3까지 뿌려줌 -->
            <p>${todayCount}</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>총 방문자수</h4> <!-- 총방문수부터 오늘 방문수, 날짜별로 그래프로 나타내주고, 테이블에서는 1,2,3등까지만 보여줌 -->
            <p>${totalCount}</p> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
          유저 (최근 가입한 3명까지 출력) <button type="button" class="btn pull-right" onclick="goMemberAll()">${usersTotal}</button> <!-- 해당 관리자 로그아웃 순간부터 다시 로그인할때까지 새로 가입한 사람들 -->
           <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
      </tr>
    </thead>
    <tbody>

    <c:if test="${empty userList}">
      <tr>
         <td colspan=3>등록된 회원이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="dto" items="${userList}">
      <tr>
        <td>${dto.user_id}</td>
        <td>${dto.user_name}</td>
        <td>${dto.user_email}</td>
      </tr>
      
     </c:forEach>
    </tbody>
  </table>
          </div>
        </div>
       <div class="col-sm-6">
          <div class="well">
          앨범 (최근 등록된 3앨범까지 출력) <button type="button" class="btn pull-right" onclick="goMusicBoardAll()">${musicsTotal}</button> <!-- 해당 관리자 로그아웃 순간부터 다시 로그인할때까지 새로 가입한 사람들 -->
           <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>EMAIL</th>
      </tr>
    </thead>
    <tbody>

    <c:if test="${empty musicboardList}">
      <tr>
         <td colspan=3>등록된 회원이 없습니다.</td>
      </tr>   
   </c:if>

   <c:forEach var="mbdto" items="${musicboardList}">
      <tr>
        <td>${mbdto.musicboard_no}</td>
        <td>${mbdto.musicboard_name}</td>
        <td>${mbdto.musicboard_artistname}</td>
      </tr>
      
     </c:forEach>
    </tbody>
  </table>
          </div>
        </div>
       
      </div>
     
          </div>
        </div>



<c:import url="bottom.jsp" charEncoding="utf-8"/>

