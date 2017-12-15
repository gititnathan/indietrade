<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<fmt:requestEncoding value="euc-kr"/>

<c:import url="top.jsp" charEncoding="utf-8"/>

<sec:authorize access="isAnonymous()">	
     <script>
   	 //alert('��ϸӽ� ���� ')
     </script>
</sec:authorize>

<sec:authorize access="isAuthenticated()">	
     <script>
     //alert('�׳� �������� ')
     </script>
</sec:authorize>
<sec:authorize access="isFullyAuthenticated()">	
     <script>
     //alert('remember me ������ �ʾҴµ� ')
     </script>
</sec:authorize>


<!-- 
<c:if test = "${sessionScope.authorities == 'ROLE_ADMIN'}">
        <script>
        	alert('�����ڴ� ȯ���մϴ�.')
        </script>
</c:if>
-->
 
<!--bg img  

<div align="center" class="embed-responsive embed-responsive-16by9">
    <video id="video" autoplay loop class="embed-responsive-item">
        <source src="resources/videos/mainvid.mp4" type="video/mp4">
    </video>
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

-->