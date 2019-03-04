 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gamecomment.css">


</head>

<body>

	<%@ include file="loading.html" %>
	
        <div id="CommentArea_100">
            <h3>100자평쓰기</h3>
            <p>총 <strong>${pagingVO.count}</strong>개</p>
            <!--  꼬릿말 입력 Start -->
            <form id="comform" action="/addcomment" method="post" >
                <!--100자확인메소드-->
     			
				<input type="hidden" name="game" id ="game"value="${param.game} ">
				<input type="hidden" name="score" id ="score"value="10">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            	
                <div id="CommentArea_Box">
                    <div id="CommentArea_Input">
                        <!-- 별점 -->
                        <div id="cmt_select">
                            <div class="star">
                                <span class="star2 on"></span>
                                <span class="star22 on"></span>
                                <span class="star2 on"></span>
                                <span class="star22 on"></span>
                                <span class="star2 on"></span>
                                <span class="star22 on"></span>
                                <span class="star2 on"></span>
                                <span class="star22 on"></span>
                                <span class="star2 on"></span>
                                <span class="star22 on"></span>
                            </div>
                        </div>
                        
                        <sec:authorize access="isAnonymous()">
							
							<input type="textarea" placeholder = "로그인 후에 등록됩니다." name="comment" id="comment" rows="3" cols="60" value="" onclick="login()" onkeyup="" onfocus="" class="loginin" wrap="s" readonly="readonly">
							<input type="submit" name="comment_submit" id="comment_submit" value="등록하기" disabled="true"/>
							<script>
							function login(){
								if(confirm( '로그인 하시겠습니까?' )){
									top.location="http://www.applabo.xyz/login?target="+top.location;
								}else{
									
								}
							
							}
							</script>
						
						</sec:authorize>
						
						<sec:authorize access="isAuthenticated()">
						
							<input type="textarea" placeholder = "" name="comment" id="comment" rows="3" cols="60"class="loginin" wrap="s">
							<input type="hidden" name="email" value="<sec:authentication property="principal.member.email"/>">
							<input type="button" name="comment_submit" id="comment_submit" onclick="addcom()"value="등록하기" />
						</sec:authorize>


                        
                    </div>
                </div>
            </form>

            <!-- 꼬리말 list시작 -->
            <div id="CommentArea_List">

                    <ul>
                   		<c:forEach var="item" items="${list}">
                   			 <li class="fir">
                            <dl id="ct_164671">
                                <dd class="nick">${item.name}</dd>
                                <dd class="star">

                                   <div class="star">
                                <c:forEach var="i" begin="1" end="10" step="1">
                 
                                   		<c:choose>
                                   			<c:when test="${i%2 eq 0}">
                                   				<c:choose>
		                                   			<c:when test="${i <= item.score}">
		                                   				<span class="star33 on"></span>
		                                   			</c:when>
		                                   			<c:otherwise>
		                                   				<span class="star33 "></span>
		                                   			</c:otherwise>
		                                   		</c:choose>
                                   				
                                   			</c:when>
                                   			<c:otherwise>
												<c:choose>
													<c:when test="${i <= item.score}">
		                                   				<span class="star3 on"></span>
		                                   			</c:when>
		                                   			<c:otherwise>
		                                   				<span class="star3 "></span>
		                                   			</c:otherwise>
												</c:choose>
                                   					
                                   			</c:otherwise>
                                   		</c:choose>
                                 
                                   
                                   </c:forEach>
                                        
                                    </div>
                                    <strong>${item.score}</strong>
                                </dd>
                                <dt>${item.comment}
                                </dt>
                                <sec:authorize access="isAuthenticated()">
                           
                                	<sec:authentication  var="user" property="principal.member.email"/>
                                </sec:authorize>
                                <c:if test='${user eq item.email}'>
                                	<strong class="del" onclick ="delcom(this);">x</strong>
                                	<input type="hidden" value="${item.no}"/>
                                </c:if>
                                
                                
                                <dd class="date"><fmt:formatDate value="${item.regDate}" pattern="yyyy.MM.dd"/></dd>
                            </dl>
                        </li>
                   		
                   		</c:forEach>
                       

                        <li class="last"></li>
                    </ul><br style="clear:both" />
                    <!-- 페이징 Start -->


                    <div id="pagingNav">
                    <c:if test="${pagingVO.count>0}">
                    	<c:if test="${pagingVO.pageNum > 1}">
                    	<a href="/gamecomment?game=${game}&pageNum=${pagingVO.pageNum-1}" class="num_box">◀</a>
                    	</c:if>
                        <c:forEach var="i" begin="${pagingVO.start}" end="${pagingVO.end}" step="1">
                        	<c:choose>
                        		<c:when test="${pagingVO.pageNum eq i}">
                 
                        			<strong class="cur_num">${i}</strong>
                        		</c:when>
                        			
                        		<c:otherwise>
                        			
                        			<a href="/gamecomment?game=${game}&pageNum=${i}" class="num_box">${i}</a>
                        		</c:otherwise>
                        	</c:choose>
                        
                        </c:forEach>
                        <c:if test="${pagingVO.pageNum < pagingVO.end}">
                    	<a href="/gamecomment?game=${game}&pageNum=${pagingVO.pageNum+1}" class="num_box">▶</a>
                    	</c:if>
   					</c:if>
                    </div>
                    <!-- // 페이징 End -->


            </div>
        </div>
        <script>
        var csrf_name = "${_csrf.headerName}";
        var csrf_token = "${_csrf.token}";
        function addcom(){
        	var form = $("#comform").serialize();
        	$(".lodingback").show();
        	var request = $.ajax({
                url: "/addcomment",
                processData:false,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                beforeSend: function(xhr){
              	xhr.setRequestHeader(csrf_name,csrf_token);  
                },
                method: "POST",
                data: form,
                dataType: "html"
              });

              request.done(function( msg ) {
            	  location.reload();
            	  $(".lodingback").hide();
            	  
              });

              request.fail(function( jqXHR, textStatus ) {
            	  $(".lodingback").hide();
              });
        }
        function delcom(ele){
        	$(".lodingback").show();
        	var no = ele.nextElementSibling.value;
        	
        	var request = $.ajax({
                url: "/delcomment",
                beforeSend: function(xhr){
              	xhr.setRequestHeader(csrf_name,csrf_token);  
                },
                method: "POST",
                data: {
                	no:no
                },
                dataType: "html"
              });

              request.done(function( msg ) {
            	  location.reload();
            	  $(".lodingback").hide();
            	  
              });

              request.fail(function( jqXHR, textStatus ) {
            	  $(".lodingback").hide();
              });
              
        }
        $('#cmt_select .star span').click(function() {
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                $("#score")[0].value =  $(this).addClass('on').prevAll('span').length+1;
                return false;
            });


        function showPointLayer() {
            let c=document.getElementById("pointLayer");
            if(c) {
                if(c.style.display !="block") {
                    c.style.display="block";
                }

                else {
                    c.style.display="none";
                }
            }
        }


        </script>
</body>

</html>

