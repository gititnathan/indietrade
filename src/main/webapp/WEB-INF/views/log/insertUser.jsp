<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="../top.jsp" charEncoding="utf-8" />

<sec:authorize access="isAuthenticated()">	
    <% response.sendRedirect("main"); %>
</sec:authorize>


<style type="text/css">
@import
	url(http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700);

@import
	url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);

body {
	background: #fff;
	font-family: 'Roboto', sans-serif;
	color: #333;
	line-height: 22px;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color: #111;
	margin-top: 5px;
	margin-bottom: 5px;
}

h1, h2, h3 {
	text-transform: uppercase;
}

input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 12px;
	cursor: pointer;
	opacity: 1;
	filter: alpha(opacity = 0);
}
#file{
   position: relative;
   text-align: right;
   -moz-opacity:0 ;
   filter:alpha(opacity: 0);
   opacity: 0;
   z-index: 2;
}

.account-box {
	border: 2px solid rgba(153, 153, 153, 0.75);
	border-radius: 7px;
	-moz-border-radius: 7px;
	-webkit-border-radius: 7px;
	-khtml-border-radius: 7px;
	-o-border-radius: 7px;
	z-index: 3;
	font-size: 13px !important;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	background-color: #ffffff;
	padding: 20px;
	 margin-left : 240px;
    margin-right : -180px;
}

.account-box .btn:hover {
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
	background-color: #ffffff;
	position: absolute;
	text-align: center;
	top: -8px;
	width: 40px;
	left: 90px;
}

.form-inline .form-group {
	margin-left: 0;
	margin-right: 0;
}

.control-label {
	color: #333333;
}

.btn_file input[type=file] {
    position: absolute;
    overflow: hidden;
    clip: rect(0,0,0,0);
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    border: 0;
}
.btn_file label .btn2 {
    color: #333;
}
.btn_file label {
    display: inline-block;
    width: 77px;
    height: 33px;
    cursor: pointer;
}
.btn_file {
    position: relative;
    display: inline-block;
    float: left;
    margin-left: 8px;
}
.btn_model .btn1, .btn_model .btn2, .btn_model .btn3 {
    min-width: 78px;
    height: 33px;
    padding: 10px 12px 0;
    color: #a3a3a3;
    margin-left: 0px;
    margin-top:-25px;
}
.btn_model b, .btn_model>em, .btn_model>span {
    display: inline-block;
    overflow: hidden;
    text-align: center;
    vertical-align: top;
    letter-spacing: -1px;
}
.btn_model .btn2 {
    border: 1px solid #bfbfbf;
    background: #fff;
}
.btn_area_btm { 
    overflow: hidden;
    margin-left: -8px;
    padding-top: 27px;
    text-align: left;
    margin-bottom: -50px;
    
}
.btn_model {
    font-size: 12px;
    line-height: 14px;
    display: inline-block;
    vertical-align: top;
    text-decoration: none!important;
}
table, textarea {
    font-family: 돋움, Dotum, sans-serif;
    font-size: 12px;
}
.btn_area_btm .btn_model .btn_disable {
    color: #c2c2c2;
}
.btn_model[href] .btn2 {
    color: #333;
    border-radius: 4px;
}

.btn_model[href] b, .btn_model[href]>em, .btn_model[href]>span {
    cursor: pointer;
}

</style>
<script>
 
//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    var nameCheck = 0;
    var emailCheck = 0;
    var phoneCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
        var inputed = $("#id").val();
        $.ajax({
        	
        	type : 'POST',
            data : { id : inputed }, 
            url : "user_checkId",
            success : function(data) {
                if(inputed=="" && data=='0') {
                	$(".signupbtn").prop("disabled", true);
                    $("#id").css("background-color", "#FFCECE");
                    idCheck = 0;
                    
                } else if (data == '0') {
                	$("#id").css("background-color", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                        $(".signupbtn").prop("disabled", false);
                        signupCheck();   
                    } 
                    
                } else if (data == '1') {
                	$(".signupbtn").prop("disabled", true);
                    
                    $("#id").css("background-color", "#FFCECE");
                    idCheck = 0;
                } 
            }
        });
    }
    
    function checkName() {
    	var inputed = $("#name").val();
    	
    	if(inputed==""){
    		   $(".signupbtn").prop("disabled", true);
                $("#name").css("background-color", "#FFCECE");
    	}else{
    		$("#name").css("background-color", "#B0F6AC");
    		 nameCheck = 1;
             if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
             	
                 $(".signupbtn").prop("disabled", false);
              	signupCheck();
             }
    	}
    	
    }
    
    //비밀번호 체크 (비밀번호와 비밀번호확인과 일치여부, 비밀번호 6~12제한 확인)
    function checkPwd() {
        var inputed = $("#passwd").val();
        var reinputed = $("#repassword").val();
        
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
        	
            $(".signupbtn").prop("disabled", true);
            //$(".signupbtn").css("background-color", "#aaaaaa");
             $("#passwd").css("background-color", "#FFCECE");
            $("#repassword").css("background-color", "#FFCECE");
           
        } else if (inputed == reinputed) {
        	$("#repassword").css("background-color", "#B0F6AC");
        	
        	if (inputed == reinputed && inputed.length>5) {
            	$("#passwd").css("background-color", "#B0F6AC");
            	$("#repassword").css("background-color", "#B0F6AC");
                
                pwdCheck = 1;
                if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                	
                    $(".signupbtn").prop("disabled", false);
                 	signupCheck();
                }
                
                
            }
                      
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $(".signupbtn").prop("disabled", true);
            $("#passwd").css("background-color", "#FFCECE");
            
            $("#repassword").css("background-color", "#FFCECE");
            
        }
    }
    
    
    function checkEmail() {
    	var inputed = $("#email").val();
    	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
   	
		$.ajax({
        	
        	type : 'POST',
            data : { email : inputed }, 
            url : "user_checkEmail",
            success : function(data) {
            	if(inputed=="" && (!regEmail.test(inputed) || regEmail.test(inputed)) && data=='1'){
         		   $(".signupbtn").prop("disabled", true);
                     $("#email").css("background-color", "#FFCECE");
         	}else if(regEmail.test(inputed) && data=='0'){
         		$("#email").css("background-color", "#B0F6AC");
        		 	
         		emailCheck = 1;
                 if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                 	
                     $(".signupbtn").prop("disabled", false);
                  	signupCheck();
                 }
         	}else if(!regEmail.test(inputed) || data=='1'){
         		emailCheck = 0; 
         		$(".signupbtn").prop("disabled", true);
                  $("#email").css("background-color", "#FFCECE");
         		}
            }
        });
    	
    }
    
    function checkPhone() {
		var inputed = $("#phone").val();
    	var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		
    	
	$.ajax({
        	
        	type : 'POST',
            data : { phone : inputed }, 
            url : "user_checkPhone",
            success : function(data) {
            	if(inputed=="" && (!regPhone.test(inputed) || regPhone.test(inputed)) && data=='1'){
         		   $(".signupbtn").prop("disabled", true);
                    $("#phone").css("background-color", "#FFCECE");
         	}else if(regPhone.test(inputed) && data=='0'){
         		$("#phone").css("background-color", "#B0F6AC");
        		 	
         		phoneCheck = 1;
                 if(idCheck==1 && nameCheck==1 && pwdCheck == 1 && emailCheck==1 && phoneCheck==1) {
                 	
                     $(".signupbtn").prop("disabled", false);
                  	signupCheck();
                 }
         	}else if(!regPhone.test(inputed) || data=='1'){
         		phoneCheck = 0; 
         		$(".signupbtn").prop("disabled", true);
                  $("#phone").css("background-color", "#FFCECE");
         		}
            }
        });
    }
  	
    function signupCheck() {
        var name = $("#nickname").val();
        var email = $("#email").val();
        var phone = $("#phone").val();
        var name = $("name").val();
        
        if(name=="" || email=="" || phone=="" || name=="") {
            $(".signupbtn").prop("disabled", true);
         } else {
        }
    }
    
    function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("file").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };
    
   function del(){
	   
	   $("#file").val("");
       $("#uploadPreview").attr("src","");
      $("#file").css('color', 'transparent');
       
      
   }
    
   function a(){
	   $('input[type="file"]').change(function () {
           if ($(this).val() != "") {
                  $(this).css('color', '#333');
           }else{
                  $(this).css('color', 'transparent');
           }
      });
   }
   

 
	
   
</script>


<p>
<div class="container">
	<div class="row">
		<div class="col-md-8">
			<div class="account-box">

				<h2 class="entry-title">
					<span>Sign Up</span>
				</h2>
				
				<hr>
				<form class="form-horizontal" action="user_signup" method="post" enctype="multipart/form-data" >
					<input type="hidden" name="authority" value="${param.a}">
					<div class="form-group">
						<label class="control-label col-sm-3">아이디 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input type="text"
									class="form-control" name="id" id="id" oninput="checkId()"
									placeholder="Enter your ID" maxlength="16" autocomplete="off" required autofocus>
							</div>
						</div>
					</div>
					
					<!-- 
					<c:out value="${param.a}"></c:out>
					<c:out value="${param.a}"></c:out>
					  -->
					
					<div class="form-group">
						<label class="control-label col-sm-3">이름 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<input type="text" class="form-control" name="name" oninput="checkName()"
								id="name" maxlength="30" placeholder="Enter your Name" autocomplete="off" required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">이메일 <span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> <input type="text"
									class="form-control" name="email" id="email" oninput="checkEmail()"
									placeholder="Enter your Email ID" maxlength="40" autocomplete="off" required>
								
							</div>
					
							<small> 이메일은 계정 복구 및 권한 부여에 활용됩니다.</small>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">비밀번호<span
							class="text-danger">*</span></label>
						<div class="col-md-5 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input type="password"
									class="form-control" name="passwd" id="passwd"
									placeholder="Choose password(6-12 chars)"  maxlength="12"  oninput=checkPwd() required>
									
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">비밀번호 확인 <span
							class="text-danger">*</span></label>
						<div class="col-md-5 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input type="password"
									class="form-control" name="repassword" id="repassword"
									placeholder="Confirm your password" maxlength="12" oninput=checkPwd() required>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3">생년월일 <span
							class="text-danger">*</span></label>
						<div class="col-xs-8">
							<div class="form-inline">
								<div class="form-group">
									<select id="yyyy" name="yyyy" class="form-control">
										<option value="1955">1955</option>
										<option value="1956">1956</option>
										<option value="1957">1957</option>
										<option value="1958">1958</option>
										<option value="1959">1959</option>
										<option value="1960">1960</option>
										<option value="1961">1961</option>
										<option value="1962">1962</option>
										<option value="1963">1963</option>
										<option value="1964">1964</option>
										<option value="1965">1965</option>
										<option value="1966">1966</option>
										<option value="1967">1967</option>
										<option value="1968">1968</option>
										<option value="1969">1969</option>
										<option value="1970">1970</option>
										<option value="1971">1971</option>
										<option value="1972">1972</option>
										<option value="1973">1973</option>
										<option value="1974">1974</option>
										<option value="1975">1975</option>
										<option value="1976">1976</option>
										<option value="1977">1977</option>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990">1990</option>
										<option value="1991">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
										<option value="1997">1997</option>
										<option value="1998">1998</option>
										<option value="1999">1999</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
									</select>
								</div>
								
								<div class="form-group">
									<select id="mm" name="mm" class="form-control">
										<option value="01">Jan</option>
										<option value="02">Feb</option>
										<option value="03">Mar</option>
										<option value="04">Apr</option>
										<option value="05">May</option>
										<option value="06">Jun</option>
										<option value="07">Jul</option>
										<option value="08">Aug</option>
										<option value="09">Sep</option>
										<option value="10">Oct</option>
										<option value="11">Nov</option>
										<option value="12">Dec</option>
									</select>
								</div>
								<div class="form-group">
									<select id="dd" name="dd" class="form-control">
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
									</select>
								</div>	
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">성별<span
							class="text-danger">*</span></label>
						<div class="col-md-8 col-sm-9">
							<label> <input name="gender" type="radio" value="Male"
								checked> 남자
							</label> <label> <input name="gender" type="radio" value="Female">
								여자
							</label>
							<input type="hidden" name="checked" value="checked"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">휴대폰 번호 <span
							class="text-danger">*</span></label>
						<div class="col-md-5 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-phone"></i></span> <input type="text"
									class="form-control" name="phone" id="phone"
									placeholder="Enter your Primary phone no." oninput=checkPhone() autocomplete="off" maxlength="11" required>
							</div>
						</div>
					</div>
					<div class="form-group">
						   <label class="control-label col-sm-3">프로필 사진<br>
                     <small>(선택사항)</small></label>
                  <div class="col-md-5 col-sm-8">
                     <div class="input-group">
                           <div class="tdcell">
                            <div class="profile_photo">                              
                        <img id="uploadPreview" style="width: 100px; height: 100px;" onerror="this.src='./resources/img/default.png'" />
                            </div>
                            <p class="btn_area_btm">
                                <span class="btn_file" >
                                    <label for="file" class="btn_model"><b id="btnChangeProfile" class="btn2" style="border-radius: 4px;">사진변경</b></label>
                                    <input type="file" name="file" class="form-control upload" id="file" onchange="PreviewImage();" onclick="a()" />
                                </span>
                                <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2" onclick="del()">삭제</b></a>
                            </p>
                        </div>      
                     </div>
                     </div>
					</div>
					<br>
					
					<div class="form-group">
						<div class="col-xs-offset-3 col-md-8 col-sm-9">
							<span class="text-muted"><span class="label label-danger">Note:-</span>
								By clicking Sign Up, you agree to our <a href="#">Terms</a> and
								that you have read our <a href="#">Policy</a>, including our <a
								href="#">Cookie Use</a>.</span>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-10">
						
						<button type="submit" class="signupbtn btn btn-default" disabled="disabled">sign up</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<p>
<c:import url="../bottom.jsp" charEncoding="utf-8" />
