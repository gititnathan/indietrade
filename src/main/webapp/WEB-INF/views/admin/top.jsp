<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin top</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
	
<style type="text/css">
body {
	background: #F5F5F5 !important;
	
}/* Adding !important forces the browser to overwrite the default style applied by Bootstrap */

p {
	margin-bottom: 7rem;
}
body, html {
    height:100%;
    margin:0;
    padding:0;
}
#content {
    height:100%;
    min-height:300px; /* This is the height of your content + height of the footer */
}
#footer {
    margin-top:-100px;
    height:100px;
    background:#e9e9e9;
   
    
    margin-left: auto;
    margin-right: auto;
    margin-bottom: auto; 
    display:flex;
    align-items:center;
   
}
.footer-mute {
	color: #949494;
}

.container-custom{
	padding-left:200px;
	padding-top:70px;
}

body {
    font-family: "Lato", sans-serif;
}

.sidenav {
    height: 100%;
    width: 160px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #e9e9e9;
    overflow-x: hidden;
    padding-top: 60px;
}

.sidenav a {
    padding: 6px 6px 6px 18px;
    text-decoration: none;
    font-size: 15px;
    color: #818181;
    display: block;
}

.sidenav a:hover {
    color: #f1f1f1;
}


@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 10px;}
}
 
 
 .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
color: #000;  /*Sets the text hover color on navbar*/
}

.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active >   
 a:hover, .navbar-default .navbar-nav > .active > a:focus {
color: white; /*BACKGROUND color for active*/
background-color: #030033;
}

  .navbar-default {
    background-color: #0f006f;
    border-color: #030033;
}

  .dropdown-menu > li > a:hover,
   .dropdown-menu > li > a:focus {
    color: #262626;
   text-decoration: none;
  background-color: #66CCFF;  /*change color of links in drop down here*/
   }

 .nav > li > a:hover,
 .nav > li > a:focus {
    text-decoration: none;
    background-color: silver; /*Change rollover cell color here*/
  }


  .navbar-default .navbar-nav > li > a {
   color: white; /*Change active text color here*/
    }
    
    
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

.loginmodal-container input[type=text], input[type=password] {
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

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
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
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
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

.login-help{
  font-size: 12px;
}

.table td, .table th {
    min-width: 100px;
}



</style>

</head>
<body style="height: 1000px">


	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header navbar-brand">
				<a href="admin_main">ADMIN</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="main">indietrade</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="admin_mainhome_index">메인홈관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="admin_category_index">카테고리관리</a></li>

					</ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">전체 회원 보기</a></li>
						<li><a href="#">가수 회원 보기</a></li>
						<li><a href="#">팬 회원 보기</a></li>
						<li><a href="#">밴 회원 보기</a></li>
						<li><a href="#">탈퇴 회원 이력 조회</a></li>

					</ul>
				</li>
				<li><a href="#">음원관리</a></li>
				<li><a href="#">게시판관리</a></li>
				<li><a href="#">SNS관리</a></li>
				<li><a href="#">통계</a></li>
				
				
			</ul>
 		<ul class="nav navbar-nav navbar-right">
      		<li class="dropdown"><a class="dropdown-toggle"
      		data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> Kim Jong Pil<span class="caret"></span></a>
      		<ul class="dropdown-menu">
      				<li><a href="#">쪽지함</a></li>
					<li><a href="#">신고 목록 보기</a></li>
					<li><a href="#">에러 신고 현황 보기</a></li>
					<li><a href="#">로그 기록 조회</a></li>
			</ul>
      		
      		</li>
      	 </ul>

		</div>
	</nav>