 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <title>Document</title>

    
    <style>
        @import url('https://fonts.googleapis.com/css?family=Press+Start+2P');
        *{
            font-family: 'Press Start 2P', cursive;
        }
        body{
            background: black;
        }
        .page{
            position: relative;
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .logo{
            position: absolute;
            top:0;
            opacity: 0.4;
            width: 500px;
            
        }
        .text{
            position: absolute;
            top: 150px;
            color: aliceblue;
            width: 500px;
            text-align: center;
            font-size: 50px;
        }
        .txt2{
            margin-top: 30px;
             position: absolute;
            top: 400px;
            color: aliceblue;
            width: 500px;
            text-align: center;
            font-size: 20px;
        }
        .txt3{
             position: absolute;
            top: 500px;
            color: aliceblue;
            width: 500px;
            text-align: center;
            font-size: 50px;
        }
        
    </style>
</head>
<body>
   <div class="page">
       <img src="../../resources/res/mainlogo.png" alt="" class="logo">
        <div class="text">PAGE<br/><br/>NOT<br/><br/>FOUND</div>
        <div class="txt2">CHANGE TO HOME AFTER 5S </div>
        <div class="txt3">5</div>
       
   </div>
    
</body>
<script>

    var txt3 =document.querySelector(".txt3").value;
    
    setInterval(function(){
         document.querySelector(".txt3").innerText = document.querySelector(".txt3").innerText-1;  
        
        if(document.querySelector(".txt3").innerText==0){
            location.href="http://www.applabo.xyz";
        }
    },1000)
   
    
    
</script>
</html>