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
            <h4>�� ������</h4> <!-- �ֽ� ���� ��ϵǴ� ������� ���̺� �����ͼ� ���� �ֽ� 1,2,3 ������ -->
            <p>${usersTotal}</p>  
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>�� ������</h4> <!-- �ֽ� ��ϵǴ� ������� ���̺� �����ͼ� 1,2,3 ���� ������ -->
            <p>${musicsTotal}</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>���� �湮�ڼ�</h4> <!-- ������ Ŭ�� ���� ������� 1,2,3���� �ѷ��� -->
            <p>${todayCount}</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>�� �湮�ڼ�</h4> <!-- �ѹ湮������ ���� �湮��, ��¥���� �׷����� ��Ÿ���ְ�, ���̺����� 1,2,3������� ������ -->
            <p>${totalCount}</p> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
          ���� (�ֱ� ������ 3����� ���) <button type="button" class="btn pull-right" onclick="goMemberAll()">${usersTotal}</button> <!-- �ش� ������ �α׾ƿ� �������� �ٽ� �α����Ҷ����� ���� ������ ����� -->
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
         <td colspan=3>��ϵ� ȸ���� �����ϴ�.</td>
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
          �ٹ� (�ֱ� ��ϵ� 3�ٹ����� ���) <button type="button" class="btn pull-right" onclick="goMusicBoardAll()">${musicsTotal}</button> <!-- �ش� ������ �α׾ƿ� �������� �ٽ� �α����Ҷ����� ���� ������ ����� -->
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
         <td colspan=3>��ϵ� ȸ���� �����ϴ�.</td>
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

