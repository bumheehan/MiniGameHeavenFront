 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <title>MiniGameHeaven</title>
      	<link rel="shortcut icon" href="/resources/res/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cont.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
 
  	<style type="text/css">
  	.msection{
  		display:flex;
  		flex-direction: column;
  		position: relative;
  		top:150px;
  		height: auto;
  		width:auto;
  		align-items: center;
  	}
  	</style>
</head>

<body>
    <div class="background">
    </div>
    <%@ include file="header.html" %>
    <div class="cont">
        <div class="msection">
        
		<sec:authorize access="isAnonymous()">
		  <input type="hidden" id="email" value="x"/>
          <input type="hidden" id="userName" value="x"/>		
					
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
		  <input type="hidden" id="email" value="<sec:authentication property="principal.member.email"/>"/>
          <input type="hidden" id="userName" value="<sec:authentication property="principal.member.userName"/>"/>
		</sec:authorize>
          
          
		  <iframe src="${pageContext.request.contextPath}/resources/gamelist/${GameVO.gameName}/${GameVO.gameName}.jsp" frameborder=0 scrolling="no" width="${GameVO.width}" height = "${GameVO.height}"></iframe>
		  <iframe src="${pageContext.request.contextPath}/gamecomment?game=${GameVO.game}" frameborder=0 scrolling="no" width="100%" height ="1000px" ></iframe>


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
