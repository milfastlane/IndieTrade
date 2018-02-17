<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
</style>
<c:import url="../top.jsp" charEncoding="utf-8" />
<div class="spacer_"></div>
<div class="contaner">
	<div class="spacer_"></div>
	<div class="section group notable" style="margin-right:50px;">
		<div class="spacer_"></div>
		<c:choose>
			<c:when test="${empty searchViewArtist}">
				<tr>
					<h3>
						<span>찾으시는 검색어가 없습니다.</span>
					</h3>
				</tr>
			</c:when>
			<c:otherwise>
				<div class="section group">
				<h2 style="color: gray">ARTIST</h2>
				<c:forEach items="${searchViewArtist}" var="search">
					<div class="col-md-2 col-sm-2 text-center" >				
							<a href="album_view"><img src="resources/albumImage/${search.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive"></a>					
						<h4>${search.musicboard_artistname}</h4>
						<div class="spacer"></div>
					</div>	
				</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="breaker"></div>
	</div>
		<div class="align_center">
			<c:if test="${a eq 'yes'}">
				<a href="searchviewall?searchString=${searchString}&searchval=artist&pageNum=${startPage - pageBlock}"
					class="paged">&lt;</a>		
			</c:if>
			<c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
				<a href="searchviewall?searchString=${searchString}&searchval=artist&pageNum=${i}"
					class="paged paged_on">${i}</a>
			</c:forEach>
			<c:if test="${b eq 'yes'}">
				<a href="searchviewall?searchString=${searchString}&searchval=artist&pageNum=${startPage + pageBlock}" class="paged">&gt;</a>
			</c:if>
		</div>
</div>

