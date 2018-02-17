<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<c:import url="../top.jsp" charEncoding="utf-8"/>

<div class="row content">
    <div class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="admin_insertCategory">카테고리 등록</a></li>
        <li><a href="admin_listCategory">카테고리 보기</a></li>

      </ul><br>
     
    </div>
</div>


<div class="container-custom">
<form class="form-horizontal" action="admin_updateCategory" 
method="post" >
<fieldset>

<!-- Form Name -->
<legend>카테고리 수정</legend>

<input type="hidden" name="category_no" value="${getCategory.category_no}"/>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="category_major">대분류 카테고리</label>  
  <div class="col-md-4">
  <input id="category_major" name="category_major" type="text" placeholder="" class="form-control input-md"
  value="${getCategory.category_major}">
    
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="category_minor">소분류 카테고리</label>  
  <div class="col-md-4">
  <input id="category_minor" name="category_minor" type="text" placeholder="" class="form-control input-md"
   value="${getCategory.category_minor}">
    
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="category_link">소분류 카테고리 링크</label>  
  <div class="col-md-4">
  <input id="category_link" name="category_link" type="text" placeholder="" class="form-control input-md"
   value="${getCategory.category_link}">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-4">
    <button id="submit" name="submit" class="btn btn-default">확인</button>
  </div>
</div>

</fieldset>
</form>
</div>