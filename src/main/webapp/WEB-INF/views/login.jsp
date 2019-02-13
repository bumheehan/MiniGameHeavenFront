 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  <!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>v0.0.2</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.0/css/all.css" integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

</head>

<body>
    <div class="lodingback"><img src="${pageContext.request.contextPath}/resources/res/loading.gif" alt="" class="loading"></div>
    <div class="login_box">

        <div class="logintxt">Log in!</div>
        <form name="loginform" action="loginProcess" method="post" id="form">
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
                <input type="checkbox" id="login_chk" name="chk" onchange="#"/>
                &nbsp;<span for="login_chk">Remember me!</span>
            </div>
            <div class="list_set3">
                <span><a href="#" >Forgot Password?</a></span>

            </div>
            <div class="wrap_btn">
                <button type="button" class="disabled btn_next submit">PRESS START</button>
            </div>
             <div class="list_set4">
                <span>Need an account? <a href="#" class="signup">Sign up now!</a></span>

            </div>
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </form>
        <img src="${pageContext.request.contextPath}/resources/res/mainlogo.png" alt="" class="logo">
    </div>
     <%@ include file="header.html" %>
</body>
<script>

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
  