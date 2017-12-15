<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<c:import url="../../top.jsp" charEncoding="utf-8"/>

<div class="row content">
    <div class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="admin_insertCategory">카테고리 등록</a></li>
        <li><a href="admin_listCategory">카테고리 보기</a></li>

      </ul><br>
     
    </div>
</div>

<div class="container-custom">
<fieldset>

<!-- Form Name -->
<legend>카테고리 보기</legend>

<table class="table" style="width: auto !important">
    <thead>
      <tr>
        <th>번호</th>
        <th>대분류 카테고리</th>
        <th>소분류 카테고리</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
    </thead>
    <c:if test="${empty categoryList}">
		<tr>
			<td colspan="3">등록된 카테고리가 없습니다</td>
		</tr>	
	</c:if>
	<c:forEach var="dto" items="${categoryList}"> 
    <tbody>
      <tr>
        <td>${dto.num}</td>
        <td>${dto.majorCategories}</td>
        <td>${dto.subCategories}</td>
       <td><input type="button" value="수정" class="btn btn-default"
					onclick="window.location='admin_updateCategory?num=${dto.num}'"></td>
		<td><input type="button" value="삭제" class="btn btn-default"
					onclick="window.location='admin_deleteCategory?num=${dto.num}'"></td>
      </tr>
     
      	 
    
    </tbody>
    </c:forEach>
  </table>
  
  
</fieldset>
</div>
