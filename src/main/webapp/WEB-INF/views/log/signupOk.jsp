<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="../top.jsp" charEncoding="utf-8" />
<style>
.blank-section {
	margin-bottom: 15px;
	margin-top: 15PX;
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	min-height: 300px;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: .35rem;
	margin-bottom: 15px;
}

.img-responsive {
	position: relative;
	width: 45px;
	height: auto;
}
.spacer_ {
    height: 40px;
}
</style>

<sec:authorize access="isAuthenticated()">   
    <% response.sendRedirect("/indietrade/"); %>
</sec:authorize>

<head>
<meta http-equiv=”Cache-Control” content=”no-cache” />
<meta http-equiv=”Expires” content=”0″ />
<meta http-equiv=”Pragma” content=”no-cache” />
<title>INDIETRADE - 이메일 인증 송신</title>
</head>
<p>
<div class="container">
	<div class="blank-section"></div>
	<div class="row">
			<div class="card text-center">
				<div class="card-header"></div>
				<div class="card-body">
					<div class="spacer_"></div>
					<i class="fa fa-envelope-o fa-5x" aria-hidden="true"></i>
					<h3 class="card-title" style="margin-top: 50px;">
						<b>${email}</b> 로 인증 요청 메일을 보냈습니다.
					</h3>
					<div class="card-text">해당 이메일을 확인 하시고, 인증 확인 링크를 눌러 주시기 바랍니다.</div>
					<br>
				</div>
				<span class="text-muted"><span class="label label-warning">Note:-</span>
					이메일 인증이 완료 되지 않을 경우 로그인에 제한이 있습니다.</span><br>
			</div>
		</div>
	</div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />