<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<c:import url="../top.jsp" charEncoding="utf-8"/>
<style>
ol, ul {
    margin-top: 20px;
    margin-bottom: 10px;
}
.container-custom {
    padding-left: 180px;
    padding-top: 15px ; 
}
</style>
<p>
<div class="row content" style="margin-left:20px;">
    <div class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="admin_insertCategory">카테고리 등록</a></li>
        <li class="active"><a href="admin_listCategory">카테고리 보기</a></li>

      </ul><br>
     
    </div>
</div>

<div class="container-custom" style="margin-left:30px;">
<fieldset>

<!-- Form Name -->
<legend>카테고리 보기</legend>

<table class="table" style="width: auto !important">
    <thead>
      <tr>
        <th>번호</th>
        <th>대분류 카테고리</th>
        <th>소분류 카테고리</th>
        <th>소분류 카테고리 링크</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <c:if test="${empty categoryList}">
		<tr>
			<td colspan="3">등록된 카테고리가 없습니다</td>
		</tr>	
	</c:if>
	<c:forEach var="dto" items="${categoryList}"> 
    <tbody>
      <tr>
        <td>${dto.category_no}</td>
        <td>${dto.category_major}</td>
        <td>${dto.category_minor}</td>
        <td>${dto.category_link}</td>
       <td><input type="button" value="수정" class="btn btn-default"
					onclick="window.location='admin_updateCategory?num=${dto.category_no}'"></td>
		<td><input type="button" value="삭제" class="btn btn-default"
					onclick="window.location='admin_deleteCategory?num=${dto.category_no}'"></td>
      </tr>
     
      	 
    
    </tbody>
    </c:forEach>
  </table>
  
  
</fieldset>
</div>
