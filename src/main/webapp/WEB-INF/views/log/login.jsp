<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:import url="../top.jsp" charEncoding="utf-8" />


<sec:authorize access="isAuthenticated()">
	<%
		response.sendRedirect("main");
	%>
</sec:authorize>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
.modal-body {
	position: relative;
	padding: 15px;
	margin-top: 50px;
	margin-left: 100px;
	margin-right: -400px;
}

.green-bg {
	background-color: #55ac3a;
	color: #fff;
}

.blue-bg {
	background-color: #4a7499;
	color: #fff;
}

.or-box {
	position: relative;
	border-top: 1px solid #dfdfdf;
	padding-top: 20px;
	margin-top: 20px;
}

.or {
	color: #666666;
	background-color: #f5f5f5;
	position: absolute;
	text-align: center;
	top: -8px;
	margin-left: 115px;
	margin-right: 135px;
	width: 50px;
	left: 135px;
}

.account-box .btn:hover {
	color: #fff;
}

.btn-facebook {
	background-color: #3F639E;
	color: #fff;
	font-weight: bold;
}

.btn-google {
	background-color: #454545;
	color: #fff;
	font-weight: bold;
}

.btn-naver {
	background-color: #1cbf2f;
	color: #fff;
	font-weight: bold;
}

.jumbotron {
	margin-bottom: 0px;
	position: relative;
	background: none;
	min-height: 900px;
	overflow: hidden;
}

.jumbotron .bg {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-image: url("./resources/img/galaxy.jpeg");
	background-size: 100% 75%;
	background-color: black;
	background-repeat: no-repeat;
	-webkit-filter: blur(5px);
	-moz-filter: blur(5px);
	-o-filter: blur(5px);
	-ms-filter: blur(5px);
	filter: blur(5px);
	transform: scale(1.1);
}

#relative {
	position: relative;
	top: 500px;
	left: 360px;
	right: 0px;
	bottom: 0px;
	width: 300px;
	height: 100px;
}

#relative2 {
	position: relative;
	top: -500px;
	left: 780px;
	right: 0px;
	bottom: 0px;
	width: 400px;
	height: 100px;
	font-size: 40px;
	margin-bottom: 0;
}

span.tab-space {
	padding-left: 1.8em;
}

:link {
	
}

:visited {
	color: #551A8B;
}

@import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
	padding: 30px;
	max-width: 350px;
	width: 100% !important;
	background-color: #F7F7F7;
	margin: 0 auto;
	border-radius: 2px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	font-family: roboto;
}

.loginmodal-container h1 {
	text-align: center;
	font-size: 1.8em;
	font-family: roboto;
}

.loginmodal-container input[type=submit] {
	width: 100%;
	display: block;
	margin-bottom: 10px;
	position: relative;
}

