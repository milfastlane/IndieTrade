<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../top.jsp" charEncoding="utf-8" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar {
	z-index: 3;
	width: 250px;
	top: 43px;
	bottom: 0;
	height: inherit;
}
.imgbb{
    position: relative;
    background-image: url('/indietrade/resources/img/damian-zaleski-843.jpg');                                                               
    height: 80vmin;
    width: 196vmin;
    background-size: cover;
}
.a{
	 margin-left:600px;
}
.w3-padding-32 {
    padding-top: 5px!important;
    padding-bottom: 5px!important;
}
.spacer_ {
    height: 20px;
}
.spacer_200 {
 	height: 200px;
 
}
h1, h2, h3, h4, h5, h6 {
    font-family: "Segoe UI",Arial,sans-serif;
    font-weight: 400;
    margin: 10px 0;
}
.breaker {
    clear: both;
}
.group {
    zoom: 1;
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
.col-md-2 {
 	width: 20% !important; 
	margin-bottom: 10px;
}
.contaner {
	padding-left: 50px;
	margin-bottom:50px;
}


</style>

<script>
function sns_insert() {
	var inputed = $('#user_id').val()
	if(inputed == null || inputed == ""){
		alert("로그인 해주세요");
		location.href="user_login";
	}else{
		$.ajax({
			url : 'sns_update',
			data : {
				name : inputed,
			},
			type : 'POST',
			success : function(result) {
				if(result==0){
					alert("아티스트 회원만 가입 가능합니다.");
				}else if(result==2){
					alert("이미 생성되어 있습니다.");
				}else{
					alert("생성되었습니다.");	
						}
				location.reload();
			}
		});
	}
	
}
</script>
<!-- !PAGE CONTENT! -->

<div class="w3-main w3-content w3-padding"
	style="max-width: 1200px; margin-top: 50px">

	<!-- First Photo Grid-->
	<div class="imgbb">
        <div class="a">
       
<div class="spacer_200" ></div>
            <h1>Welcome You!</h1>
            <h2>Create your own blog now.</h2>
            <br>
            <h2><button onclick="javascript:sns_insert()">create</button></h2>
           <input type="hidden" id="user_id" name="user_id" value="${sessionScope.userid}">
        </div>

    </div>
	

<br>
	
<h2>NEW BLOG</h2>

<br>
				<div class="section group">
				<c:forEach items="${snspagelist}" begin="0" step="1" var="dto">
					<div class="col-md-2 col-sm-2 text-center" >				
							
							<c:choose>
								<c:when test="${dto.snspage_profileimgname=='null'}">
									<a href="sns?name=${dto.snspage_artistid}">
									<img src="resources/img/default.png" style="width: 200px; height: 200px;" onerror="this.src='/indietrade/resources/userproimg/album.jpg'"></a>					
								</c:when>
								<c:otherwise>
									<a href="sns?name=${dto.snspage_artistid}">
									<img src="resources/userproimg/${dto.snspage_profileimgname}" style="width: 200px; height: 200px;" onerror="this.src='/indietrade/resources/userproimg/album.jpg'"></a>					
								</c:otherwise>
							</c:choose>
							
								
						<h2>${dto.snspage_artistid}</h2>
						<h3>${dto.snspage_name}</h3>
						<div class="spacer"></div>
								<!-- <h6>${dto.snspage_content}</h6>  -->
						<div class="spacer_"></div>
					</div>	
				</c:forEach>
				<div class="spacer_"></div>
				</div>
				<div class="breaker"></div>
	<!-- Pagination -->
	<div class="w3-center w3-padding-32" align="center">
		<div class="w3-bar">
		
		<c:if test="${a eq 'yes'}">
			<a href="snspage_main?pageNum=${startPage - pageBlock}" class="w3-bar-item w3-button w3-hover-black">«</a>
		</c:if>
		<c:forEach var="i" step="1" begin="${startPage}" end="${endPage}">
		 <a href="snspage_main?pageNum=${i}" class="w3-bar-item w3-button w3-hover-black">${i}</a>
		</c:forEach>
		<c:if test="${b eq 'yes'}">
		<a href="snspage_main?pageNum=${startPage + pageBlock}" class="w3-bar-item w3-button w3-hover-black">»</a>
		</c:if>		
		</div>
	</div>

	<!-- About Section 
	<div class="w3-container w3-padding-32 w3-center">
		<h3>Song Recommendation</h3>
		<br>
		<iframe width="854" height="480"
			src="https://www.youtube.com/embed/BzYnNdJhZQw" frameborder="0"
			gesture="media" allow="encrypted-media" allowfullscreen></iframe>
		<div class="w3-padding-32">
			<h4>
				<b>Through the Night</b>
			</h4>
			<h6>
				<i>IU</i>
			</h6>
			<p>
				Through the night Tonight, I’ll send the glow of a firefly<br>
				to somewhere near your window<br> It’s that I love you<br>
				I remember our first kiss<br> I close my eyes whenever I can<br>
				and go to the farthest place<br> <br> Just like letters on
				the sand<br> where waves were<br> I feel you’ll disappear<br>
				To a far off place<br> I always miss you miss you<br> <br>
				All the words<br> In my heart<br> I can’t show them all to
				you<br> But, it’s that I love you<br> <br> How can I
				be so lucky<br> to have met you, who is a blessing<br> If
				we’re together now<br> Ah how great it’d be<br> <br>
				Just like letters on the sand<br> where waves were<br> I
				feel you’ll disappear<br> to a far off place<br> I miss
				you again and miss you more<br> <br> In my diary<br>
				All the words<br> I can’t show them all to you<br> It’s
				that I love you<br> <br> Tonight, I’ll send the glow of a
				firefly<br> to somewhere<br> Near your window<br> I
				hope it’s a good dream<br>
			</p>
		</div>
	</div>
	<hr>


	<!-- End page content -->
	
</div>
<div class="spacer_200"></div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />



