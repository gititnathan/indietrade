<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="euc-kr" />
<c:import url="../top.jsp" charEncoding="utf-8" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js">
</script>
<p>
<style type="text/css">
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
	            uploadFile();
	        };

	}
	function cMainimg() {
		
		 var oFReader = new FileReader();
	        oFReader.readAsDataURL(document.getElementById("mainFile").files[0]);

	        oFReader.onload = function (oFREvent) {
	        	
	            document.getElementById('mainimgB').style.backgroundImage = "url("+oFREvent.target.result+")";
	            uploadFile();
	        };
	}
	
</script>
<form name="allupdate" action="sns_blog_pagemainimgnameUp" method="post" enctype="multipart/form-data">
<table align="center">

	<tr class="background_size" height="250" background="./resources/img/${dto.pagemainimgname}" id="mainimgB">
		<td colspan="2"><font size="4" color="red">${dto.pagename}</font><br>
		<div align="right">
					<input type="file" multiple id="mainFile"
						style="display: none;" onchange="cMainimg()">	
					<button id="newFile" onclick="mainimg()" class="btn btn-link" style="margin-top: 150px">
						+���ȭ�� ����</button>
				</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" width="100%">
			<ul class="nav nav-tabs">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> �������� <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">���� ���</a></li>
						<li><a href="#">���� �׷���</a></li>
						<li><a href="#">�Ŀ�Ȯ��</a></li>
					</ul></li>
				<li><a href="#">������������</a></li>
				<li><a type="submit">����</a></li>
			</ul>
		</td>
	</tr>
	<tr height="70%">
		<td width="15%" align="center" valign="top">
			<input type="file" multiple id="proFile"
						style="display: none;" onchange="cProimg()">
			 <img id ="proImg" alt="proImg" src="./resources/img/${dto.pageproimgname}"
			width="150" height="150" onerror="this.src='/indietrade/resources/img/images1.png'"><br> 
			<button id="newFile" onclick="proimg()" class="btn btn-link">
						+������ ���� ����</button><br>
						<input type="hidden" id="user_no" value="${dto.user_no}">
						<input type="hidden" id="artistId" value="${dto.artistId}">
			<font size="3" color="blue">${dto.artistId}</font><br>
			${dto.pagecontent}
		</td>
		</form>
		<td>
			<table width="100%" height="10%">
				<div class="container">
					<font size="5" color="red">�غ��� �� ������ �ٷ� �����Ǿ� ���� �˴ϴ١�</font>
					<h2>Ÿ�Ӷ���</h2><br>
					<form name="f" action="/content" method="post">
						<div class="form-group" align="right">
							<label for="comment">Ÿ�Ӷ��� ����</label>
							<textarea class="form-control" rows="5" id="comment" disabled="disabled">
							Ÿ�Ӷ��ӿ��� ���� �� �Խñ��� ������ �ȵǴ� �����ϰ� �Ͽ� �ֽñ� �ٶ��ϴ�.
							</textarea>
							<input type="hidden" name="loginid" value="${loginid}">
						</div>
					</form>

					<!--�̸� ,����� , ����  -->
					<c:choose>
						<c:when test="${!empty dto}">
							<div class="media">
								<div class="media-left">
									<img src="/resources/img/default.png" class="media-object"
										style="width: 45px"
										onerror="this.src='/indietrade/resources/img/default.png'">
								</div>
								<div class="media-body">
									<p>
										�ݰ����ϴ�.${loginId}�� ${dto.artistId}�������� ���Ű��� ȯ���մϴ�.<br>
										�������� ù ���� ���� ������.
									</p>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" step="1" end="${snspagedtosize}"
								items="snspagedto">
								<div class="media">
									<div class="media-left">
										<img src="/resoureces/userimg/${logindto.filename}"
											class="media-object" style="width: 45px"
											onerror="this.src='/indietrade/resources/img/default.png'">
									</div>
									<div class="media-body">
										<h4 class="media-heading">
											${loginId} <small><i>${dto.content}</i></small>
										</h4>

									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</table>
		</td>
	</tr>
</table>

<c:import url="../bottom.jsp" charEncoding="utf-8" />


