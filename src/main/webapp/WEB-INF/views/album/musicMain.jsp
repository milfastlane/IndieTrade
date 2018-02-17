<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:import url="../top.jsp" charEncoding="utf-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<p></p>

<div class ="contaner" style="margin-left:50px;"> 

<h3><span>NEW</span> MUSIC</h3>
<c:choose>
<c:when test="${empty albumList}">
등록된 앨범이 없습니다.

<a href="">글등록하기</a> <!-- what is this? -->

</c:when>
<c:otherwise>
	<c:forEach items="${albumList}" var="dto">
	<div class="col-md-2 col-sm-2 text-center">				
							<a href="#"><img src="resources/img/coldplay.jpg" alt="Pic" class="img-responsive"></a>					
						<h4><span>${dto.album_no}</span>${dto.album_name}</h4>
						<p onclick="location.href='album?album_no=${dto.album_no}'">
							${dto.album_name}
						</p>
					</div>
	</c:forEach>
</c:otherwise>
</c:choose>
				
				</div>
				<p></p>
<c:import url="../bottom.jsp" charEncoding="utf-8" />