.loginmodal-container input[type=text], input[type=password], input[type=email]
	{
	height: 44px;
	font-size: 16px;
	width: 100%;
	margin-bottom: 10px;
	-webkit-appearance: none;
	background: #fff;
	border: 1px solid #d9d9d9;
	border-top: 1px solid #c0c0c0;
	/* border-radius: 2px; */
	padding: 0 8px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover,
	input[type=email]:hover {
	border: 1px solid #b9b9b9;
	border-top: 1px solid #a0a0a0;
	-moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
}

.loginmodal {
	text-align: center;
	font-size: 14px;
	font-family: 'Arial', sans-serif;
	font-weight: 700;
	height: 36px;
	padding: 0 8px;
	/* border-radius: 3px; */
	/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
	/* border: 1px solid #3079ed; */
	border: 0px;
	color: #fff;
	text-shadow: 0 1px rgba(0, 0, 0, 0.1);
	background-color: #4d90fe;
	padding: 17px 0px;
	font-family: roboto;
	font-size: 14px;
	/* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
	/* border: 1px solid #2f5bb7; */
	border: 0px;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	background-color: #357ae8;
	/* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
	text-decoration: none;
	color: #666;
	font-weight: 400;
	text-align: center;
	display: inline-block;
	opacity: 0.6;
	transition: opacity ease 0.5s;
}

.login-help {
	font-size: 12px;
}
.spacer_5 {
    height: 5px;
}
</style>

<script>

	
	$(document).ready(function() {
				
		$("#f").submit(function (e) {
		    e.preventDefault();
		    var name = $("#name").val();  
		    var birth = $("#birth").val();  
		    var email = $("#email").val();  
		    
		    var flag = 0;
		    
		    
		    if(name==""){
		    	alert('Please fill in the name')
		    	return
		    }else if(birth==""){
		    	alert('Please fill in the birth')
		    	return
		    }else if(email==""){
		    	alert('Please fill in the email')
		    	return
		    }else{
		    	flag = 1;
		    }
		    
		    var formData = $("#f").serialize();
		    
		    $.ajax({
		    		type : 'POST',
		    		url : "user_checkNBE",
		    		data :  formData , 
		    	    success: function(data) {
		    	      if(flag==0 && data==0){ 
		    	    	  
		    	      }else if(flag==1 && data==0){
		    	    	alert('해당 정보를 가진 회원을 찾을 수 없습니다.')
		    	
		    	      }else{
		    	    	  $("#id-modal").modal("hide");
		    	    	 $("#id_confirm-modal").modal("show");
		    	      }
		    	    	
		    	    	
		    	      
		    	   }
		    });
		    
		    
		    
		    
		});
		
		
		
		$("#sm2").click(function (e) {
		    e.preventDefault();
		    var id = $("#id").val();  
		    var e = $("#email2").val();  
		    
		    var flagg = 0;
		    
		    if(id==""){
		    	alert('Please fill in the id')
			    
		    }else if(e==""){
		    	alert('Please fill in the email')
			    
		    }else{
		    	flagg = 1;
		    }
		    
		    var formData = $("#g").serialize();
		    
		    $.ajax({
		    		type : 'POST',
		    		url : "user_checkIE",
		    		data :  formData , 
		    	    success: function(data) {
		    	    	  if(flagg==0 && data==0){ 
			    	    	  
			    	      }else if(flagg==1 && data==0){
			    	    	alert('해당 정보를 가진 회원을 찾을 수 없습니다.')
			    	
			    	      }else{
			    	    	  $("#pw-modal").modal("hide");
			    	    	 $("#pw_confirm-modal").modal("show");
			    	    	 
			    	      }
		    	    	
		    	    	
		    	      
		    	   }
		    });
		});
		
		  $("#loginBT").click(function(){
	            // 태크.val() : 태그에 입력된 값
	            // 태크.val("값") : 태그의 값을 변경 
	            var userId = $("#userId").val();
	            var userPw = $("#userPw").val();
	            
	            
	            
	            if(userId == ""){
	                alert("아이디를 입력하세요.");
	               $("#userId").focus(); // 입력포커스 이동
					return false; //FUCKING IMPORTANT FALSE!!!
	            }else if(userPw == ""){
	                alert("비밀번호를 입력하세요.");
	                $("#userPw").focus();
	               	return false; //FALSE!! TO STOP. 
	            }else{
	            
	            $("#loginForm").submit();
	            }
	            
	            // 제출
	            //document.loginForm.submit();
	      });
		  
		  
		  
		

		  
	});
		
	
	
	$(function(){
		// 쿠키값을 가져온다.
		var cookie_user_id = getLogin();

		/**
		* 쿠키값이 존재하면 id에 쿠키에서 가져온 id를 할당한 뒤
		* 체크박스를 체크상태로 변경
		*/
		if(cookie_user_id != "") {
			$("#userId").val(cookie_user_id);
			$("#remember").attr("checked", true);
		}

		// 아이디 저장 체크시
		$("#remember").on("click", function(){
		var _this = this;
		var isRemember;
			
		if($(_this).is(":checked")) {
		isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
						
		if(!isRemember)    
			$(_this).attr("checked", false);
			}
		});

		// 로그인 버튼 클릭시
		$("#loginBT").on("click", function(){
				if($("#remember").is(":checked")){ // 저장 체크시
					saveLogin($("#userId").val());
				}else{ // 체크 해제시는 공백
					saveLogin("");
				}
			});
		});

		/**
		* saveLogin
		* 로그인 정보 저장
		* @param id
		*/
		function saveLogin(id) {
		if(id != "") {
			// userid 쿠키에 id 값을 7일간 저장
			setSave("userid", id, 7);
		}else{
			// userid 쿠키 삭제
			setSave("userid", id, -1);
			}
		}

		/**
		* setSave
		* Cookie에 user_id를 저장
		* @param name
		* @param value
		* @param expiredays
		*/
		function setSave(name, value, expiredays) {
			var today = new Date();
			today.setDate( today.getDate() + expiredays );
			document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
		}

		/**
		* getLogin
		* 쿠키값을 가져온다.
		* @returns {String}
		*/
		function getLogin() {
		// userid 쿠키에서 id 값을 가져온다.
		var cook = document.cookie + ";";
		var idx = cook.indexOf("userid", 0);
		var val = "";

		if(idx != -1) {
			cook = cook.substring(idx, cook.length);
			begin = cook.indexOf("=", 0) + 1;
			end = cook.indexOf(";", begin);
			val = unescape(cook.substring(begin, end));
			}
		return val;
		}

	
