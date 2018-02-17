<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="euc-kr" />
<c:import url="../top.jsp" charEncoding="utf-8" />

<style type="text/css">
.background_size {
	background-size: 100% 100%;
}
.spacer_ {
    height: 70px;
}
.spacer_30 {
    height: 30px;
}
.spacer_10 {
    height: 10px;
}
</style>
<script>
	function snscontent_del() {
		var inputed = $('#contentno').val()
		var inputed2 = $('#page_id').val()
		$.ajax({
			url : '/indietrade/sns_snspagecontent_del',
			data : {
				contentno : inputed,
				page_id : inputed2
			},
			type : 'POST',
			success : function(result) {
				location.reload();
			}
		});
	}
	
	function snscontent() {
		var inputed = $('#user_id').val()
		var inputed1 = $('#user_name').val()
		var inputed2 = $('#page_id').val()
		var inputed3 = $('#board_content').val()

		$.ajax({
			url : '/indietrade/sns_snspage_pagecontentUp',
			data : {
				user_id : inputed,
				uset_name : inputed1,
				page_id : inputed2,
				board_content : inputed3
			},
			type : 'POST',
			success : function(result) {
				location.reload();
			}
		});
	}
	
	
	function snspageUp(){
		var inputed = $('#page_id').val()
		var inputed2 = $('#user_id').val()
		$.ajax({
			url : 'snspageUp',
			data : {
				like_sns_artistid : inputed,
				like_sns_userid : inputed2
			},
			type : 'POST',
			success : function(result) {
				location.reload();
			}
		});
		
	}
	function snspageDown(){
		var inputed = $('#page_id').val()
		var inputed2 = $('#user_id').val()
		$.ajax({
			url : 'snspageDown',
			data : {
				like_sns_artistid : inputed,
				like_sns_userid : inputed2
			},
			type : 'POST',
			success : function(result) {
				location.reload();
			}
		});
		
	}
</script><div class="spacer_" ></div>

<table align="center">
	<tr class="background_size" height="250"
		background="./resources/userproimg/${getsnsdto.snspage_mainimgname}">
		<td colspan="2"><font size="10" color="white">${getsnsdto.snspage_name}</font><br>
			<input type="hidden" id="user_id" name="user_id"
			value="${sessionScope.userid}"> <input type="hidden"
			id="user_name" name="user_name" value="${sessionScope.username}">
			<input type="hidden" id="page_id" name="page_id"
			value="${getsnsdto.snspage_artistid}"></td>
	</tr>
	<tr>
		<td colspan="2" width="100%">
			<ul class="nav nav-tabs">
				<c:if test="${getsnsdto.user_no eq sessionScope.userno}">
					<!-- 
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> 음원관리 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="writeForm_step1">음원 등록</a></li>
							<li><a href="#">음원 그래프</a></li>
						</ul></li>
					-->
					<li><a href="writeForm_step1">음원 등록</a></li>	
						<li class="dropdown"><a a class="dropdown-toggle"
						data-toggle="dropdown" href="#">공연 정보<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li><a href = "busking_insert?name=${sessionScope.userid}">버스킹 등록</a></li>
					<li><a href = "busking_mylist?busking_userid=${sessionScope.userid}">등록한 공연보기</a></li>
					<!-- <li><a href = "busking_admin">버스킹 운영자</a>	</li> -->
					</ul></li>
					<li><a href="sns_update?name=${getsnsdto.snspage_artistid}">페이지 수정</a></li>
				</c:if>
				<!-- 
				<li><a href="searchviewall?searchid=${getsnsdto.snspage_artistid}&searchval=artist">노래 모아보기</a></li>
				-->
			</ul>
		</td>
	</tr>
	<tr height="70%">
		<td width="15%" align="center" valign="top"><img alt="bb"
			src="./resources/userproimg/${getsnsdto.snspage_profileimgname}" width="200"
			height="200"
			onerror="this.src='/indietrade/resources/userproimg/images1.png'"><br>
			<font size="3" color="gray">${getsnsdto.snspage_artistid}</font><br>
			<font size="3" color="gray">나를 사랑하는 사람들 ${likecount} 명</font>
			 <textarea class="form-control" rows="10" cols="20" id="comment" name="comment"
				disabled="disabled">${getsnsdto.snspage_content}</textarea>
	<div class="spacer_10" ></div>
		<c:choose>
		  	<c:when test="${snspage_like_ch eq 0}">
          <button class="btn btn-default" onclick="snspageUp()"><i class="fa fa-heart" aria-hidden="true"></i>페이지 즐겨찾기</button>
          </c:when>
          <c:when test="${snspage_like_ch eq '1'}">
           <button class="btn btn-default" onclick="snspageDown()"><i class="fa fa-heart" aria-hidden="true"></i>페이지 즐겨찾기 취소</button>
          </c:when>
          <c:otherwise></c:otherwise>
          </c:choose>
          </td>
		<td>
			<table width="100%" height="10%">
				<div class="container">
					<h2>타임라인</h2>
					<div class="form-group" align="right">
<!-- 						<label for="comment">글쓰기</label> -->
						<c:choose>
							<c:when test="${empty sessionScope.username}">
								<textarea class="form-control" rows="5" id="board_content"
									id=snscontent disabled="disabled">글쓰기는 로그인 후 작성 가능합니다.
								</textarea>
							</c:when>
							<c:otherwise>
								<input type="hidden" value="${serverTime}" id="time">
								<textarea class="form-control" rows="5" id="board_content"
									id=snscontent style="resize: none;"></textarea>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="loginid" value="${sessionScope.userid}">
						<button class="btn btn-link" onclick="snscontent()">등록</button>
					</div>
					<!--이름 ,등록일 , 내용  -->
					<c:choose>
						<c:when test="${empty snslist}">
							<div class="media">
								<div class="media-left">
									<img src="./resources/userproimg/${getsnsdto.snspage_profileimgname}"
										class="media-object" style="width: 150" height="150"
										onerror="this.src='/indietrade/resources/img/default.png'">
								</div>
								<div class="media-body">
									<h4 class="media-heading">
										귀여운 관리자 <small><i>${serverTime}</i></small>
									</h4>
									<p>
										반갑습니다.${sessionScope.username}님 ${getsnsdto.snspage_artistid}페이지에
										오신것을 환영합니다.<br> 페이지에 첫 마디를 남겨 보세요.
									</p>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="bdto" begin="0" step="1"
								end="${fn:length(snslist)}" items="${snslist}">
								<div class="media">
									<div class="media-left">
										<img src="/indietrade/resources/img/client/${bdto.snsboard_loginidimg}"
											class="media-object" style="width: 80px"
											onerror="this.src='/indietrade/resources/img/default.png'">
									</div>
									<div class="media-body">
										<h4 class="media-heading">
											${bdto.snsboard_loginname} <small><i>${bdto.snsboard_contenttime}</i></small>
										</h4>
										<h6>${bdto.snsboard_content}</h6>
										<input type="hidden" name="contentno" id="contentno"
											value="${bdto.snsboard_contentno}">
										<c:if test="${bdto.snsboard_loginid eq sessionScope.userid or sessionScope.userid eq getsnsdto.snspage_artistid}">
											<div align="right">
												<button class="btn btn-link" onclick="snscontent_del()">삭제</button>
											</div>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</table> 
			<input type="hidden" id="loginusername" name="loginusername"
			value="${sessionScope.username}">
		</td>
		
	</tr>
</table>
<div class="spacer_30" ></div>
<p>
<c:import url="../bottom.jsp" charEncoding="utf-8" />


