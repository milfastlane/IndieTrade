<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="euc-kr" />
<c:import url="../top.jsp" charEncoding="utf-8" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js">
</script>
<script src="https://github.com/jquery-form/form.git">
</script>

<style type="text/css">
.spacer_{
	height: 80px;
}
.spacer_30 {
   height: 30px;
}
.background_size {
	background-size: 100% 100%;
}
</style>
	<script>

	/**�̺�Ʈ �߻� (ũ��,���̾�����,�����̾� OK!) **/
	function eventOccur(evEle, evType) {
		if (evEle.fireEvent) {
			evEle.fireEvent('on' + evType);
		} else {
			//MouseEvents�� ����Ʈ �׳� Events�� �ȵ�~ ??
			var mouseEvent = document.createEvent('MouseEvents');
			/* API���� initEvent(type,bubbles,cancelable) */
			mouseEvent.initEvent(evType, true, false);
			var transCheck = evEle.dispatchEvent(mouseEvent);
			if (!transCheck) {
				//���� �̺�Ʈ�� �����ߴٸ�
				console.log("Ŭ�� �̺�Ʈ �߻� ����!");
			}
		}
	}
	
	/** ��ü��ư Ŭ���� ���� �̺�Ʈ �߻�**/
	function proimg() {
		eventOccur(document.getElementById('proFile'), 'click');
		
		/* alert(orgFile.value); �̺�Ʈ ó���� ������ ���� Ÿ�̹��̶� �� Ȯ�� �ȵ�! �ð��� ���� */
	}
	function mainimg() {
		eventOccur(document.getElementById('mainFile'), 'click');
		/* alert(orgFile.value); �̺�Ʈ ó���� ������ ���� Ÿ�̹��̶� �� Ȯ�� �ȵ�! �ð��� ���� */
	}
	/* ��ü��ư Ŭ���� ������ �̺�Ʈ  */
	function cProimg() {
		
		 var oFReader = new FileReader();
	        oFReader.readAsDataURL(document.getElementById("proFile").files[0]);

	        oFReader.onload = function (oFREvent) {
	        	
	            document.getElementById("proImg").src = oFREvent.target.result;
	          
	        };
	        var formData = new FormData();
	      
	    	 //ù��° �����±�
	    	 	formData.append("proFile",$("input[name=proFile]")[0].files[0]);
				formData.append("user_no",$('#user_no').val());
	             $.ajax({
	                url: '/indietrade/sns_snspage_pageproimgnameUp',
	                processData: false,
	                    contentType: false,
	                data: formData,
	                type: 'POST',
	                success: function(result){
	                }
	            });

	}
	function cMainimg() {
		
		 var oFReader = new FileReader();
	        oFReader.readAsDataURL(document.getElementById("mainFile").files[0]);

	        oFReader.onload = function (oFREvent) {
	        	
	            document.getElementById('mainimgB').style.backgroundImage = "url("+oFREvent.target.result+")";
	           
	        };
	       
	        var formData = new FormData();
		      
	    	 //ù��° �����±�
	    	 	formData.append("mainFile",$("input[name=mainFile]")[0].files[0]);
				formData.append("user_no",$('#user_no').val());
	             $.ajax({
	                url: '/indietrade/sns_snspage_pagemainimgnameUp',
	                processData: false,
	                    contentType: false,
	                data: formData,
	                type: 'POST',
	                success: function(result){
	                }
	            });
		     
	}
	
	//�̸� ����
	function cNameup(){
		 var inputed = $('#user_no').val()
		 var inputed2 = $('#pagename').val()
         $.ajax({
            url: '/indietrade/sns_snspage_pagenameUp',
            data: {user_no:inputed , pagename:inputed2},
            type: 'POST',
            success: function(result){
                $('.Rmainname').text(inputed2);
            }
        });
	}
	function snscontent_del() {
		var inputed = $('#contentno').val()
		var inputed2 = $('#userid').val()
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
	function Recontent(){
		 var inputed = $('#user_no').val()
		 var inputed2 = $('#REcontent').val()
         $.ajax({
            url: '/indietrade/sns_snspage_pageprocontent',
            data: {user_no:inputed , pagecontent:inputed2},
            type: 'POST',
            success: function(result){
                location.reload();
            }
        });
	}
</script>
<div class="spacer_"></div>
<table align="center">
	
	<tr class="background_size" height="200"
		background="./resources/userproimg/${snsdto.snspage_mainimgname}"
		id="mainimgB">
		<td colspan="2"><font size="100" id=Rmainname class="Rmainname">${snsdto.snspage_name}</font>
		<input type="hidden" id="userid" value="${sessionScope.userid}" name="userid">
			<br>
		<input type="text" name="pagename" id=pagename size="30" width="200"
			height="50">
			<button name="pagename_ok" class="btn btn-info" onclick="cNameup()">����</button>
			<br>
			<div align="right">
				<input type="file" multiple id="mainFile" name="mainFile"
					style="display: none;" onchange="cMainimg()">
				<button id="newFile" onclick="mainimg()" class="btn btn-info"
					style="margin-top: 150px">+���ȭ�� ����</button>
			</div></td>
	</tr>
	<tr>
		<td colspan="2" width="100%">
			<ul class="nav nav-tabs">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> �������� <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="writeForm_step1">���� ���</a></li>
						<li><a href="#">���� �׷���</a></li>
						<li><a href="#">���� Ȯ��</a></li>
					</ul></li>
				<li><a href="#">������������</a></li>
				<li><a href="sns?name=${sessionScope.userid}">�������� ���ư���</a></li>
			</ul>
		</td>
	</tr>
	<tr height="70%">
		<td width="15%" align="center" valign="top"><input type="file"
			multiple id="proFile" name="proFile" style="display: none;"
			onchange="cProimg()"> <img id="proImg" alt="proImg"
			src="./resources/userproimg/${snsdto.snspage_profileimgname}" width="200"
			height="200"
			onerror="this.src='/indietrade/resources/userproimg/images1.png'"><br>
			<button id="newFile" onclick="proimg()" class="btn btn-link">
				+������ ���� ����</button>
			<br> <input type="hidden" id="user_no" name="user_no" value="${snsdto.user_no}"> 
			<input type="hidden" id="artistId" value="${snsdto.snspage_artistid}"> 
			<font size="5" color="blue">${dto.snspage_artistid}</font><br>
			 <textarea class="form-control" rows="10" cols="20"
				id="REcontent" name="REcontent" placeholder="${snsdto.snspage_content}"></textarea>
			<br>
		<button class="btn btn-link" onclick="Recontent()">����</button></td>
		<td>
<!-- 			<table width="100%" height="10%"> -->
				<div class="container">
					<font size="5" color="red">�غ��� �� ������ �ٷ� �����Ǿ� ���� �˴ϴ١�</font>
					<h2>Ÿ�Ӷ���</h2>
					<br>
						<div class="form-group" align="left">
							<label for="comment">Ÿ�Ӷ��� ����</label>
<!-- 							<textarea class="form-control" rows="5" id="comment" -->
<!-- 								disabled="disabled"> -->
<!-- 							Ÿ�Ӷ��ӿ��� ���� �� �Խñ��� ������ �ȵǴ� �����ϰ� �Ͽ� �ֽñ� �ٶ��ϴ�. -->
<!-- 							</textarea> -->
						<label for="comment">Ÿ�Ӷ��ο��� ���� �� �Խñ��� ������ �ȵǴ� �����ϰ� �Ͽ� �ֽñ� �ٶ��ϴ�.</label>
						</div>
						<c:forEach var="bdto" begin="0" step="1"
								end="${fn:length(snsboardlist)}" items="${snsboardlist}">
								<div class="media">
									<div class="media-left">
<img src="/indietrade/resources/img/client/${bdto.snsboard_loginidimg}"
											class="media-object" style="width: 80px"
											onerror="this.src='/indietrade/resources/img/default.png'">									</div>
									<div class="media-body">
										<h4 class="media-heading">
											${bdto.snsboard_loginname} <small><i>${bdto.snsboard_contenttime}</i></small>
										</h4>
										<h6>${bdto.snsboard_content}</h6>
										<input type="hidden" name="contentno" id="contentno"
											value="${bdto.snsboard_contentno}">
											<div align="right">
												<button class="btn btn-link" onclick="snscontent_del()" style="align:right">����</button>
											</div>
									</div>
								</div>
							</c:forEach>
					<!--�̸� ,����� , ����  -->
					
				</div>
			</table>
		</td>
	</tr>
</table>

<c:import url="../bottom.jsp" charEncoding="utf-8" />


