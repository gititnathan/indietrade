<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../top.jsp" charEncoding="utf-8" />    
<head>
	<meta http-equiv=”Cache-Control” content=”no-cache”/> 
	<meta http-equiv=”Expires” content=”0″/> 
	<meta http-equiv=”Pragma” content=”no-cache”/>   
	<title>INDIETRADE - 이메일 인증</title>
</head>
<style>
.blank-section {
margin-bottom: 15px;
margin-top: 15PX;
}
.card {
position: relative;
display: -ms-flexbox;
display: flex;
-ms-flex-direction: column;
flex-direction: column;
min-width: 0;
word-wrap: break-word;
background-color: #fff;
background-clip: border-box;
border: 1px solid rgba(0,0,0,.125);
border-radius: .35rem;
margin-bottom: 15px;
}
</style>
<script>
function submit() {
	document.f.submit();
}
</script>

<p>
<div class="container">    
    <div class="blank-section"></div>  
	<div class="row"> 
<div class="col-lg-12"> 
<div class="card text-center">   
<div class="card-header"></div>   
<div class="card-body">     
<h3 class="card-title">이메일 인증 페이지 입니다.</h3>   
<div class="card-text">아래 링크를 눌러 이메일 인증을 진행해주세요.</div> <br> 
<form onclick="submit()" id="f" action="user_authEmail">   
 <a href="javascript:;" class="btn btn-primary">이메일 인증</a> </div> 
 <span class="text-muted"><span class="label label-success">Note:-</span>
	회원가입시 등록한 이메일로 메일발송 됩니다.</span><br></div> </div> </div> 
	</form>
		</div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />