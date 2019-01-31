 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cont.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <style type="text/css">
    .msection {

    top: 600px;

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
        <div class="esection">
			<%@ include file="slider.html" %>
        </div>
        <div class="msection">
            <%@ include file="cont.html" %>

        </div>
    </div>
    <%@ include file="footer.html" %>

    <script>



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
