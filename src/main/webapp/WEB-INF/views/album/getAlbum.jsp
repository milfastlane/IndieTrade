<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../top.jsp" charEncoding="utf-8" />    

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- accordion bootstrap 적용하는거 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- 구글 map 반응형웹 -->

<style>
html,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}

.map-responsive{
    overflow:hidden;
    padding-bottom:56.25%;
    position:relative;
    height:0;
}
.map-responsive iframe{
    left:0;
    top:0;
    height:100%;
    width:100%;
    position:absolute;
}

.container{
	width: 100%;
}
.spacer_5 {
    height: 5px;
}
.spacer_ {
    height: 60px;
}
.spacer_10 {
    height: 10px;
    margin-left:50px;
}
.w3-white{
	padding :20px;
	height: auto; 
}
#playlist,audio{ width:100%; padding:0px; }
.active a{ color:wite;text-decoration:none; }
span a{ color:#151515;background:#FAFAFA;padding:5px;display:block; cursor:pointer }
span a:hover{ text-decoration:none; }

</style>

<style type='text/css'>

#playlist,audio{ width:100%; padding:0px; }
.active a{ color:wite;text-decoration:none; }
span a{ color:#151515;background:#FAFAFA;padding:5px;display:block; cursor:pointer }
span a:hover{ text-decoration:none; }

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript">
$(window).load(function(){
var audio;
var playlist;
var tracks;
var current;
init();

function init(){
    current = 0;
    audio = $('audio');
    playlist = $('#playlist');
    tracks = playlist.find('span a');
    len = tracks.length - 0;   
    audio[0].volume = 1.0;
    playlist.find('a').click(function(e){
        e.preventDefault();
        link = $(this);
        current = link.parent().index();
        run(link, audio[0]);
    });
    audio[0].addEventListener('ended',function(e){
        current++;
        if(current == len){
            current = 0;
            link = playlist.find('a')[0];
        }else{
            link = playlist.find('a')[current];    
        }
        run($(link),audio[0]);
    });

}
function run(link, player){
        player.src = link.attr('href');
        par = link.parent();
        par.addClass('active').siblings().removeClass('active');
        audio[0].load();
        audio[0].play();   
}
}); 

function albumUp(){
	var inputed = $('#logid').val()
	var inputed2 = $('#musicboard_no').val()
	$.ajax({
		url : 'albumUp',
		data : {
			like_music_userid : inputed,
			like_music_boardno : inputed2
		},
		type : 'POST',
		success : function(result) {
			location.reload();
		}
	});
	
}
function albumDown(){
	var inputed = $('#logid').val()
	var inputed2 = $('#musicboard_no').val()
	$.ajax({
		url : 'albumDown',
		data : {
			like_music_userid : inputed,
			like_music_boardno : inputed2
		},
		type : 'POST',
		success : function(result) {
			location.reload();
		}
	});
	
}
</script>

<!-- Page Container --> 
<div class="spacer_"></div>
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4" style="border-radius: 7px;">
        <div class="w3-display-container">
              <font size="10">${bdto.musicboard_name}</font>
     <div class="dropdown"> 
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" >
    ${bdto.musicboard_artistname}
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="sns?artist_no=${bdto.musicboard_artistno}">snspage</a></li>
      <c:if test="${!empty sessionScope.userid}">
      <li class="divider"></li>
      <li><a href="user_messageindividual?artistno=${bdto.musicboard_artistno}">mail</a></li>
      </c:if>
    </ul>
      <input type="hidden" value="${sessionScope.userid}" id="logid" name = "logid">
    <input type="hidden" value="${bdto.musicboard_no}" id="musicboard_no" name = "musicboard_no">
    
     <c:choose>
		  	<c:when test="${album_like_ch eq 0}">
          <button class="btn btn-default" onclick="albumUp()"><i class="fa fa-heart" aria-hidden="true"></i> 앨범 좋아요</button>
          </c:when>
          <c:when test="${album_like_ch eq '1'}">
           <button class="btn btn-default" onclick="albumDown()"><i class="fa fa-heart" aria-hidden="true"></i> 앨범 좋아요 취소</button>
          </c:when>
          <c:otherwise></c:otherwise>
          </c:choose>
  </div>
        <p></p>
          <p></p>
                  </div>
        <div class="w3-container" style="margin-left:10px;">
          <img src="resources/albumImage/${bdto.musicboard_imgname}" style ="width : 350px; height : 350px" 
          onerror="this.src='/indietrade/resources/img/album.jpg'" alt="앨범이미지">
          <p></p>
          <p></p>
          <hr>
          <p><i class="fa fa-list fa-fw w3-margin-right w3-large w3-text-teal"></i>총 ${mlist.size()}곡 수록 <br>
		  <p><i class="fa fa-calendar-check-o fa-fw w3-margin-right w3-large w3-text-teal"></i>${bdto.musicboard_releasedate}</p>
            <p><i class="fa fa-heart fa-fw w3-margin-right w3-large w3-text-teal"></i>${likecount}명 좋아요</p>
          <!-- 클릭시 <i class="fa fa-heart" aria-hidden="true"></i>  -->
          <p><i class="fa fa-eye fa-fw w3-margin-right w3-large w3-text-teal"></i>조회수 ${bdto.musicboard_readcount}번</p>
			          <p></p>
          </p>
    </div>
    </div>
        <!-- End Left Column -->
    </div>
    <!-- Right Column -->
    <div class="w3-twothird">
    
      <div class="w3-container w3-card w3-white w3-margin-bottom" style="border-radius: 7px;">
        <h2 class="w3-text-grey"><i class="fa fa-music fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>음악목록</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>음악 리스트</b></h5>
          <p align="center">
         <!-- Music Player -->
         <div id="playlist">
<c:forEach var="mdto" items="${mlist}">
<span class="active"><a href="resources/mp3/${mdto.music_filename}">${mdto.music_name}</a></span>
</c:forEach>
</div>
         <audio id="audio" tabindex="0" controls  style="width: 100%">
         <source type="audio/mpeg" src="">
         </audio>

        </div>
      </div>
   <!-- right under -->
    <div class="w3-container w3-card w3-white" style="border-radius: 7px;">
        <div class="container">
        <p></p>
        <p></p>
  <div class="panel-group" id="accordion">
   <!-- choose문으로 accordion panel들을 묶어준다. -->
   <c:if test="${!empty bdto.musicboard_content}">
      <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">앨범 설명</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body"><c:out value="${bdto.musicboard_content}"/></div> 
      </div>
    </div>
   </c:if>
   
   <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">작곡/세션</a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">자작곡</div>
      </div>
    </div>
     <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">투어일정</a>
        </h4>
      </div>
      <div id="collapse5" class="panel-collapse collapse">
        <div class="panel-body">

</div>
      </div>
    </div>
 
  </div>
   
  <div class="panel-group" id="accordion">
  
  <!-- choose문으로 accordion panel들을 묶어준다. -->
  
  
  <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">뮤직 비디오</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">
        <div class="w3-container">
        <c:forEach var="mdto" items="${mlist}">
        <c:if test="${!empty mdto.music_mvlink}">
           <iframe width="100%" height="400"
         src="https://www.youtube.com/embed/${mdto.music_mvlink}" frameborder="0"
         gesture="media" allow="encrypted-media" allowfullscreen></iframe>
            </c:if>
  </c:forEach>   
      </div>
    </div>
    </div>
    </div>
 
  </div> 
</div>
</div>
   

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  <!-- End Page Container -->
</div>
</div>
<div class="spacer_"></div>
<c:import url="../bottom.jsp" charEncoding="utf-8" />