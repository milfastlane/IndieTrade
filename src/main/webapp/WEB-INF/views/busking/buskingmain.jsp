<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<fmt:requestEncoding value="utf-8"/>

<c:import url="../top.jsp" charEncoding="utf-8"/>
<style>
.col-md-2 {
    width: 15%;
      margin-bottom : 10px;
}
.contaner {
   padding-left: 20px;
   
}
.contanerbusk {
   padding-left: 20px;
   border-bottom: 1px solid;
   border-top: 1px solid;
   
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
.containerbody12 {
    position:center;
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

.container-fluid123 {
      padding: 50px 40px;
      border-bottom: 1px solid;
  }
  

#btt, #btt1{
   color:#FFFFF0;
} 
</style>
<style>
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}
.next {
    right: 0;
    border-radius: 3px 0 0 3px;
    margin-right: 16px;
    margin-top:7px;
}
.prev{
 margin-top:7px;
}
</style>

<div class="container-fluid123">
<div class="container">
  <div class="mySlides">
    <div class="numbertext">1 / 3</div>
    <img src="./resources/img/buskingmain.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 3</div>
    <img src="./resources/img/buskingmain1.jpg" style="width:100%">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 3</div>
    <img src="./resources/img/buskingmain2.jpg" style="width:100%">
  </div>
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
   <a class="next" onclick="plusSlides(1)">&#10095;</a>



</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>
</div>
   <c:choose>
                  <c:when test="${empty buskingList}" >
                  <div> <a href = "busking_insert">예정된 버스킹이 없습니다.</a> </div>
                  </c:when>
                  
                  <c:otherwise>
                  <c:forEach items="${buskingList}" var="list">
                  <c:if test="${list.busking_visibility eq 1}">
                     <div class="container-fluid123">
                       <div class="row">
                         <div class="col-sm-8">
                         <h2>${list.busking_name}</h2>
                           <h4>${list.busking_username}</h4>      
                           <p>${list.busking_date} ${list.busking_time} ${list.busking_place}</p>
                           <button class="btn btn-default btn-lg" onclick="window.location.href='busking_view?busking_no=${list.busking_no}&busking_userid=${sessionScope.userid}'">상세보기</button>
                         </div>
                         <div class="col-sm-4" >
                            <c:if test="${list.busking_poster!=null}">
     <span><img src="resources/buskingimg/${list.busking_poster}" style= "height : 200px ; width : 450px"></span>
        </c:if>
        <c:if test="${list.busking_poster==null}">
         <span><img src="resources/img/banner.jpg"  style= "height : 200px; width : 450px" alt="no image"></span>
        
        </c:if>
                           
                         </div>
                       </div>
                     </div>
                     </c:if>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>




