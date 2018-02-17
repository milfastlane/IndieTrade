<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:import url="../top.jsp" charEncoding="utf-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<p></p>
<style>
.col-md-2 {
    width: 200px !important;
    height: 259px !important;
      margin-bottom : 10px;
      
}
.contaner{
   padding-left: 50px;
}
.white_bg {
    background-color: #fff;
}
.margin_60 {
    padding-top: 60px;
    padding-bottom: 60px;
}
.main_title {
    text-align: center;
    font-size: 16px;
    margin-bottom: 30px;
}
.main_title h2 {
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: -1px;
    font-size: 30px;
    margin-bottom: 0;
    margin-top: 0;
}
h2 span, h3 span, h4 span, h5 span, h6 span {
    color: #328c0e; /*green*/
}
.other_music ul li a:hover {
    color: #f7941d;
}
.other_music ul li a {
    border-bottom: 1px solid #ededed;
    padding: 5px 0 10px;
    display: block;
    color: #333;
}
.add_bottom_45 {
    margin-bottom: 45px;
}
.other_music ul {
    padding: 0;
    margin: 0;
}

.other_music ul li a i {
    font-size: 22px;
    margin-right: 5px;
    margin-left: 2px;
    top: 5px;
    color: #555;
}
.other_music ul {
    list-style: none;
}

.img-responsive {
    max-width: 100%;
    max-height: auto;   
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
.container { position:relative; }
.container video {
    position:relative;
    z-index:0;
}
.overlay {
    position:center;
    top:0;
    left:0;
    z-index:1;
    text-align: center;  
    font :abeatbyKai;  
    font-weight: 300;
    margin-top:20%;

}
#btt, #btt1{
   color:#FFFFF0;
}
.spacer_ {
   height: 5px;
}
.breaker {
    clear: both;
} 

</style>
<div class ="contaner" style="margin-left:10px;"> 

<h3><span>LIKE </span>MUSIC</h3>
<c:choose>
<c:when test="${empty myalbum}">
	<h3 style="color:gray">지금 좋아하는 앨범을 추가해보세요.</h3>
</c:when>
<c:otherwise>
	<div class="spacer_5"></div>
				<div class="section group">
				<c:forEach items="${myalbum}" var="myalbum">
					<div class="col-md-2 col-sm-2 text-center">
									
							<a href="album_view?no=${myalbum.musicboard_no}">
							<c:if test="${myalbum.musicboard_imgname!='null'}">
								<img src="resources/albumImage/${myalbum.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive">
							</c:if>
							<c:if test="${myalbum.musicboard_imgname=='null'}">
								<img src="resources/img/album.jpg" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive">
							</c:if>
							
							</a>					
						<h4><span></span>${myalbum.musicboard_name}</h4>
						<div class="spacer_"></div>
					</div>	
				</c:forEach>
				</div>
</c:otherwise>
</c:choose>  
<div class="breaker"></div>      
</div>
<p></p>
<div class ="contaner" style="margin-left:10px;"> 

<h3><span>LIKE </span>SNS PAGE</h3>
<c:choose>
<c:when test="${empty mysns}">
<h3 style="color:gray">좋아하는 가수의 SNS페이지를 찾아보세요.</h3>


</c:when>
<c:otherwise>
         	<div class="spacer_5"></div>
				<div class="section group">
				<c:forEach items="${mysns}" var="mysns">
					<div class="col-md-2 col-sm-2 text-center">				
							<a href="sns?name=${mysns.snspage_artistid}">
								<c:if test="${mysns.snspage_profileimgname!='null'}">
									<img src="resources/userproimg/${mysns.snspage_profileimgname}" style="width: 215px; min-height: 215px; height:215px; overflow: hidden" alt="Pic" class="img-responsive">
								</c:if>
								<c:if test="${mysns.snspage_profileimgname=='null'}">
									<img src="resources/img/default.png" style="width: 215px; min-height: 215px; height:215px; overflow: hidden" alt="Pic" class="img-responsive">
								</c:if>								
							</a>					
						<h4>${mysns.snspage_name}</h4>
						<div class="spacer_"></div>
					</div>	
				</c:forEach>
				</div>
</c:otherwise>
</c:choose>   
<div class="breaker"></div>
            </div>
   
      
            
