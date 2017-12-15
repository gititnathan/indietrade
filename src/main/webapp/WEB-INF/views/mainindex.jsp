<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<fmt:requestEncoding value="euc-kr"/>
<style>
.col-md-2 {
    width: 15%;
   	margin-bottom : 10px;
}
.contaner{
	padding-left: 20px;
}
.white_bg {
    background-color: #fff;
}
.margin_60 {
    padding-top: 60px;
    padding-bottom: 60px;
}
.main_title {
    text-align: center;
    font-size: 16px;
    margin-bottom: 30px;
}
.main_title h2 {
    text-transform: uppercase;
    font-weight: 700;
    letter-spacing: -1px;
    font-size: 30px;
    margin-bottom: 0;
    margin-top: 0;
}
h2 span, h3 span, h4 span, h5 span, h6 span {
    color: #328c0e; /*green*/
}
.other_music ul li a:hover {
    color: #f7941d;
}
.other_music ul li a {
    border-bottom: 1px solid #ededed;
    padding: 5px 0 10px;
    display: block;
    color: #333;
}
.add_bottom_45 {
    margin-bottom: 45px;
}
.other_music ul {
    padding: 0;
    margin: 0;
}

.other_music ul li a i {
    font-size: 22px;
    margin-right: 5px;
    margin-left: 2px;
    top: 5px;
    color: #555;
}
.other_music ul {
    list-style: none;
}

.img-responsive {
    max-width: 100%;
    max-height: auto;   
}
.glyphicon {
    position: relative;
    top: 1px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: 400;
 	line-height: unset !important; 
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.container { position:relative; }
.container video {
    position:relative;
    z-index:0;
}
.overlay {
    position:center;
    top:0;
    left:0;
    z-index:1;
    text-align: center;  
    font :abeatbyKai;  
    font-weight: 300;
    margin-top:20%;

}​
</style>

<c:import url="top.jsp" charEncoding="utf-8"/>

<sec:authorize access="isAnonymous()">	
     <script>
   	 //alert('어나니머스 유저 ')
     </script>
</sec:authorize>

<sec:authorize access="isAuthenticated()">	
     <script>
     //alert('그냥 인증유저 ')
     </script>
</sec:authorize>
<sec:authorize access="isFullyAuthenticated()">	
     <script>
     //alert('remember me 하지도 않았는데 ')
     </script>
</sec:authorize>

<script type="text/javascript"> 
	
	function startbt() { 
		var videocontrol = document.getElementById("mainvid");
	if(document.getElementById("btt").className == 'glyphicon glyphicon-pause'){
	document.getElementById("btt").className = "glyphicon glyphicon-play";
	videocontrol.pause();
	
	
	}else{
	document.getElementById("btt").className = "glyphicon glyphicon-pause";
	videocontrol.play();
		}
	}
	function volumebt() {
		var videocontrol = document.getElementById("mainvid");
		if(document.getElementById("btt1").className == 'glyphicon glyphicon-volume-up'){
			document.getElementById("btt1").className = "glyphicon glyphicon-volume-off";
			videocontrol.muted = true;
			
			}else{
			document.getElementById("btt1").className = "glyphicon glyphicon-volume-up";
			videocontrol.muted = false;
				}
	}
</script>

<!-- 
<c:if test = "${sessionScope.authorities == 'ROLE_ADMIN'}">
        <script>
        	alert('관리자님 환영합니다.')
        </script>
</c:if>
-->
 
<!--bg img  -->
<div align="center" class="embed-responsive embed-responsive-16by9">
	<video id="mainvid" autoplay class="embed-responsive-item">
		<source src="resources/videos/mainvid.mp4" type="video/mp4">

	</video>
	<div style="position: absolute;">
	<div class="overlay">
		<a href="javascript:startbt()"> <span
				class="glyphicon glyphicon-pause" id="btt" style="position: relative; left: 1200px;"></span>
			</a> <a href="javascript:volumebt()"> <span
				class="glyphicon glyphicon-volume-up" id="btt1" style="position: relative; left: 1200px;"></span>
			</a>
        <p><h1 style="color:#FFFFF0; position:relative; left: 500px; top:130px;" >Free music from thousands of artists<br> who would love to meet you :)</h1>
    </div>
    </div>
</div>
<p>
<div class ="contaner">
<h3><span>NEW</span> MUSIC</h3>
				<div class="row">
					<div class="col-md-2 col-sm-2 text-center">				
							<a href="album_view"><img src="resources/img/beatles.jpg" alt="Pic" class="img-responsive"></a>					
						<h4><span>Beatles</span></h4>
						<p>
							Abbey Road.
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">				
							<a href="#"><img src="resources/img/coldplay.jpg" alt="Pic" class="img-responsive"></a>					
						<h4><span>coldplay</span> booking</h4>
						<p>
							coldplay Album.
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">				
							<a href="#"><img src="resources/img/salad.jpg" alt="Pic" class="img-responsive"></a>					
						<h4><span>SaladDay</span></h4>
						<p>
							SaladDay Album.
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">					
							<a href="#"><img src="resources/img/twodoor.jpg" alt="Pic" class="img-responsive"></a>					
						<h4><span>TwoDoorCinemaClub</span></h4>
						<p>
							TwoDoorCinemaClub
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">					
							<a href="#"><img src="resources/img/david.jpg" alt="Pic" class="img-responsive"></a>					
						<h4><span>DavidBowie</span></h4>
						<p>
							StarMan.
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">					
							<a href="#"><img src="resources/img/donut.jpg" alt="Pic" class="img-responsive"></a>						
						<h4><span>Donut</span></h4>
						<p>
							Under the moon
						</p>
					</div>
				</div>
</div>
<div class ="contaner">
				<div class="row">
					<div class="col-md-2 col-sm-2 text-center">					
							<a href="#"><img src="resources/img/saudade.jpg" alt="Pic" class="img-responsive"></a>					
						<h4><span>SaudadeKinns</span> booking</h4>
						<p>
							SaudadeKinns
						</p>
						</div> 
					<div class="col-md-2 col-sm-2 text-center">					
							<a href="#"><img src="resources/img/sunset.jpg" alt="Pic" class="img-responsive"></a>				
						<h4><span>SunsetDreaming</span></h4>
						<p>
							SunsetDreaming
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">					
							<a href="#"><img src="resources/img/aaa.jpg" alt="Pic" class="img-responsive"></a>						
						<h4><span>Dreamer</span></h4>
						<p>
							Christmas special
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">				
							<a href="#"><img src="resources/img/guardians.jpg" alt="Pic" class="img-responsive" style='width: 100%; max-height: 217px;'></a>				
						<h4><span>Galaxy</span></h4>
						<p>
							Awesome Mix
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">	
							<a href="#"><img src="resources/img/ocean.jpg" alt="Pic" class="img-responsive" style='width: 100%; max-height: 217px;'></a>	
						<h4><span>BlueOcean</span></h4>
						<p>
							music wave
						</p>
					</div>
					<div class="col-md-2 col-sm-2 text-center">				
							<a href="#"><img src="resources/img/stars.jpg" alt="Pic" class="img-responsive" style='width: 100%; max-height: 217px;'></a>						
						<h4><span>Twinkle </span></h4>
						<p>
							Twinkle little star
						</p>
					</div>
				</div>
</div>

 <section id="contact">
 	<div class="container">
           <h3 class="text-center text-uppercase">contact us</h3>
           <p class="text-center w-75 m-auto">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum purus at sem ornare sodales. Morbi leo nulla, pharetra vel felis nec, ullamcorper condimentum quam.</p>
           <div class="row">
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">call us</h4>
                    <p>+8801683615582,+8801750603409</p>
                  </div>
                </div>
             </div>
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">office loaction</h4>
                   <address>Suite 02, Level 12, Sahera Tropical Center </address>
                  </div>
                </div>
             </div>
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">office loaction</h4>
                    <address>Suite 02, Level 12, Sahera Tropical Center </address>
                  </div>
                </div>
             </div>
             <div class="col-sm-12 col-md-6 col-lg-3 my-5">
               <div class="card border-0">
                  <div class="card-body text-center">
                    <i class="fa fa-globe fa-5x mb-3" aria-hidden="true"></i>
                    <h4 class="text-uppercase mb-5">email</h4>
                    <p>http://al.a.noman1416@gmail.com</p>
                  </div>
                </div>
             </div>
           </div>
       </div>
    </section>

<p>


<c:import url="bottom.jsp" charEncoding="utf-8"/>