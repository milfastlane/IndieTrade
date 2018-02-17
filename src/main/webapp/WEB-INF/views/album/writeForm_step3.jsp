<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<c:import url="../top.jsp" charEncoding="utf-8" />

<style type="text/css">
@import
   url(http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700);

@import
   url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700)
   ;

body {
   background: #fff;
   font-family: 'Roboto', sans-serif;
   color: #333;
   line-height: 22px;
}

h1, h2, h3, h4, h5, h6 {
   font-family: 'Roboto Condensed', sans-serif;
   font-weight: 400;
   color: #111;
   margin-top: 5px;
   margin-bottom: 5px;
}

h1, h2, h3 {
   text-transform: uppercase;
}

input.upload {
   position: absolute;
   top: 0;
   right: 0;
   margin: 0;
   padding: 0;
   font-size: 12px;
   cursor: pointer;
   opacity: 1;
   filter: alpha(opacity = 0);
}

#file {
   position: relative;
   text-align: right;
   -moz-opacity: 0;
   filter: alpha(opacity : 0);
   opacity: 0;
   z-index: 2;
}

.account-box {
   border: 2px solid rgba(153, 153, 153, 0.75);
   height: auto	;
   border-radius: 7px;
   -moz-border-radius: 7px;
   -webkit-border-radius: 7px;
   -khtml-border-radius: 7px;
   -o-border-radius: 7px;
   z-index: 3;
   font-size: 13px !important;
   font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
   background-color: #ffffff;
   padding: 20px;
   margin-left: 190px;
   margin-right: -180px;
}

.account-box .btn:hover {
   color: #fff;
}

.form-inline .form-group {
   margin-left: 0;
   margin-right: 0;
}

.control-label {
   color: #333333;
}

.btn_file input[type=file] {
   position: absolute;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   width: 1px;
   height: 1px;
   margin: -1px;
   padding: 0;
   border: 0;
}

.btn_file label .btn2 {
   color: #333;
}

.btn_file label {
   display: inline-block;
   width: 77px;
   height: 33px;
   cursor: pointer;
}

.btn_file {
   position: relative;
   display: inline-block;
   float: left;
   margin-left: 8px;
}

.btn_model .btn1, .btn_model .btn2, .btn_model .btn3 {
   min-width: 78px;
   height: 33px;
   padding: 10px 12px 0;
   color: #a3a3a3;
   margin-left: 0px;
   margin-top: -25px;
}

.btn_model b, .btn_model>em, .btn_model>span {
   display: inline-block;
   overflow: hidden;
   text-align: center;
   vertical-align: top;
   letter-spacing: -1px;
}

.btn_model .btn2 {
   border: 1px solid #bfbfbf;
   background: #fff;
}

.btn_area_btm {
   overflow: hidden;
   margin-left: -8px;
   padding-top: 27px;
   text-align: left;
   margin-bottom: -50px;
}

.btn_model {
   font-size: 12px;
   line-height: 14px;
   display: inline-block;
   vertical-align: top;
   text-decoration: none !important;
}

table, textarea {
   font-family: 돋움, Dotum, sans-serif;
   font-size: 12px;
}

.btn_area_btm .btn_model .btn_disable {
   color: #c2c2c2;
}

.btn_model[href] .btn2 {
   color: #333;
   border-radius: 4px;
}

.btn_model[href] b, .btn_model[href]>em, .btn_model[href]>span {
   cursor: pointer;
}
.spacer_ {
   height: 10px;
}

/*cwy */
</style>
<p></p>

<p>

<div class="container">
   <div class="row">
      <div class="col-md-8">
         <div class="account-box">
            <h2 class="entry-title">
               <span>앨범 등록을 축하 드립니다.</span>
               <div align="right">
                  <font size="3">step1 | step2 | <font color="red">step3</font> </font>
               </div>
            </h2>
            <hr>
            <div class="form-horizontal">
               <div class="form-group">
                  <label class="control-label col-sm-3">글 등 록 일 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <input type="text" class="form-control" 
                         maxlength="30" value="${bdto.musicboard_regdate}" readonly>
                  </div>
               </div>

               <div class="form-group">
                  <label class="control-label col-sm-3">발 매 일 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                     <input type="text" class="form-control"  oninput="checkName()"
                         maxlength="30" placeholder="발 매 일" autocomplete="off" value="${bdto.musicboard_releasedate}" readonly>
                  </div>
               </div>
               <div class="form-group">
                  <label class="control-label col-sm-3">아 티 스 트<span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                            <input type="text" class="form-control"  oninput="checkName()"
                         maxlength="30" placeholder="아 티 스 트" autocomplete="off" value="${bdto.musicboard_artistname}" readonly>
                  </div>
               </div>

               <div class="form-group">
                  <label class="control-label col-sm-3">앨 범 명 <span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
                        <input type="text" class="form-control"  oninput="checkName()"
                         maxlength="30" placeholder="앨 범 명" autocomplete="off" value="${bdto.musicboard_name}" readonly>
                  </div>
               </div>
               <div class="form-group">
						<label class="control-label col-sm-3">앨범 설명 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<textarea name="album_content" 
							id="album_content" rows="13" cols="50" class="box" readonly>${bdto.musicboard_content}</textarea>
						</div>
					</div>
               
                <div class="form-group">
                  <label class="control-label col-sm-3">MusicList<span
                     class="text-danger">*</span></label>
                  <div class="col-md-8 col-sm-9">
               <c:forEach items="${mdto}" var="dto">
               <input type="text" class="form-control" 
                         maxlength="30"  value="${dto.music_name}" readonly>
                         <div class="spacer_"></div>
               </c:forEach>
               </div>
               </div>
               <div class="form-group">
                     <label class="control-label col-sm-3">앨범 이미지<br></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                           <div class="tdcell">
                            <div class="profile_photo">                              
                               <img style="width: 100%; height: 400;"  src="/resources/albumImage/${bdto.musicboard_imgname}"
                        onerror="this.src='/indietrade/resources/img/album.jpg'"/>
                            </div>
                        </div>      
                     </div>
                     </div>
               </div>
               <hr>
               <div class="form-group">
                  <div class="col-xs-offset-4 col-xs-10">
                  <button id="main" class="signupbtn btn btn-default" onclick="location.href='album_view?no=${bdto.musicboard_no}'">앨범으로가기</button>
                  <button id="blog" class="signupbtn btn btn-default" onclick="location.href='sns?artist_no=${bdto.musicboard_artistno}'">블로그 돌아가기</button>   
                  </div>
               </div>
               </div>
         </div>
      </div>
   </div>
</div>
<p>

   <c:import url="../bottom.jsp" charEncoding="utf-8" />