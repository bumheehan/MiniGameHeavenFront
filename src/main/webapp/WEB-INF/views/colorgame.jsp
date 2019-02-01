 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, user-scalable=no">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cont.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<style type="text/css">
	iframe{
		display:block;
		padding:0px;
		margin:0px;
	}
	.msection{
		top:0px;
	}
	</style>
</head>

<body>
    <div class="background">
    </div>
    <%@ include file="header.html" %>
    <div class="cont">
    <div class="rsection"></div>
        <div class="lsection">
        <div class="upcover">
        </div>
        <div class="downcover">
        </div>
        </div>

        <div class="msection">

  <iframe src="${pageContext.request.contextPath}/resources/gamelist/colorgame/color3.jsp" frameborder=0 scrolling="no" width="100%" height = "500px"></iframe>
  <iframe src="${pageContext.request.contextPath}/comment" frameborder=0 scrolling="no" width="100%" height ="1000px" ></iframe>

        </div>
    </div>
    <%@ include file="footer.html" %>

    <script>



        //초기 사이드바 위치
        $(".lsection").css("right", $(window).width() / 2 + $(".msection").width() / 2 + 50);
        $(".rsection").css("left", $(window).width() / 2 + $(".msection").width() / 2 + 50);
        $(window).resize(function(){
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


            //사이드 메뉴 따라다니기
            //초기 top 이 100
            let delta = st + 150;
            $(".lsection").stop().animate({
                top: delta

            }, 500)
            $(".rsection").stop().animate({
                top: delta

            }, 500)


            lastScrollTop = st;
			footer();

        }));


    </script>
</body>

</html>
