breaker<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8"/>
<style>
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

.col-md-2 {
	width: 16% !important;
	margin-bottom: 10px;
}

.contaner {
	padding-left: 50px;
	margin-bottom:50px;
}

.overlay {
	position: center;
	top: 0;
	left: 0;
	z-index: 1;
	text-align: center;
	font: abeatbyKai;
	font-weight: 300;
	margin-top: 20%;
}

.img-responsive {
	max-width: 100%;
	max-height: auto;
}

h2 span, h3 span, h4 span, h5 span, h6 span {
	color: #328c0e; /*green*/
}
.h4, .h5, .h6, h4, h5, h6 {
    margin-top: 10px;
    margin-bottom: 3px !important;
}
.spacer_ {
	height: 20px;
}

.spacer_5 {
	height: 5px;
}
.spacer_100 {
	height: 100px;
}

.main_container {
	width: 100%;
}

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd,
	q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ul, li,
	fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr,
	th, td, article, aside, canvas, details, figcaption, figure, footer,
	header, hgroup, menu, nav, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 100%;
}

div {
	display: block;
}

body {
	line-height: 1;
}

.font_090 {
	font-size: 0.9em;
}

.inside_content {
	clear: both;
	width: 91.43%;
	max-width: 1280px;
	margin: 0 auto;
	position: relative;
	color: #43423e;
	text-align: center;
	line-height: 2em;
}

.main {
	clear: both;
	width: 80%;
	font-size: 1em;
	max-width: 1280px;
	margin: 0 auto;
	line-height: 1.5em;
	position: relative;
	color: #333;
}

body {
	background-color: #eae9e7;
	font-family: 'Merriweather Sans', sans-serif;
	font-weight: 400;
	margin: 0;
	padding: 0;
	-webkit-font-smoothing: antialiased;
}

body {
	line-height: 1;
}

element.style {
	
}

.col:first-child {
	margin-left: 0;
}

.span_2_of_12 {
	width: 14.92%;
}

.col {
	display: block;
	float: left;
	margin: 1% 0 1% 2%;
}
.group {
    zoom: 1;
}

.section {
    float: left;
    clear: both;
    padding: 0px;
    margin: 0px;
    width: 100%;
}
.align_center {
    text-align: center;
}
.paged {
    color: #555555;
    display: inline-block;
    width: 30px;
    height: 24px;
    padding-top: 8px;
    margin-right: 6px;
    text-align: center;
    cursor: pointer;
    font-weight: normal;
    text-decoration: none;
}
a {
    color: #3e3b34;
    text-decoration: underline;
}
a {
    margin: 0;
    padding: 0;
    font-size: 100%;
    vertical-align: baseline;
    background: transparent;
}

.aaa{
   padding-right: 30px;

}

.breaker {
    clear: both;
}
</style>
<c:import url="../top.jsp" charEncoding="utf-8" />
<div class="spacer_"></div>
<div class="contaner">
	<div class="spacer_"></div>
	<div class="section group notable" style="margin-right:50px;">
		<div class="spacer_"></div>
		<c:choose>
			<c:when test="${empty searchAll}">
				<tr>
					<h3>
						<span>찾으시는 검색어가 없습니다.</span>
					</h3>
				</tr>
			</c:when>
			<c:otherwise>
				<div class="section group">
				<h2 style="color: gray">All MUSIC</h2>
				
				<c:set var="i" value="0" /> 
				<c:set var="j" value="6" />
				<table id="mytable">
				<c:forEach items="${searchAll}" var="search">
					<div class="col-md-2 col-sm-2 text-center" >				
							
							<c:if test="${i%j==0}">
						<tr>
					</c:if>
							
							<td>
							<c:if test="${search.musicboard_imgname!='null'}">
							<a href="album_view?no=${search.musicboard_no}">
								<img class="aaa" src="resources/albumImage/${search.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive">	
							</a>
							</c:if>
							<c:if test="${search.musicboard_imgname=='null'}">
								<a href="album_view?no=${search.musicboard_no}">
							<img class="aaa" src="resources/img/album.jpg" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive">			
							</a>
							</c:if>
						<h4><span>${search.musicboard_name}</span></h4>
						<div class="spacer"></div>
						${search.musicboard_artistname}
						<div class="spacer_"></div>
						</td>
					</div>
					<c:if test="${i%j == j-1}">
						</tr>
						</c:if>
						<c:set var="i" value="${i+1}"/>	
				</c:forEach>
				</table>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="breaker"></div>
	</div>
		<div class="align_center">
			<c:if test="${a eq 'yes'}">
				<a href="search?searchString?&pageNum=${startPage - pageBlock}"
					class="paged">&lt;</a>		
			</c:if>
			<c:forEach var="i" step="1" begin="${startPage}" end="${endPage}"> 
				<a href="search?searchString?&pageNum=${i}"
					class="paged paged_on">${i}</a>
			</c:forEach>
			<c:if test="${b eq 'yes'}">
				<a href="search?searchString?&pageNum=${startPage + pageBlock}" class="paged">&gt;</a>
			</c:if>
		</div>
</div>

