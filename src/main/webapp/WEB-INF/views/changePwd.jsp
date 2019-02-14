 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>

        @import url('https://fonts.googleapis.com/css?family=Press+Start+2P');
        * {
       font-family: 'Press Start 2P', cursive;
       font-size: 1rem;
       margin: 0;
       padding: 0;
       color: white;
       box-sizing: border-box;
   }
        body{
            background: black;
            display: flex;
            justify-content: center;
            
        }
        .box{
            margin-top: 100px;
            border: white 10px solid;
            position: relative;
            width: 500px;
            height: 400px;
            display: flex;
            flex-direction: column;
            
        }
        .sub{
            margin-top: 30px;
            margin-bottom: 60px;
            color: aliceblue;
            font-size: 30px;
            text-align: center;
        }
        .con{
            color: aliceblue;
            margin-left: 30px;
            
        }
        .pwd{
   
            width: 100%;
            height: 30px;
            color: aliceblue;
            color: black;
        }
        .btn {
            margin-top: 20px;
            margin-left: 30px;
  background-color: #9b59b6;
  box-shadow: 0px 5px 0px 0px #82409D;
            width: 250px;
            height: 40px;
            border: none;
            
}
        

.btn:hover {
  background-color: #B573D0;
}

        .btn:active {
  transform: translate(0px, 5px);
  -webkit-transform: translate(0px, 5px);
  box-shadow: 0px 1px 0px 0px;
}
       .pwdchk {
       font-family: 'Lucida Sans Unicode', Sans-Serif;
       border-top: #ff7373 1px solid;
       color: #ff7373;
       display: block;
       font-size: 0.8rem;
   }
         .info_item {
             margin-top: 20px;
             margin-left: 30px;
       width: 300px;
       padding: 0 13px;
       border: 5px solid #cfcfcf;
       border-radius: 3px;
       font-size: 18px;
       margin-bottom: 15px;

   }
           .chknormal {
       display: none;
   }
        
        
   .swing {
       animation: swing 0.3s linear 0s
   }

   @keyframes swing {
       10% {
           transform: translateX(-20px);
       }

       20% {
           transform: translateX(20px);
       }

       30% {
           transform: translateX(-18px)
       }

       40% {
           transform: translateX(18px)
       }

       50% {
           transform: translateX(-15px);
       }

       60% {
           transform: translateX(15px);
       }

       70% {
           transform: translateX(-10px)
       }

       80% {
           transform: translateX(10px)
       }

       90% {
           transform: translateX(-5px)
       }

       100% {
           transform: translateX(5px)
       }
   }
    </style>
</head>

<body>
    <div class="box">
        <form action="/changePwd.do" method="post" id="form">
            <div class="sub">RESET PASSWORD</div>
            <label for="" class="con">NEW PASSWORD</label>
            <div class="info_item">
            <input type="hidden" name="key" value="${param.key}" />
   
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input id="pwdinput" autocapitalize="off" autocomplete="off" autocorrect="off" class="pwd" maxlength="32" name="pwd" placeholder="PASSWORD" send="true" type="password" />
                <div class="pwdchk chknormal">
                    at least one number and one uppercase<br />
                    and one lowercase letter<br />
                    and at least 8 or more characters
                </div>
            </div>
            <button type="button" class="btn">SEND PASSWORD</button>
        </form>

    </div>
</body>
<script>

    document.querySelector(".btn").addEventListener("click", function() {

        let pwdRegExp = /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/;
        let pwdinput = document.querySelector("#pwdinput");
        let pwdchk = document.querySelector(".pwdchk")
 
            let pc = rexchk(pwdRegExp, pwdinput.value, pwdchk);
 
            if (pc) {
            	console.log("?");
                let formData = document.querySelector("#form");
                formData.submit();

            } else {
            	swing(pwdchk.parentElement);
            }




    });

    function rexchk(rex, value, chk) {
        if (!rex.test(value)) {
            chk.classList.remove("chknormal");
            return false;
        } else {
            chk.classList.add("chknormal");
            return true;
        };

    }

    function swing(ele) {
        ele.classList.add("swing");
        setTimeout(function() {
            ele.classList.remove("swing")
        }, 300);
    }

</script>

</html>