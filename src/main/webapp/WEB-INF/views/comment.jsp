 <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/comment.css">


</head>

<body>
        <div id="CommentArea_100">
            <h3>100자평쓰기</h3>
            <p>총 <strong>7795</strong>개</p>
            <input type="hidden" name="commentTotalCount" value="7795" />
            <!-- 꼬리말 입력 매크로 -->
            <!--  꼬릿말 입력 Start -->
            <form name="writeCommentForm" action="commentWrite" method="post" onsubmit="return gaia.commentWrite.submitForm(this);">
                <!--100자확인메소드-->
             <input type="hidden" name="bbsId" value="GC001" />
                <input type="hidden" name="articleId" value="39" />
                <input type="hidden" name="cPageIndex" value="1" />
                <input type="hidden" name="cSearchKey" value="" />
                <input type="hidden" name="cSearchValue" value="" />
                <input type="hidden" name="cSortKey" value="depth" />
                <input type="hidden" name="emoticon" id="commentEmoticon" value="01" />
                <input type="hidden" name="allowTotalCommnet" value="T" />
                <input type="hidden" name="cFocus" value="Y" />
                <input type="hidden" name="topView" value="false" />
                <input type="hidden" name="templatePath" value="/content.htmp" />
                <input type="hidden" name="commentToken" value=".6T2PwsemwN-Nk1yLPofgA00">
                <input type="hidden" name="point" value="" />

                <div id="CommentArea_Box">
                    <div id="CommentArea_Input">
                        <!-- 별점 -->
                        <div id="cmt_select">
                            <div class="star">
                                <span class="star2 on" onclick="selPoint"></span>
                                <span class="star22" onclick="selPoint"></span>
                                <span class="star2"></span>
                                <span class="star22"></span>
                                <span class="star2"></span>
                                <span class="star22"></span>
                                <span class="star2"></span>
                                <span class="star22"></span>
                                <span class="star2"></span>
                                <span class="star22"></span>
                            </div>
                        </div>
                        <input type="textarea" placeholder = "로그인 후에 등록됩니다." name="commentContent" id="comment" rows="3" cols="60" value="" onclick="" onkeyup="" onfocus="" class="loginin" wrap="s">
                        <input type="submit" name="comment_submit" id="comment_submit" value="등록하기" />
                    </div>
                </div>
            </form>

            <!-- 꼬리말 list시작 -->
            <div id="CommentArea_List">

                <form id="form1" name="updateCommentForm" method="post">
                   <!--
                   <input type="checkbox" name="usetexticon" id="usetexticon" style="display:none;" />
                    <input type="text" name="id" id="id" style="display:none;" />
                    <input type="hidden" name="bbsId" value="GC001" />
                    <input type="hidden" name="articleId" value="39" />
                    <input type="hidden" name="cPageIndex" value="1" />
                    <input type="hidden" name="cSearchKey" value="" />
                    <input type="hidden" name="cSearchValue" value="" />
                    <input type="hidden" name="cSortKey" value="depth" />
                    <input type="hidden" name="emoticon" id="commentEmoticonU" />
                    <input type="hidden" name="status" value="S" />
                    <input type="hidden" name="templatePath" value="/content.htmp">
                    <input type="hidden" name="commentToken" value=".6T2PwsemwN-Nk1yLPofgA00">
                   -->

                    <ul>
                        <li class="fir">
                            <dl id="ct_164671">
                                <dd class="nick">배달치우</dd>
                                <dd class="star">

                                   <div class="star">
                                        <span class="star3 on"></span>
                                        <span class="star33 "></span>
                                        <span class="star3"></span>
                                        <span class="star33"></span>
                                        <span class="star3"></span>
                                        <span class="star33"></span>
                                        <span class="star3"></span>
                                        <span class="star33"></span>
                                        <span class="star3"></span>
                                        <span class="star33"></span>
                                    </div>
                                    <strong>10</strong>
                                </dd>
                                <dt> 21,070 - 2019.01.27 - 00시 19분(4위)
                                </dt><strong class="del">x</strong>
                                <dd class="date">19.01.27</dd>
                            </dl>
                        </li>
                        <!-- End List -->
                         <li class="fir">
                            <dl id="ct_164671">
                                <dd class="nick">배달치우</dd>
                                <dd class="star">

                                   <div class="star">
                                        <span class="star3 on"></span>
                                        <span class="star33 "></span>
                                        <span class="star3"></span>
                                        <span class="star33"></span>
                                        <span class="star3"></span>
                                        <span class="star33"></span>
                                        <span class="star3"></span>
                                        <span class="star33"></span>
                                        <span class="star3"></span>
                                        <span class="star33"></span>
                                    </div>
                                    <strong>10</strong>
                                </dd>
                                <dt> 21,070 - 2019.01.27 - 00시 19분(4위)
                                </dt><strong class="del">x</strong>
                                <dd class="date">19.01.27</dd>
                            </dl>
                        </li>

                        <li class="last"></li>
                    </ul><br style="clear:both" />
                    <!-- 페이징 Start -->


                    <div id="pagingNav">
                        <input type="hidden" name="pageTotalCount" value="390" />
                        <input type="hidden" name="countPerPage" value="20" />
                        <strong class="cur_num">1</strong>
                        <a href="commentList?cPageIndex=2&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">2</a>
                        <a href="commentList?cPageIndex=3&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">3</a>
                        <a href="commentList?cPageIndex=4&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">4</a>
                        <a href="commentList?cPageIndex=5&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">5</a>
                        <a href="commentList?cPageIndex=6&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">6</a>
                        <a href="commentList?cPageIndex=7&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">7</a>
                        <a href="commentList?cPageIndex=8&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">8</a>
                        <a href="commentList?cPageIndex=9&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">9</a>
                        <a href="commentList?cPageIndex=10&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_box">10</a>
                        <a href="commentList?cPageIndex=11&csstype=2&bbsId=GC001&topView=false&cSortKey=depth&cFocus=Y&articleStatus=S&templatePath=%2Fcontent.htmp&articleId=39" class="num_next">11 ~ 20</a>

                    </div>
                    <!-- // 페이징 End -->

                </form>

            </div>
        </div>
        <script src="${pageContext.request.contextPath}/resources/js/comment.js"></script>
</body>

</html>

