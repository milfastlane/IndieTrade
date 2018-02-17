<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
.form-control {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px !important;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.account-box {
	border: 2px solid rgba(153, 153, 153, 0.75);
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
	margin-left: 240px;
	margin-right: -180px;
}

.account-box .btn:hover {
	color: #fff;
}

.or-box {
	position: relative;
	border-top: 1px solid #dfdfdf;
	padding-top: 20px;
	margin-top: 20px;
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

.spacer_20 {
   height: 20px;
}
/*cwy */
</style>
<script>

//첨부파일 추가
var rowIndex = 1;
var inputed;
var inputed2;
var inputed3;
var getTable;


function addFile(form){
   
	
	
	
  	
    getTable = document.getElementById("insertTable");
	var oCurrentRow = getTable.insertRow(getTable.rows.length);
    var oCurrentCell = oCurrentRow.insertCell(0);
    //alert(oCurrentCell)
    oCurrentCell.innerHTML = 
    	
    	"<div class='input-group'>"+"music"+rowIndex+
    	"<div><font size=1>뮤비 링크(유튜브 링크)</font>"+
    	"<input type='text' class='form-control' name='mvlink"+rowIndex+"' id='mvlink"+rowIndex+"'placeholder='Enter your MV link.'>"+
		"</div><div>"+
		"<font size='1'>음원 이름</font> <input type='text'"+
		"class='form-control' name='music_name"+rowIndex+"' id='music_name"+rowIndex+"'"+		
		"placeholder='Enter your music name.'>"	+
    	"<div><INPUT TYPE='FILE' onchange='chk();' NAME='filename" + rowIndex + "' size=25 accept='audio/*'></div></div>";
    
    rowIndex++;
    //alert(rowIndex)
   
}

//첨부파일 삭제
function deleteFile(form){
	getTable = document.getElementById("insertTable");
	//alert('지워지기전 rowIndex : ' + rowIndex)
	
	if(rowIndex > 1){
		//alert('여기오냐?')
		getTable.deleteRow(rowIndex-2);
		
		rowIndex--;
	
	}
		
    
    
}


function check(){
	
	//alert('여긴옴?')
	for(i = 0; i<rowIndex; i++){
	
			inputed = $("#music_name"+i).val();
			inputed2 = $("#mvlink"+i).val();
			inputed3 = $("#uploadimage"+i).val(); 
		
			if(inputed==""){
				alert('please fill in the music_name')
				return false;
			}
			if(inputed2==""){
				alert('please fill in the mvlink')
				return false;
			}
		    if(inputed3==""){ 
		        alert("please upload the music."); 
		       return false; 
	    	}
		    
	}	  
	
	ajaxax()
		

}
   
	
function ajaxax(){

	 var inputed4 = ${step1.musicboard_artistno} 
	 var inputed5 = ${step1.musicboard_name}
	 var returned = true;
	
		$.ajax({
			type : 'POST',
			data : { 
				musicboard_artistno : inputed4,
				musicboard_name : inputed5
			},
			cache: false,
			async : false, 
			url : "check_duplicated_musicboard",
			success : function(data) {
				alert('ss')
				var torf = true;
				if(data!='0'){
					alert('이미 같은 이름의 앨범이 등록되어 있습니다. 앨범 등록을 다시 시도해주세요.')
					torf = false;
					
				}
				aaa(torf);
				
			}
			
			
			
		})
		 

}


function aaa(result) {
	//alert('ss')
	if(result){
		//alert('여기오냐?ㄴㄴ')
		//return true;
		document.getElementById("step2").submit();
	} else {
		//alert('여기오냐?')
		//return false;
	}
}


</script>

<script>
						
						//alert(${step1.musicboard_no})  //0 
						//alert(${step1.musicboard_artistno}) //61
						//alert(${step1.musicboard_readcount}) //0
						//alert(${step1.musicboard_like}) //0
						//alert(${step1.musicboard_regdate}) //empty
</script> 

<p></p>

<div class="container">
	<div class="row">
		<div class="col-md-8">
			<div class="account-box">

				<h2 class="entry-title">
					<span>Register Album</span>
					<div align="right">
						<font size="3">step1 | <font color="red">step2</font> | step3
						</font>
					</div>
				</h2>
				<hr>
				<form id="step2" class="form-horizontal" action="writeForm_step3" method="post"
					enctype="multipart/form-data" onsubmit = "check(); return false;">

						<input value="${step1.musicboard_no}" type="hidden" id="musicboard_no" name="musicboard_no"> 
						<input value="${step1.musicboard_artistno}"	type="hidden" id="musicboard_artistno" name="musicboard_artistno"> 
						
						<input value="${step1.musicboard_artistname}" type="hidden" id="musicboard_artistname" name="musicboard_artistname"> 						
						<input value="${step1.musicboard_imgname}" type="hidden" id="musicboard_imgname" name="musicboard_imgname"> 
						<input value="${step1.musicboard_content}" type="hidden" id="musicboard_content"	name="musicboard_content"> 
						<input value="${step1.musicboard_name}"	type="hidden" id="musicboard_name" name="musicboard_name"> 
						<input value="${step1.musicboard_genre}" type="hidden" id="musicboard_genre" name="musicboard_genre">
						
						<input value="${step1.musicboard_readcount}" type="hidden" id="musicboard_readcount"name="musicboard_readcount"> 
						<input value="${step1.musicboard_like}"	type="hidden" id="musicboard_like" name="musicboard_like"> 
						<input value="${step1.musicboard_regdate}" type="hidden" id="musicboard_regdate" name="musicboard_regdate">
						 
						
						<input value="${step1.musicboard_releasedate}" type="hidden" id="musicboard_releasedate" name="musicboard_releasedate">
						
						
					<div align="right">
						<input type="button" class="signupbtn btn btn-default" value="음원 추가" onclick="addFile(this.form)"
							border=0 style='cursor: hand'> 
							<input type="button" class="signupbtn btn btn-default"
							value="음원 삭제" onclick="deleteFile(this.form)"  border=0
							style='cursor: hand'> <input type="hidden"
							name="rowCount" value="1">
					</div>
					
						<div class="form-group" id="music_from" >
							<label class="control-label col-sm-3">음원 등록 <span
								class="text-danger">*</span></label>
								
							<div class="col-md-5 col-sm-8">
				 <table id="insertTable" border=0 cellpadding=0 cellspacing=0>
								<div class="input-group">
									<div>
										<font size="1">뮤비 링크(유튜브 영상 상단 주소 복사)</font> <input type="text"
											class="form-control" name="mvlink0" id="mvlink0"
											placeholder="Enter your MV link.">
									</div>
									<div>
										<font size="1">음원 이름</font> <input type="text"
											class="form-control" name="music_name0" id="music_name0"
											placeholder="Enter your music name.">
									</div>

									<div>
										
									
									<input type='file' maxLength='100' name='filename0' id='uploadimage0' size='25' accept="audio/*">
										
										
									
									
									</div>
		
								</div>

							</div>
			</table>
			<div class="spacer_20"></div>
			<div class="form-group">
				<div class="col-xs-offset-3 col-xs-10">
					<button onclick="history.go(-2); return false;"
						class="signupbtn btn btn-default">처음으로</button>
					<button type="submit" class="signupbtn btn btn-default" >저장</button>
				</div>
			</div>
			</form>
		</div>
</div>
		</div>
	</div>
</div>
<p>
