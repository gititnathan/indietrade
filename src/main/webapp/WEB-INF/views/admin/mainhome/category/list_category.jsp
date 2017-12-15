<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="euc-kr"/>
<c:import url="../../top.jsp" charEncoding="utf-8"/>

<div class="row content">
    <div class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="admin_insertCategory">ī�װ� ���</a></li>
        <li><a href="admin_listCategory">ī�װ� ����</a></li>

      </ul><br>
     
    </div>
</div>

<div class="container-custom">
<fieldset>

<!-- Form Name -->
<legend>ī�װ� ����</legend>

<table class="table" style="width: auto !important">
    <thead>
      <tr>
        <th>��ȣ</th>
        <th>��з� ī�װ�</th>
        <th>�Һз� ī�װ�</th>
        <th>����</th>
        <th>����</th>
      </tr>
    </thead>
    <c:if test="${empty categoryList}">
		<tr>
			<td colspan="3">��ϵ� ī�װ��� �����ϴ�</td>
		</tr>	
	</c:if>
	<c:forEach var="dto" items="${categoryList}"> 
    <tbody>
      <tr>
        <td>${dto.num}</td>
        <td>${dto.majorCategories}</td>
        <td>${dto.subCategories}</td>
       <td><input type="button" value="����" class="btn btn-default"
					onclick="window.location='admin_updateCategory?num=${dto.num}'"></td>
		<td><input type="button" value="����" class="btn btn-default"
					onclick="window.location='admin_deleteCategory?num=${dto.num}'"></td>
      </tr>
     
      	 
    
    </tbody>
    </c:forEach>
  </table>
  
  
</fieldset>
</div>
