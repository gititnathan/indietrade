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

	/**이벤트 발생 (크롬,파이어폭스,사파이어 OK!) **/
	function eventOccur(evEle, evType) {
		if (evEle.fireEvent) {
			evEle.fireEvent('on' + evType);
		} else {
			//MouseEvents가 포인트 그냥 Events는 안됨~ ??
			var mouseEvent = document.createEvent('MouseEvents');
			/* API문서 initEvent(type,bubbles,cancelable) */
			mouseEvent.initEvent(evType, true, false);
			var transCheck = evEle.dispatchEvent(mouseEvent);
			if (!transCheck) {
				//만약 이벤트에 실패했다면
				console.log("클릭 이벤트 발생 실패!");
			}
		}
	}
	/** 대체버튼 클릭시 강제 이벤트 발생**/
	function proimg() {
		eventOccur(document.getElementById('proFile'), 'click');
		
		/* alert(orgFile.value); 이벤트 처리가 끝나지 않은 타이밍이라 값 확인 안됨! 시간차 문제 */
	}
	function mainimg() {
		eventOccur(document.getElementById('mainFile'), 'click');
		/* alert(orgFile.value); 이벤트 처리가 끝나지 않은 타이밍이라 값 확인 안됨! 시간차 문제 */
	}
	/* 대체버튼 클릭후 진행후 이벤트  */
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
						+배경화면 변경</button>
				</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" width="100%">
			<ul class="nav nav-tabs">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> 음원관리 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">음원 등록</a></li>
						<li><a href="#">음원 그래프</a></li>
						<li><a href="#">후원확인</a></li>
					</ul></li>
				<li><a href="#">개인정보수정</a></li>
				<li><a type="submit">저장</a></li>
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
						+프로필 사진 변경</button><br>
						<input type="hidden" id="user_no" value="${dto.user_no}">
						<input type="hidden" id="artistId" value="${dto.artistId}">
			<font size="3" color="blue">${dto.artistId}</font><br>
			${dto.pagecontent}
		</td>
		</form>
		<td>
			<table width="100%" height="10%">
				<div class="container">
					<font size="5" color="red">※변경 된 내용은 바로 수정되어 적용 됩니다※</font>
					<h2>타임라인</h2><br>
					<form name="f" action="/content" method="post">
						<div class="form-group" align="right">
							<label for="comment">타임라임 설명</label>
							<textarea class="form-control" rows="5" id="comment" disabled="disabled">
							타임라임에서 삭제 된 게시글은 복구가 안되니 신중하게 하여 주시길 바랍니다.
							</textarea>
							<input type="hidden" name="loginid" value="${loginid}">
						</div>
					</form>

					<!--이름 ,등록일 , 내용  -->
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
										반갑습니다.${loginId}님 ${dto.artistId}페이지에 오신것을 환영합니다.<br>
										페이지에 첫 마디를 남겨 보세요.
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


