<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
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

.spacer_ {
   height: 50px;
}

.img-responsive {
   position: relative;
   width: 50px;
   height: auto;
}
</style>
<!-- 
<sec:authorize access="isAuthenticated()">   
    <%// response.sendRedirect("main");%>
</sec:authorize>
-->
<p>
<p>
<div class="container">
   <div class="blank-section"></div>
   <div class="row">
      <div class="col-lg-12">
         <div class="card text-center">
            <div class="card-header"></div>
            <div class="card-body">
               <div class="spacer_"></div>
               <i class="fa fa-user-times fa-5x" aria-hidden="true"></i>
               <h3 class="card-title">회원 탈퇴시 아래의 조치가 취해 집니다.</h3>
               <div class="card-text">계정과 닉네임을 포함한 계정 정보(아이디/이메일/닉네임)및 모든 개인
                  정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.<br> 
                  작성된 게시물은 삭제되지 않으며, 익명처리 후 IndieTrade로 소유권이 귀속됩니다. <br>
                  게시물 삭제가 필요한 경우에는 관리자(milfastlane@naver.com)로 문의해 주시기 바랍니다.</div>
               <br>
               <button id="cancelDelete" class="signupbtn btn btn-default"
                  onclick="location.href='/indietrade/'">아니오</button>
               <button id="signinBT" type="submit"
                  class="signupbtn btn btn-warning"
                  onclick="location.href='user_deleteConfirm'">예, 탈퇴하겠습니다</button>
            <div class="spacer_"></div>
            </div>
         </div>
      </div>
   </div>
</div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />