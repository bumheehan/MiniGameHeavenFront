 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>MiniGameHeaven</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slider.css">
  	<link rel="shortcut icon" href="/resources/res/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cont.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  
    <style type="text/css">
    .msection {

    top: 600px;

}
	.backg{
	 position: fixed;
	 top: 0;
	 left:0;
	 width:100%;
	 height:100%;
	 opacity:0;
	
	}
	@keyframes fl {
	  0%   {opacity:0}

	  100% {opacity:1}
	}
		
    </style>
</head>

<body>
    <div class="background">
    </div>
    <%@ include file="header.html" %>
    <!-- 
    
    <iframe class="backg" src="http://www.applabo.xyz/background"></iframe>
     -->
    <div class="cont">
    <div class="rsection">
    <iframe src="http://www.applabo.xyz/ranking" width="100%" height="100%"></iframe>
    </div>
        <div class="lsection">
        <div class="upcover">
        </div>
        <div class="downcover">
        </div>
        </div>
        <div class="esection">
			<%@ include file="slider.html" %>
        </div>
        <div class="msection">
            <%@ include file="cont.html" %>

        </div>
    </div>
    <%@ include file="footer.html" %>

    <script>

// animation: fl 3s linear 4s forwards;

        //초기 사이드바 위치
        $(".lsection").css("right", $(window).width() / 2 + $(".msection").width() / 2 + 50);
        $(".rsection").css("left", $(window).width() / 2 + $(".msection").width() / 2 + 50);
        $(window).resize(function() {
            $(".lsection").css("right", $(window).width() / 2 + $(".msection").width() / 2 + 50);
            $(".rsection").css("left", $(window).width() / 2 + $(".msection").width() / 2 + 50);
        });

        $("footer").slideUp();

        //헤더 스크롤
        var lastScrollTop = 0;
        //side top
        $(window).on("scroll", (function(event) {

            st = $(this).scrollTop();

            header(st,lastScrollTop);

			slider(st);

            //사이드 메뉴 따라다니기
            //초기 top 이 100
            let delta = st + 150;
            $(".lsection").stop().animate({
                top: delta

            }, 2000)
            $(".rsection").stop().animate({
                top: delta

            }, 500)


            lastScrollTop = st;
			footer();
			
			/*
			if(st<400){

		         $(".backg").css("opacity", 0 + st/ 400);
		         if(st<50){

			         $(".backg").css("display", "none");
		         }else{
		        	 $(".backg").css("display", "block");
		         }
			}
			*/
	
			
        }));
        /*
        var timer = setTimeout(function(){ $(".backg").css("display","none"); }, 1500);
        $(".lsection").on("mouseover",function(){
        	clearTimeout(timer);
        	$(".backg").css("display","block");
	        	$(".backg").stop().animate({
	                opacity: 1
	
	            }, 1000)
        })
         $(".lsection").on("mouseout",function(){
	        	$(".backg").stop().animate({
	                opacity: 0
	
	            }, 1000)
	            timer = setTimeout(function(){ $(".backg").css("display","none"); }, 1500);
	            
	            
	            
        })
        */


    </script>
</body>

</html>
