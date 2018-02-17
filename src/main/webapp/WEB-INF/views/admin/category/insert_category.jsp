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
    <div class="col-sm-3 sidenav" >
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="admin_insertCategory">카테고리 등록</a></li>
        <li><a href="admin_listCategory">카테고리 보기</a></li>

      </ul><br>
     
    </div>
</div>


<div class="container-custom">
<form class="form-horizontal" action="admin_insertCategory" 
method="post" >
<fieldset>

<!-- Form Name -->
<legend style="margin-left:50px;">카테고리 등록</legend>

<!-- Text input-->
<div class="form-group" >
  <label class="col-md-4 control-label" for="category_major">대분류 카테고리</label>  
  <div class="col-md-4">
  <input id="category_major" name="category_major" type="text" placeholder="" class="form-control input-md" value="MUSIC">
    
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="category_minor">소분류 카테고리</label>  
  <div class="col-md-4">
  <input id="category_minor" name="category_minor" type="text" placeholder="" class="form-control input-md">
    
  </div>
<!-- Text input-->
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="category_link">소분류 카테고리 링크</label>  
  <div class="col-md-4">
  <input id="category_link" name="category_link" type="text" placeholder="" class="form-control input-md">
    
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