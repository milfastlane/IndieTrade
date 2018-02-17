<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<fmt:requestEncoding value="utf-8"/>

<style>
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 85%;
    border: 1px solid #c7c7c7;
    margin-left:30px;
}

th , td {
    text-align: center !important;
    padding: 5px !important;
}

tr:nth-child(even) {
    background-color: #f2f2f2
}
.col-md-2 {
    width: 15%;
   	margin-bottom : 15px;
}

.col-md-busktitle {
    border-top : 2px solid;
    border-bottom : 1px solid;
    padding-top: 2px;
}
.contaner{
	padding-left: 20px;
	height: auto !important;
}
.w3-border {
    border: 1px solid #ccc!important;
    height: auto !important;
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

.container-fluid123 {
      padding: 30px 40px;
      border-bottom: 1px solid;
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

.col-md-busktitle{
	width:83%;

}
.add_bottom_10{
	bacground-color: #555;
	margin-bottom: 10px;
    margin-top: 10px;
/*     background-color: #1ec7b6; */
    width: 90%;
}
.spacer_{
   height: 10px;
}
.spacer_20{
   height: 20px;
}​
</style>

<c:import url="../top.jsp" charEncoding="utf-8"/>

<script>
	function openTabs(evt, cityName) {
		  var i;
		  var x = document.getElementsByClassName("w3-container city w3-animate-opacity");
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";
		  }
		  var activebtn = document.getElementsByClassName("w3-bar-item w3-button testbtn w3-padding-16");
		  for (i = 0; i < x.length; i++) {
		      activebtn[i].className = activebtn[i].className.replace(" w3-dark-grey", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " w3-dark-grey";
		}
	</script>
  <div class="spacer_20"></div>
<div class="container-fluid123">
<img width="100%" height="300" src="resources/buskingimg/${getBusking.busking_poster}">
</div>

<div class="container-fluid123">

<div class="dt_Ttop">
			<div class="dt_Ttop_tbg">
				<!-- 공연명 -->
				<div class="dt_Name">
					<h1><span id="IDGoodsName">${getBusking.busking_name}</span>
					<span class="iconWrap" style="position:relative">
					<div style="position: absolute; top: 0px; left: 0px; display: none;">
	</div>
	</span>
					</h1>
					<hr>
					<dl class="dt_Name_info">
						<dd class="etc">콘서트<span> |</span>  ${getBusking.busking_duration}분  <span></span> </dd> 
					</dl>
				</div>
			</div>
		</div>
<div class="w3-border">
<div class="w3-bar w3-theme">
  <button class="w3-bar-item w3-button testbtn w3-padding-16" onclick="openTabs(event,'Info')">공연정보</button>
  <button class="w3-bar-item w3-button testbtn w3-padding-16" onclick="openTabs(event,'Warning')">에매안내</button>
  <button class="w3-bar-item w3-button testbtn w3-padding-16" onclick="openTabs(event,'extra')">기타 정보</button>
</div>

<div align="center" id="Info" class="w3-container city w3-animate-opacity">
<h2 class="w3-center">${getBusking.busking_username}</h2>
  <div  class="w3-center col-md-busktitle">관람 시간<br>  </div>
  <div class="w3-center add_bottom_10"><b> ${getBusking.busking_date} ${getBusking.busking_time}</b> </div>
  <div  class="w3-center col-md-busktitle">관람 장소<br>  </div>
  <div class="w3-center add_bottom_10"><b>${getBusking.busking_place}</b> </div> 
  <div  class="w3-center col-md-busktitle">러닝 타임<br>  </div>
  <div class="w3-center add_bottom_10"><b>${getBusking.busking_duration}</b> </div> 
  <div  class="w3-center col-md-busktitle">티켓 가격<br>  </div>
  <div class="w3-center add_bottom_10"><b>${getBusking.busking_ticketprice}</b> </div> 
  <div  class="w3-center col-md-busktitle">포스터</div>
  <div class="w3-center add_bottom_10"><img width="70%" src="resources/buskingimg/${getBusking.busking_poster}"></div>

			<table border="1">
				<tr>
					<th>주최사</th>
					<th>후원사</th>
					<th>연락처</th>
					<th>장소</th>
				</tr>
				<tr>
					<td>${getBusking.busking_host}</td>
					<td>${getBusking.busking_sponsor}</td>
					<td>0${getBusking.busking_contact}</td>
					<td>${getBusking.busking_place}</td>
				</tr>
			</table>
		</div>
  <div class="spacer_20"></div>

<div id="Warning" class="w3-container city w3-animate-opacity">
<div align="left" style="margin-left:100px;">
  <h5><a href="${getBusking.busking_bookinglink}">예약 사이트</a></h5>
  <h5>예약번호입장</h5>
  <h5>공연 당일 현장 교부처에서 예약번호 및 본인 확인 후 티켓을 수령하실 수 있습니다.
상단 예매확인/취소 메뉴에서 예매내역을 프린트하여 가시면 편리합니다.</h5>
<div class="spacer_"></div>
<hr>

 <h5>티켓배송</h5>
	<h5>티켓 배송 및 예매에 관련된 부분에 대한 책임은 전혀 없으며 해당 사항은 본인이 예약한 사이트에 직접 문의하셔야 합니다. </h5>
</div>
<div class="spacer_"></div>

<hr>
<div id="extra" class="w3-container city w3-animate-opacity">
  <h3 class="w3-center">기타 정보</h3>
  <h5 align="center">${getBusking.busking_otherinfo}</h5>
<div class="spacer_"></div>
  <hr>
  <div align="center">
   <h3 class="w3-center">공연 장소 지도</h3>
   <div class="spacer_"></div>
<iframe width="600" height="450" frameborder="0" style="border:0; margin-bottom:50px;" 
src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAzFV5gXu_366ntwi1PIoa2RqUxD7PRByg&q=${getBusking.busking_place}"/>
</div>
</div>
</div>
</div>


<c:import url="../bottom.jsp" charEncoding="utf-8"/>