</script>



<div class="jumbotron">

	<div class="bg"></div>

	<p>
	<div class="modal-body">
		<div class="row">
			<div class="col-xs-4">
				<div class="well">
					<form id="loginForm" method="POST" action="user_logina"
						novalidate="novalidate">
						<div class="form-group">
							<h2 class="entry-title">
								<span>Login</span>
							</h2>
							<input type="text" class="form-control" id="userId" name="userId"
								value="" title="Please enter you userId" placeholder="Id">
							<span class="help-block"></span>
						</div>

						<div class="form-group">
							<input type="password" class="form-control" id="userPw"
								name="userPw" value="" title="Please enter your password"
								placeholder="Password"> <span class="help-block"></span>
						</div>
						<div id="loginErrorMsg" class="alert alert-error hide">Wrong
							username or password</div>
						<div class="checkbox">

							<label> <input type="checkbox" name="remember" id="remember">
								아이디 기억하기
							</label>

<!-- 							<p class="help-block">(if this is a private computer)</p> -->
							<div class="spacer_5"></div>
							<c:if test="${msg!=null}">
								<!--<c:out value="${msg}"></c:out>-->
								<font color="red"> ${msg} </font>
							</c:if>													
							
						</div>
						<button id="loginBT"
							class="btn btn-success btn-block">Login</button>
						<div style='margin-top:10px;'>
						<a href="#" data-toggle="modal" data-target="#id-modal" >아이디 찾기</a>
						<br> <a href="#" data-toggle="modal"
							data-target="#pw-modal">비밀번호 찾기</a>
						</div>
<!-- 						<div class="or-box"> -->
<!-- 							<span class="or">OR</span> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-md-12 row-block"> -->
<!-- 									<a href="http://www.facebook.com" -->
<!-- 										class="btn btn-facebook btn-block">Facebook</a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-6 row-block"> -->
<!-- 									<a href="http://www.naver.com" class="btn btn-naver btn-block">Naver</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="or-box row-block">
							<div class="row">
								<div class="col-md-12 row-block">
									<a href="user_aorf" class="btn btn-primary btn-block">회원가입</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div id="relative2" style='margin-top:5%;'>It All Starts with Your Stunning Website
		Create your stunning website. It’s easy and free.</div>
	</div>

<div class="modal " id="id-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>Retrieve Id</h1>
			<br> Enter your account type and email below and we'll send you
			a new password.
			<form name="f" id="f" method="post">
				<input type="text" name="name" id="name" placeholder="name">
				<input type="text" name="birth" id="birth"
					placeholder="birth (yyyyddmm)"> <input type="email"
					name="email" id="email" placeholder="email (no space allowed)">
				<input type="submit" name="sm" id="sm" class="sm loginmodal-submit"
					value="Retrieve Id!">

			</form>

			<div class="login-help" align="right">
				<a href="#" data-dismiss="modal" aria-hidden="true">Cancel</a>

			</div>

		</div>
	</div>
</div>

<div class="modal " id="id_confirm-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>Check Your Email</h1>

			We've just sent you the id to your email. Please check your email
			box. <br>

			<div class="login-help" align="right">
				<a href="#" data-dismiss="modal" aria-hidden="true">Cancel</a>

			</div>
		</div>
	</div>
</div>




<div class="modal " id="pw-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>Reset Password</h1>
			<br>
			<form name="g" id="g" method="post">
				<input type="text" name="id" id="id" placeholder="Id"> <input
					type="email" name="email2" id="email2" placeholder="Email address">
				<input type="submit" name="sm2" id="sm2"
					class="sm2 loginmodal-submit" value="Reset Password!">
			</form>

			<div class="login-help" align="right">
				<a href="#" data-dismiss="modal" aria-hidden="true">Cancel</a>

			</div>

		</div>
	</div>
</div>

<div class="modal " id="pw_confirm-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<h1>Check Your Email</h1>

			We've just sent you the link to your email where you can reset your
			password. Please check your email box. <br>

			<div class="login-help" align="right">
				<a href="#" data-dismiss="modal" aria-hidden="true">Cancel</a>

			</div>
		</div>
	</div>
</div>




<c:import url="../bottom.jsp" charEncoding="utf-8" />