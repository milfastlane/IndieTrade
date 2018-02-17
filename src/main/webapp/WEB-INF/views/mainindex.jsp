<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<fmt:requestEncoding value="utf-8"/>

<c:import url="top.jsp" charEncoding="utf-8"/>
<style>

.col-md-2 {
    width: 16%;
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

.spacer_50 {
	height: 50px;
}
.breaker {
    clear: both;
}
#container:after {content:""; display:block; clear:both;}
 .left-contents .tab-contents li .tab-inner .inner-contents {
    border: solid 1px;
    border-color: #b8b8b8;
}

.left-contents .inner-contents {
}

.left-contents .inner-contents {
    padding: 0;
    border-color: #b4b5b5 #b8b8b8 #b8b8b8 #a3a3a3;
    border-top: none;
}

.inner-contents {
    padding: 36px 48px 36px 50px;
    /* min-height: 400px; */
    border: solid 1px #b8b8b8;
    background: #efefef;
}

.list-slide {
    width: 95%;
    height: 250px;
    position: relative;
    margin-left:10px;
}

#float1 { 
	float: left; 
	padding-right: 20px;
}
.subject{
	font-family:"Helvetica Neue",Helvetica,Arial,sans-serif,'나눔고딕','돋움';
    font-size: 18px;
    line-height: 1.42857143;
    color: #333;
}
hr {
    margin-top: 5px;
    margin-bottom: 5px;
    border: 0;
    border-top: 1px solid #eee;
}
em{
	margin-left:550px;
}
.section {
    float: left;
    clear: both;
    padding: 0px;
    margin: 0px;
    width: 100%;
    /* margin-bottom: 100px; */
}
.group:before, .group:after {
    content: "";
    display: table;
}
.group:after {
    clear: both;
}

.spacer_20 {
	height: 20px;
}

.aaa{
   padding-right: 30px;

}
#mytable{
 border: none !important;
}


</style>

<script type="text/javascript"> 	
	function startbt() { 
		var videocontrol = document.getElementById("mainvid");
		if(document.getElementById("btt").className == 'glyphicon glyphicon-pause'){
			document.getElementById("btt").className = "glyphicon glyphicon-play";
			videocontrol.pause();
		}else{
			document.getElementById("btt").className = "glyphicon glyphicon-pause";
			videocontrol.play();
		}
	}
	
	function volumebt() {
		var videocontrol = document.getElementById("mainvid");
		if(document.getElementById("btt1").className == 'glyphicon glyphicon-volume-up'){
			document.getElementById("btt1").className = "glyphicon glyphicon-volume-off";
			videocontrol.muted = true;
		}else{
			document.getElementById("btt1").className = "glyphicon glyphicon-volume-up";
			videocontrol.muted = false;
		}
	}
	
	
</script>

<!-- MAINVID play, pause, volume -->
<div align="center" class="embed-responsive embed-responsive-16by9">	
	<video id="mainvid" autoplay class="embed-responsive-item" muted>
		<source src="resources/videos/Rend Collective - Build Your Kingdom Here.mp4" type="video/mp4" muted>
	</video>
	<div class="overlay">
		<a href="javascript:startbt()"> 
			<span class="glyphicon glyphicon-pause" id="btt" style="position: relative; left: 650px; top:-230px;" ></span>
		</a> 
		<a href="javascript:volumebt()"> 
			<span class="glyphicon glyphicon-volume-up" id="btt1" style="position: relative; left: 650px; top:-230px;"></span>
		</a> 
    </div>    
</div>

<div class="spacer_"></div>

<div class ="contaner">
	<h3><span>indieTrade </span>NOTICE</h3>
		<div class="inner-contents list-slide riot_newsWrap" id="slides02">
  		<!-- Visual Start -->
    	<div class="slides-container inner-list riot_news">
        	<div class="slides-control">
            	<a class="thumb" style="display:block;" href="admin_noticeindex" >
                	<img src="./resources/img/notice3.jpg" id="float1" width="550px">
                </a>
                <div>
                    <c:if test="${empty representNotice}">
         				<td colspan=5>등록된 대표 공지사항이 없습니다.</td>  
     				</c:if>    
                    <div class="subject">
                    	${representNotice.noticeboard_title}
                    </div>
                    <div>
                    	${representNotice.noticeboard_content}
                    </div>
                    <hr style="border: solid #dedede; border-width: 1px 0 0;">
                    <div class="spacer_50"></div>
                    <div class="end">
                    ${representNotice.noticeboard_regdate}
                    </div>
                </div>
           </div>
    	</div>
    <span class="riot_newsTotal" style="display:none;">1</span>
</div>
</div>    

<div class="spacer_20"></div>

<div class="contaner">
	<div class="section group notable" style="margin-right:20px;">
		<div class="spacer_"></div>
		<c:choose>
			<c:when test="${empty boardList}">
				<tr><h3><span>NO </span>MUSIC</h3></tr>
			</c:when>
			<c:otherwise>
				<c:if test="${boardList.size() gt 17}">
					<div style="float:right; margin-top:25px; margin-right:90px;">
						<a class="no_underline" href="search?searchString">View All &gt; </a>
					</div>
				</c:if>
				<h3><span>NEW </span>MUSIC</h3>
				<div class="spacer_5"></div>
				<div class="section group" >
				
				<c:set var="i" value="0" /> 
				<c:set var="j" value="6" />
				<table id="mytable">
				
				<c:forEach items="${boardList}" var="list" end="17" varStatus="status">
					<c:if test="${i%j==0}">
						<tr>
					</c:if>
					
						<td>	
						<a href="album_view?no=${list.musicboard_no}">
						<c:if test="${list.musicboard_imgname!='null'}">
							<img class="aaa" src="resources/albumImage/${list.musicboard_imgname}" style="width: 215px; min-height: 215px;" alt="Pics" class="img-responsive">
						</c:if>
						<c:if test="${list.musicboard_imgname=='null'}">
							<img class="aaa" src="resources/img/album.jpg" style="width: 215px; min-height: 215px;" alt="check">
						</c:if>

						</a>
											
						<h4><span>${list.musicboard_name}</span></h4>
						<div class="spacer"></div>
						${list.musicboard_artistname}
						<div class="spacer_"></div>
						</td>
						
						<c:if test="${i%j == j-1}">
						</tr>
						</c:if>
						<c:set var="i" value="${i+1}"/>
						
				</c:forEach>
					
					</table>
				
				</div>
			</c:otherwise>
		</c:choose>		

		<div class="contaner"></div>
		<div class="breaker"></div>
	</div>
</div>

<div class="spacer_50" ></div>
  

<!--   
<section id="contact">
	<h3 class="text-center text-uppercase">contact us</h3>
    <p class="text-center w-75 m-auto">Don't hesitate to let us know if you have any questions or comments.</p>
    <div class="row">
    	<div class="col-sm-12 col-md-6 col-lg-3 my-5">
        	<div class="card border-0">
            	<div class="card-body text-center">
                	<i class="fa fa-child fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">Choi</h4>
                    	<p>cwyday7186@gmail.com</p>
                    
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-3 my-5">
        	<div class="card border-0">
            	<div class="card-body text-center">
                	<i class="fa fa-instagram fa-5x mb-3" aria-hidden="true"></i>
                   	<h4 class="text-uppercase mb-5">Kim</h4>
                    	<address>milfastlane11@gmail.com</address>
                    
                </div>
            </div>
        </div>
                
        <div class="col-sm-12 col-md-6 col-lg-3 my-5">
        	<div class="card border-0">
            	<div class="card-body text-center">
                	<i class="fa fa-grav fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">Kwon</h4>
                    	<address>re0608@naver.com</address>
                   
                </div>
            </div>
        </div>
        
        <div class="col-sm-12 col-md-6 col-lg-3 my-5">
        	<div class="card border-0">
            	<div class="card-body text-center">
                	<i class="fa fa-reddit fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">Jeong</h4>
                  		<p>teddypaul03@gmail.com</p>
                  	
                </div>
            </div>
        </div>
           
	</div>
</section>
-->

<div class="spacer_"></div>
<style>

p {
	   margin-bottom: 35rem;
}
</style>
<p>

<c:import url="bottom.jsp" charEncoding="utf-8"/>