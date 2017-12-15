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
<form class="form-horizontal" action="admin_updateCategory" 
method="post" >
<fieldset>

<!-- Form Name -->
<legend>카테고리 등록</legend>

<input type="hidden" name="num" value="${getCategory.num}"/>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="majorCategories">대분류 카테고리</label>  
  <div class="col-md-4">
  <input id="majorCategories" name="majorCategories" type="text" placeholder="" class="form-control input-md"
  value="${getCategory.majorCategories}">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="subCategories">소분류 카테고리</label>  
  <div class="col-md-4">
  <input id="subCategories" name="subCategories" type="text" placeholder="" class="form-control input-md"
   value="${getCategory.subCategories}">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-4">
    <button id="submit" name="submit" class="btn btn-default">확인</button>
  </div>
</div>

</fieldset>
</form>
</div>