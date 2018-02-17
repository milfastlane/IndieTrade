<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="../top.jsp" charEncoding="utf-8" />
<style>
.spacer_ {
	height: 60px;
}

.faqHeader {
	font-size: 27px;
	margin: 20px;
}

.panel-heading [data-toggle="collapse"]:after {
 	font-family: 'FontAwesome'; 
 	content: '\f0da';
	float: right;
	color: #4cc71c; /* F58723 <- orange */
	font-size: 18px;
	line-height: 22px;
	/* rotate "play" icon from > (right arrow) to down arrow */
	-webkit-transform: rotate(-90deg);
	-moz-transform: rotate(-90deg);
	-ms-transform: rotate(-90deg);
	-o-transform: rotate(-90deg);
	transform: rotate(-90deg);
}

.panel-heading [data-toggle="collapse"].collapsed:after {
	/* rotate "play" icon from > (right arrow) to ^ (up arrow) */
	-webkit-transform: rotate(90deg);
	-moz-transform: rotate(90deg);
	-ms-transform: rotate(90deg);
	-o-transform: rotate(90deg);
	transform: rotate(90deg);
	color: #454444;
}
</style>
<script>
function a(){	
	location.href='qnamain'
}
</script>

<div class="container">
	<div class="spacer_"></div>
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        This section contains a wealth of information, related to <a href="/indietrade/"><strong>INDIETRADE</strong></a> and its store. 
    </div>

    <div class="panel-group" id="accordion">
        <div class="faqHeader">자주하는 질문들</div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                    가입이 필요한가요?</a>
                </h4>
            </div><!-- :after -->
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <strong>인디트레이드</strong>의 모든 서비스를 이용하시기 위해서는 계정가입이 필요합니다. 
                    	계정가입이 되어있지 않을 경우 사이트 이용에 제한이 있습니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">
                    	아티스트 SNS는 무엇인가요?</a>
                </h4>
            </div>
            <div id="collapseTen" class="panel-collapse collapse">
                <div class="panel-body">
                    <strong>인디트레이드</strong>에 등록된 아티스트들이 생성 할 수 있는 블로그로 본인의 음원 등록과 공연등을 등록/수정/관리 하실 수 있는 페이지 입니다.
                 	  자신의 음악과 공연일정을 홍보하고 팬과 소통하는 용도로 활용해보세요.
                </div>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">아이디를 변경 할 수 있나요?</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                    <strong>인디트레이드</strong>는 최초 가입시 등록된 아이디를 변경해드리지 않습니다.                 
                </div>
            </div>
        </div>
       
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">좋아하는 음악을 모아보고 싶어요.</a>
                </h4>
            </div>
            <div id="collapseFive" class="panel-collapse collapse">
                <div class="panel-body">
                    	로그인 시 하단 탭을 클릭하면, my Like에서 좋아하는 음악으로 체크 한 모든 앨범과 SNS페이지들을 모아 볼 수 있습니다.
                    <br />
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">버스킹은 무엇인가요?</a>
                </h4>
            </div>
            <div id="collapseSix" class="panel-collapse collapse">
                <div class="panel-body">
                    인디음악인들의 공연적 특성을 고려한 공연정보 공유 페이지 입니다. 아티스트는 소규모로 진행되는 버스킹의 장소와 시간을 공지하고 팬들은 좋아하는 아티스트의 공연정보를 얻을 수 있습니다.

                </div>
            </div>
        </div>
          <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">뮤직비디오가 없을때는?</a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">
                <div class="panel-body">
                  좋아하는 뮤직비디오 업로드는 필수사항이 아닙니다. 뮤직비디오는 추후 음원 수정으로 등록이 가능합니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">보낸 쪽지를 삭제하고 싶어요.</a>
                </h4>
            </div>
            <div id="collapseEight" class="panel-collapse collapse">
                <div class="panel-body">
                    상대방이 읽지 않은 쪽지는 삭제할 수 있지만 읽은 후의 쪽지는 삭제할 수 없습니다. 신중한 쪽지이용 바랍니다.
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">일반회원이지만 SNS페이지 운영을 하고싶어요.</a>
                </h4>
            </div>
            <div id="collapseNine" class="panel-collapse collapse">
                <div class="panel-body">
                  	현재까지 저희의 SNS서비스는 아티스트 회원 대상으로 진행됩니다. 좋아하는 페이지를 추가하여 아티스트와 소통이 가능하니 많은 이용 바랍니다.
                </div>
            </div>
        </div>

                <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">음원 다운로드시 비용을 지불해야하나요?</a>
                </h4>
            </div>
            <div id="collapseEleven" class="panel-collapse collapse">
                <div class="panel-body">
                   더 나은 인디음악의 발전을 위해 <strong>인디트레이드</strong>의 모든 음원은 아티스트 회원들의 동의하에 무료로 업로드 됩니다. 추후 아티스트 후원하기로 좋아하는 아티스트를 후원 하실 수 있습니다. 
                </div>
            </div>
        </div>
                <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">불량회원 신고가 가능한가요?</a>
                </h4>
            </div>
            <div id="collapseSeven" class="panel-collapse collapse">
                <div class="panel-body">
                    댓글이나 쪽지로 비방, 인신공격등 사이트 이용에 부적절한 사례 적발시 강제 탈퇴 당할 수 있습니다. 운영자에게 1:1 쪽지가 가능하니 이와같은 위반사항 발생 시 문의 바랍니다.
                </div>
            </div>
        </div>
         <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">탈퇴하고싶어요.</a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                     로그인 시 하단 탭을 클릭하면 회원 정보 수정과 탈퇴를 진행 하실 수 있습니다.
                    <ul>
                        <li> 계정과 닉네임을 포함한 계정 정보(아이디/이메일/닉네임)및 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.</li>
                        <li>탈퇴 시 기존에 작성 된 게시물은 삭제되지 않으며, 익명처리 후 IndieTrade로 소유권이 귀속됩니다. </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="container bg-2 text-center">
  <h3 class="margin">더 많은 질문이 있으시다면<br> QNA BOARD에 질문을 남겨주세요. </h3>
  <button type="button" class="btn btn-default" onclick="a();">INDIETRADE SUPPORT</button>
 
</div>
	<div class="spacer_"></div>
<c:import url="../bottom.jsp" charEncoding="utf-8" />