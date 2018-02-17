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
element.style {
    float: right;
    margin-top: -5px;
    margin-right: 5px;
}
.no_underline {
    text-decoration: none;
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
			<c:when test="${empty search and empty searchMusicName}">
				<tr>
					<h3><span>찾으시는 검색어가 없습니다.</span></h3>
				</tr>
			</c:when>
			
			<c:when test="${!empty searchArtist and !empty searchAlbum and !empty searchMusicName}">
			<c:if test="${searchArtist.size() gt 6}">
			<div style="float:right;margin-top:25px;margin-right:90px;">
					<a class="no_underline" href="searchviewall?searchString=${searchString}&searchval=artist">View All &gt; </a>
			</div>
			</c:if>
				<h3><span>ARTISTS</span></h3>
				<div class="spacer_5"></div>
				<div class="section group">
				<c:forEach items="${searchArtist}" var="search" end="5" begin="0" step="1">
					<div class="col-md-2 col-sm-2 text-center" >				
							<a href="album_view?no=${search.musicboard_no}"><img src="resources/albumImage/${search.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive"></a>					
						<h4>${search.musicboard_artistname}</h4>
						<div class="spacer_"></div>
					</div>	
				</c:forEach>	
				</div>
				<c:if test="${searchAlbum.size() gt 6}">
					<div style="float: right; margin-top: 7px; margin-right: 90px;">
						<a class="no_underline" href="searchviewall?searchString=${searchString}&searchval=album">View All &gt; </a>
					</div>
				</c:if>
				<h3><span>ALBUM</span></h3>
				<div class="spacer_5"></div>
				<div class="section group">
				<c:forEach items="${searchAlbum}" var="search" end="5" begin="0" step="1">
					<div class="col-md-2 col-sm-2 text-center" >				
							<a href="album_view?no=${search.musicboard_no}"><img style="width: 215px; min-height: 215px;" src="resources/albumImage/${search.musicboard_imgname}" alt="Pic" class="img-responsive"></a>					
						<h4>${search.musicboard_name}</h4>

						<div class="spacer_"></div>
					</div>	
				</c:forEach>
				</div>
			<c:if test="${searchMusicName.size() gt 6}">
			<div style="float:right;margin-top:25px;margin-right:90px;">
					<a class="no_underline" href="searchviewall?searchString=${searchString}&searchval=musicname">View All &gt; </a>
			</div>
			</c:if>
				<h3><span>MUSIC</span></h3>
				<div class="spacer_5"></div>
				<div class="section group">
				<c:forEach items="${searchMusicName}" var="searchName">
					<div class="col-md-2 col-sm-2 text-center" >				
								<a href="album_view?no=${searchName.music_musicboardno}">
								<img src="resources/albumImage/${searchName.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive"></a>	
						<h4 style="color: gray">${searchName.music_musicboardname}</h4>		
						<h6 style="color: gray">${searchName.music_name}</h6>					
						<div class="spacer_"></div>
					</div>	
				</c:forEach>
				</div> 	
			</c:when>
			<c:when test="${!empty searchArtist}">
				<c:if test="${searchArtist.size() gt 6}">
					<div style="float: right; margin-top: 25px; margin-right: 90px;">
						<a class="no_underline" href="searchviewall?searchString=${searchString}&searchval=artist">View All &gt; </a>
					</div>
				</c:if>
				<h3><span>ARTIST</span></h3>
				<div class="spacer_5"></div>
				<div class="section group">
				<c:forEach items="${searchArtist}" var="search" end="5" begin="0" step="1">
					<div class="col-md-2 col-sm-2 text-center" >				
							<a href="album_view?no=${search.musicboard_no}"><img src="resources/albumImage/${search.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive"></a>					
						<h4>${search.musicboard_artistname}</h4>
						<div class="spacer_"></div>
					</div>	
				</c:forEach>	
				</div> 
			</c:when>
			<c:when test="${!empty searchAlbum}">
				<c:if test="${searchAlbum.size() gt 6}">
					<div style="float: right; margin-top: 25px; margin-right: 90px;">
						<a class="no_underline" href="searchviewall?searchString=${searchString}&searchval=album">View All &gt; </a>
					</div>
				</c:if>
				<h3><span>ALBUM</span></h3>
				<div class="spacer_5"></div>
				<div class="section group">
				<c:forEach items="${searchAlbum}" var="search">
					<div class="col-md-2 col-sm-2 text-center" >				
							<a href="album_view?no=${search.musicboard_no}"><img src="resources/albumImage/${search.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive"></a>					
						<h4 style="color: gray">${search.musicboard_name}</h4>
						<div class="spacer_"></div>
					</div>	
				</c:forEach>	
				</div> 
			</c:when>
			
			<c:otherwise>
				<c:if test="${searchMusicName.size() gt 6}">
					<div style="float: right; margin-top: 25px; margin-right: 90px;">
						<a class="no_underline" href="searchviewall?searchString=${searchString}&searchval=musicname">View All &gt; </a>
					</div>
				</c:if>
				<h3><span>MUSIC</span></h3>
				<div class="spacer_5"></div>
				<div class="section group">
				<c:forEach items="${searchMusicName}" var="searchName">
					<div class="col-md-2 col-sm-2 text-center" >										
								<a href="album_view?no=${searchName.music_musicboardno}">
								<img src="resources/albumImage/${searchName.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pic" class="img-responsive"></a>	
						<h4 style="color: gray">${searchName.music_musicboardname}</h4>					
						<h6 style="color: gray">${searchName.music_name}</h6>						
						<div class="spacer_"></div>
					</div>	
				</c:forEach>
				</div> 	
				
			</c:otherwise>
		</c:choose>
		<div class="breaker"></div>
	</div>
</div>

