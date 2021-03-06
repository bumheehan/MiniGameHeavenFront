 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>SIGN UP</title>
      	<link rel="shortcut icon" href="/resources/res/favicon.ico">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.0/css/all.css" integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup2.css">

</head>

<body>
    <div class="lodingback"><img src="${pageContext.request.contextPath}/resources/res/loading.gif" alt="" class="loading"></div>
    <div class="login_box">

        <div class="logintxt"><span class="signupneon">Sign Up!</span></div>
        <form name="loginform" action="#a" method="post">
 
            <div class="list_set">
                <div class="info_item">

                    <input id="eminput"  autocapitalize="off" autocomplete="off" autocorrect="off" class="tf_join" maxlength="32" movefocus="true" name="email" placeholder="EMAIL" send="true"  />
                    <div class="emailchk1 chknormal">Email format is wrong.</div>
                    <div class="emailchk2 chknormal">That Email is already taken. Please choose another!</div>
                </div>

                <div class="info_item">
                    <input id="pwdinput"  autocapitalize="off" autocomplete="off" autocorrect="off" class="tf_join" maxlength="32" name="pwd" placeholder="PASSWORD" send="true" type="password" />
                    <div class="pwdchk chknormal">
                    at least one number and one uppercase<br/>
                     and one lowercase letter<br/>
                    and at least 8 or more characters.
                    </div>
                </div>
                <div class="info_item">
                    <input id="pwdcinput"  autocapitalize="off" autocomplete="off" autocorrect="off" class="tf_join" maxlength="32" name="passwordc" placeholder="PASSWORD CHECK " send="true" type="password" />
                    <div class="pwdcchk chknormal">
                    Not match above password.
                    </div>
                </div>

            <div class="info_item">
                    <input id="nameinput"  autocapitalize="off" autocomplete="off" autocorrect="off" class="tf_join" maxlength="10" name="name" placeholder="NICK NAME" send="true"/>
                    <div class="namechk1 chknormal">
                    Nick Name format is wrong.
                    </div>
                    <div class="namechk2 chknormal">
                    That Nick Name is already taken. Please choose another!
                    </div>
                </div>


            </div>



            <div class="wrap_btn">
                <button type="button" class="disabled btn_next submit">INSERT COIN!</button>
            </div>


        </form>
         <img src="${pageContext.request.contextPath}/resources/res/mainlogo.png" alt="" class="logo">
    </div>
    <%@ include file="header.html" %>
</body>
<script>

    $(document).ready(function(){
        let error =false;

		let ajax_em =false;
		let ajax_nm =false;
		
		var csrf_name = "${_csrf.headerName}";
		var csrf_token = "${_csrf.token}";

        //이메일체크
        let emRegExp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
        let eminput =document.querySelector("#eminput");
        let emchk1 = document.querySelector(".emailchk1");
        let emchk2 = document.querySelector(".emailchk2");

        //패스워드 체크
        let pwdRegExp = /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/;
        let pwdinput =document.querySelector("#pwdinput");
        let pwdchk = document.querySelector(".pwdchk")

        //패스워드 리체크
        let pwdcinput =document.querySelector("#pwdcinput");
        let pwdcchk = document.querySelector(".pwdcchk")

        //네임 체크
        let nameRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
        let nameinput =document.querySelector("#nameinput");
        let namechk1 = document.querySelector(".namechk1")
        let namechk2 = document.querySelector(".namechk2")

        eminput.addEventListener("focusout",function(){
            let ec = rexchk(emRegExp,eminput.value,emchk1);

            if(ec){
                //ajax
                console.log(csrf_name+" : " +csrf_token);
                let fd = new FormData();
                fd.append("email",eminput.value);
                   
                   var request = $.ajax({
                      url: "/emailchk.do",
                      method: "POST",
                      processData:false,
                      contentType:false,
                      beforeSend: function(xhr){
                    	xhr.setRequestHeader(csrf_name,csrf_token);  
                      },
                      data:fd ,
                      dataType: "html"
                    });

                    request.done(function( msg ) {
                    	console.log(msg);
                        //msg0 정상 ,1 있음
                        if(msg==0){
                            emchk2.classList.add("chknormal");
                            ajax_em=true;
                        }else if(msg>0){
                            emchk2.classList.remove("chknormal");
                            swing(emchk2.parentElement);
                            ajax_em=false;
                            
                        }
                    });

                    request.fail(function( jqXHR, textStatus ) {
                    	ajax_em=false;
                    });
            }
            else{
                swing(emchk1.parentElement);
            }
        });

        pwdinput.addEventListener("focusout",function(){
            let pc = rexchk(pwdRegExp,pwdinput.value,pwdchk);
            if(pc){

            }else{
                swing(pwdchk.parentElement);
            }
        });
        pwdcinput.addEventListener("focusout",function(){
            let pcc = (this.value==pwdinput.value);
            if(pcc){
                pwdcchk.classList.add("chknormal");
            }else{
                pwdcchk.classList.remove("chknormal");
                swing(pwdcchk.parentElement);
            }
        });

        nameinput.addEventListener("focusout",function(){
           let nc = rexchk(nameRegExp,nameinput.value,namechk1);

            if(nc){
                //ajax
                  let fd = new FormData();

                fd.append("name",nameinput.value);
                   
                   var request = $.ajax({
                      url: "/namechk.do",
                      method: "POST",
                      processData:false,
                      contentType:false,
                      beforeSend: function(xhr){
                    	xhr.setRequestHeader(csrf_name,csrf_token);  
                      },
                      data:fd ,
                      dataType: "html"
                    });

                    request.done(function( msg ) {
                     
                        if(msg==0){
                            namechk2.classList.add("chknormal");
                            ajax_nm=true;
                        }else if(msg>0){
                            namechk2.classList.remove("chknormal");
                            swing(namechk2.parentElement);
                            ajax_nm=false;
                        }
                    });

                    request.fail(function( jqXHR, textStatus ) {
                    	ajax_nm=false;
                    });
            }
            else{
                swing(namechk1.parentElement);
            }
        });
	
        document.querySelector(".wrap_btn").children[0].addEventListener("click",function(){
        	if(ajax_nm&&ajax_nm){	
        	//이메일 닉네임체크
        		
        		let formData =new FormData();
	        	formData.append("email", document.querySelector("#eminput").value)
	        	formData.append("pwd", document.querySelector("#pwdinput").value)
	        	formData.append("name", document.querySelector("#nameinput").value)
	        	$(".lodingback").show();
	        	  var request = $.ajax({
	                  url: "/signup.do",
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
                	if(msg==1){
                		alert("Confirm Your Email");
   					 	location.href="http://www.applabo.xyz";
                	}else if(msg==0){
                		alert("Sorry, Try Again");
                	}
					
                });

                request.fail(function( jqXHR, textStatus ) {
                  alert( "Request failed: " + textStatus );
                });
        		
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
