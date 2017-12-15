<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<%
		String upPath = application.getRealPath("/resources/images");
%>

<body>
<div align="center">
	<b>앨범 목록</b>
	<table border="0" width="600">
		<tr bgcolor="yellow">
			<td align="right"><a href="indie_write">글쓰기</a></td>
		</tr>
	</table>
		<table border="1" width="600">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="30%">앨범타이틀</th>
			<th>가수이름</th>
			<th>뮤직비디오</th>
			<th>앨범자켓</th>
		</tr>
		<c:choose>
		<c:when test = "${boardList == null}" >
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>	
		</c:when>
		<c:otherwise>
			<c:forEach items="${boardList}" var="list">
				<tr>
			<td>${list.albumNum}</td>
			<td>
				<a href="album_content?albumnum=${list.albumNum}">
					${list.albumName}
				</a>
			</td>
			<td>${list.artistName}</td>
	 
		<td align="center" class="m3">
			<img src="<%=upPath%>/${list.albumImage}"
															width="200" height="200">
		</td> 
		</tr>						
			</c:forEach>
		</c:otherwise>
		</c:choose>
	
	</table>
</div>
</body>














