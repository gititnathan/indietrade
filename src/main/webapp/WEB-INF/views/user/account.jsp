<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="euc-kr" />
<c:import url="../top.jsp" charEncoding="utf-8" />  


	
	<table align="center">
		<tr height="200" background="./resources/img/${dto.pagemainimgname}">
			<td colspan="2"> <font size="4" color="red">${dto.pagename}</font>
			</td>
		</tr>
		<tr>
			<td colspan="2" width="100%">
				<ul class="nav nav-tabs">
					<li><a href="user_update?name=${dto.No}">개인정보수정</a></li>
				</ul>
				
			</td>
		</tr>
		<tr height="70%">
			<td width="15%" align="center" valign="top"><img alt="bb" src="./resources/img/${dto.pageproimgname}"
				width="150" height="150" onerror="this.src='/indietrade/resources/img/images1.png'"><br> <font
				size="3" color="blue">${dto.artistId}</font><br>
				${dto.pagecontent}
				</td>
			<td>
				<table width="100%" height="10%">
					<div class="container">

						
						<!--이름 ,등록일 , 내용  -->
						<c:choose >
						<c:when test="${!empty dto}">
          					 <div class="media">
							<div class="media-left">
								<img src="/resources/img/default.png" class="media-object" style="width: 45px"
								onerror="this.src='/indietrade/resources/img/default.png'">
							</div>
							<div class="media-body">
								<h4 class="media-heading">
									귀여운 관리자 <small><i>${serverTime}</i></small>
								</h4>
								<p>반갑습니다.${loginId}님  ${dto.artistId}페이지에 오신것을 환영합니다.<br>
								페이지에 첫 마디를 남겨 보세요.</p>
							</div>
						</div>
      					 </c:when>
						<c:otherwise>
						<c:forEach var="dto" step="1" end="${snspagedtosize}" items="snspagedto">
						<div class="media">
							<div class="media-left">
								<img src="/resoureces/userimg/${logindto.filename}" class="media-object" style="width: 45px"
								onerror="this.src='/indietrade/resources/img/default.png'">
							</div>
							<div class="media-body">
								<h4 class="media-heading">
									${loginId} <small><i>${serverTime}</i></small>
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


