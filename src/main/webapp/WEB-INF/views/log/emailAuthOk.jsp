<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../top.jsp" charEncoding="utf-8" />
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
<head>
<meta http-equiv=”Cache-Control” content=”no-cache” />
<meta http-equiv=”Expires” content=”0″ />
<meta http-equiv=”Pragma” content=”no-cache” />
<title>INDIETRADE - 이메일 인증 완료</title>
</head>
<p>
<div class="container">
	<div class="blank-section"></div>
	<div class="row">
		<div class="col-lg-12">
			<div class="card text-center">
				<div class="card-header"></div>
				<div class="card-body">
					<h3 class="card-title">인증이 완료되었습니다.</h3>
					<div class="card-text">이제 해당 계정 및 이메일 사용이 가능합니다. 로그인 후 이용해 주시기 바랍니다.</div>
					<br> <a href="user_login" class="btn btn-primary"
						style="margin-bottom: 20px;">로그인</a>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />