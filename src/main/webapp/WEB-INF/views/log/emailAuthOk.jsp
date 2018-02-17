<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../top.jsp" charEncoding="utf-8" />

<style>
.blank-section {
margin-bottom: 15px;
margin-top: 30PX;
}
.card {
position: relative;
display: -ms-flexbox;
display: flex;
min-height:300px;
-ms-flex-direction: column;
flex-direction: column;
min-width: 0;
word-wrap: break-word;
background-color: #fff;
background-clip: border-box;
border: 1px solid rgba(0,0,0,.125);
border-radius: .35rem;
margin-bottom: 15px;
}
.spacer_ {
    height: 60px;
}

.img-responsive{
	position : relative;
	width : 50px;
	height : auto;
}

</style>
<head>
<meta http-equiv=��Cache-Control�� content=��no-cache�� />
<meta http-equiv=��Expires�� content=��0�� />
<meta http-equiv=��Pragma�� content=��no-cache�� />
<title>INDIETRADE - �̸��� ���� �Ϸ�</title>
</head>
<p>
<div class="container">
	<div class="blank-section"></div>
	<div class="row">
		<div class="col-lg-12">
			<div class="card text-center">
				<div class="card-header"></div>
				<div class="card-body">
				<div class="spacer_"></div>
				<i class="fa fa-desktop fa-5x" aria-hidden="true"></i>
					<h3 class="card-title">������ �Ϸ�Ǿ����ϴ�.</h3>
					<div class="card-text">���� �ش� ���� �� �̸��� ����� �����մϴ�. �α��� �� �̿��� �ֽñ� �ٶ��ϴ�.</div>
					<br> <a href="user_login" class="btn btn-primary"
						style="margin-bottom: 20px;">�α���</a>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />