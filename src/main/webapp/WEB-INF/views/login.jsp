 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  <!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>LOGIN</title>
      	<link rel="shortcut icon" href="/resources/res/favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.0/css/all.css" integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

</head>

<body>
    <div class="lodingback"><img src="${pageContext.request.contextPath}/resources/res/loading.gif" alt="" class="loading"></div>
    <div class="login_box">

        <div class="logintxt"><span class="loginneon">Log in!</span></div>
        <form name="loginform" action="loginProcess" method="post" id="form">
        	<input type="hidden" name="targetURL" value="${param.target}"/>
            <div class="list_set">
                <div class="info_item">

                    <input id="eminput"  autocapitalize="off" autocomplete="off" autocorrect="off" class="tf_join" maxlength="32" movefocus="true" name="email" placeholder="EMAIL" send="true"  />
                    <div class="emailchk chknormal">Email format is wrong.</div>
                </div>

                <div class="info_item">
                    <input id="pwdinput"  autocapitalize="off" autocomplete="off" autocorrect="off" class="tf_join" maxlength="32" name="pwd" placeholder="PASSWORD" send="true" type="password" />
                    <div class="pwdchk chknormal">
                    at least one number and one uppercase<br/>
                     and one lowercase letter<br/>
                    and at least 8 or more characters
                    </div>
                </div>

            </div>

            <div class="list_set2">
                <input type="checkbox" id="login_chk" name="remember-me" />
                &nbsp;<span for="login_chk">Remember me!</span>
            </div>
            <div class="list_set3">
                <span><a href="#a" >Forgot Password?</a></span>

            </div>
            <div class="wrap_btn">
                <button type="button" class="disabled btn_next submit">PRESS START</button>
            </div>
             <div class="list_set4">
                <span>Need an account? <a href="/signup" class="signup">Sign up now!</a></span>

            </div>
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </form>
        <img src="${pageContext.request.contextPath}/resources/res/mainlogo.png" alt="" class="logo">
          <div class="findpwd">
            <div class="list_set">
               <div class="t1">Reset Your Password</div>
               
                <div class="info_item">
                    <input id="findem"  autocapitalize="off" autocomplete="off" autocorrect="off" class="tf_join" maxlength="32" movefocus="true" name="email" placeholder="EMAIL" send="true"  />
                    <div class="femailchk chknormal">Email format is wrong.</div>
                </div>
                <button class="rbtn" >SEND RESET MAIL</button>
                <span><a href="#a" >BACK</a></span>

            </div>
        </div>
    </div>
     <%@ include file="header.html" %>
</body>
<script>
var csrf_name = "${_csrf.headerName}";
var csrf_token = "${_csrf.token}";
    $(document).ready(function(){
  

        let error =false;

        //이메일체크
        let emRegExp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
        let eminput =document.querySelector("#eminput");
        let emchk = document.querySelector(".emailchk")

        //패스워드 체크
        let pwdRegExp = /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/;
        let pwdinput =document.querySelector("#pwdinput");
        let pwdchk = document.querySelector(".pwdchk")
        document.querySelector(".wrap_btn").children[0].addEventListener("click",function(){
            let ec = rexchk(emRegExp,eminput.value,emchk);
            let pc = rexchk(pwdRegExp,pwdinput.value,pwdchk);
            if(!pc) swing(pwdchk.parentElement);
            if(!ec) swing(emchk.parentElement);

            if(pc&&ec){
				
               	let formData = document.getElementById("form");
               	formData.submit();       
                    
            }else{

            }
        });
        
        let feminput =document.querySelector("#findem");
        let femchk = document.querySelector(".femailchk");
        document.querySelector(".rbtn").addEventListener("click",function(){
            let fc = rexchk(emRegExp,feminput.value,femchk);
            if(!fc) swing(femchk.parentElement);

            if(fc){
            	$(".lodingback").show();
            	let formData =new FormData();
            	formData.append("email", document.querySelector("#findem").value)
            	
            	  var request = $.ajax({
                      url: "/findpwd.do",
                      processData:false,
                      contentType:false,
                      beforeSend: function(xhr){
                    	xhr.setRequestHeader(csrf_name,csrf_token);  
                      },
                      method: "POST",
                      data: formData,
                      dataType: "html"
                    });

                    request.done(function( msg ) {
                    	$(".lodingback").hide();
    					alert("Confirm your Email")
                    });

                    request.fail(function( jqXHR, textStatus ) {
                    	$(".lodingback").hide();
                      alert("Fail Sending Email");
                    });
                    
            }
        });
        document.querySelector(".list_set3").addEventListener("click",function(){
            $(".findpwd").stop().animate({
                top: 0
            }, 500);
        });
          $(".findpwd").find("span")[0].addEventListener("click",function(){
            $(".findpwd").stop().animate({
                top: "510px"
            }, 500);
        });

        if(!error) $(".lodingback").hide();
    });

    function swing (ele){
        ele.classList.add("swing");
            setTimeout(function(){ele.classList.remove("swing")},300);
    }


    function rexchk (rex,value,chk){
        if(!rex.test(value)){
            chk.classList.remove("chknormal");
            return false;
        }else{
            chk.classList.add("chknormal");
            return true;
        };

    }



    </script>
</html>
  