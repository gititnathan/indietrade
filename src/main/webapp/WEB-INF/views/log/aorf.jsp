<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="../top.jsp" charEncoding="utf-8" />

<sec:authorize access="isAuthenticated()">	
    <% response.sendRedirect("main"); %>
</sec:authorize>

<style>
.navbar-trans {
	background-color: white;
	border: none;
	transition: top 1s ease;
}

.jumbotron{

	margin-bottom: 0px;
    position: relative;
    background: none;
	min-height:900px;
	overflow: hidden;
}

.jumbotron .bg {
  	position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
   
	background-image: url("./resources/img/a.jpg");
	background-size: 100% 75%;
	background-color: black;
	background-repeat: no-repeat;
	-webkit-filter: blur(5px);
  	-moz-filter: blur(5px);
  	-o-filter: blur(5px);
  	-ms-filter: blur(5px);
  	filter: blur(5px);
  	
  	transform: scale(1.1);
  	margin:-1px;
   	padding:1px;
}

#relative{
	position:relative;
	top:62px;
	left:425px;
	right:0px;
	bottom:0px;
	width:200px;
	height:100px;	
}

#relative2{
	position:relative;
	top:-58px;
	left:800px;
	right:0px;
	bottom:0px;
	width:200px;
	height:100px;	
}

.vl {
    height: 400px;
    top:100px;
    position: absolute;
    left: 43%;
    margin-left: -3px;
    border-right: 1px solid rgba(25, 25, 112, .5);
    padding-right: 10px;
    margin-right: -10px;
/*     background : linear-gradient(45deg, blue, white);  */
}


</style>

<div class="jumbotron">
	<div class="bg"></div>
	<div id="relative">
		<h1 style="color:#FFFFF0;">I'm a Fan</h1>      
    	<button type="submit"  class="btn btn-default" onclick="location.href='user_signup?a=u'">팬 회원가입</button>
  	</div>
  	
  	<div class="vl"></div>
  	
  	<div id="relative2">
		<h2 style="color:#FFFFF0;">I'm an Artist</h2>
		<button type="button" class="btn btn-default" onclick="location.href='user_signup?a=a'">아티스트 회원가입</button>
  	</div>
  	<div id="relative2">
		<h2 style="color:#FFFFF0;">indieTrade Login System</h2> 
		<h3 style="color:#FFFFF0;">lalalala</h3>     
<!--     	<button type="button" class="btn btn-default" disabled>저자 회원가입</button> -->
  	
  	</div>
</div>

<c:import url="../bottom.jsp" charEncoding="utf-8" />