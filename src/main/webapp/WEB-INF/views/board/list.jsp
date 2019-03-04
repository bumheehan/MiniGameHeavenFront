<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=dege">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Press+Start+2P" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/css/board/list.css">
  
<style> 
li{
		display : inline-block;
			}
</style>

</head>

<body>
   <header>
       
   </header>
    <h1 align="center">BOARD</h1>
    <div align="center">
        <a href="home">HOME</a><br />
        <a href="/board/register?boardnum=${param.boardnum}">INSERT</a>&nbsp;&nbsp;

        <a href="javascript:sdel()">DELETE</a>
    </div><br />
    <div align="center">
        <div>
            <table>
                <tr>
                    <th><input type="checkbox" name="checkAll" id="th_checkAll" /></th>
                    <th>NO</th>
                    <th>SUBJECT</th>
                    <th>WRITER</th>
                    <th>HITS</th>
                    <th>DATE</th>
                </tr>
                <c:if test="${empty list}">
		      	<tr>
							<td align='center' colspan="6"> 데이터가 없음</td>
				</tr>
				</c:if>
                <c:forEach items="${list}" var="board">
                <tr>
                    <td class="center"><input type="checkbox" name="checkRow" class="checkRow" value="${board.no}" /></td>
                    <td><c:out value="${board.no}"/></td>
                    <td><a class='move' href='/board/get?no=<c:out value="${board.no}"/>'>
									<c:out value="${board.subject}" /></a></td>
                    <td><c:out value="${board.username}" /></td>
                    <td><c:out value="${board.readnum}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.rdate}" /></td>
                </tr>
                </c:forEach>
                
            </table>
            		<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'>
					 <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>


			</form>
            <br />
            <div>
            				<ul class="pagination">
				<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="list?pageNum=${pageMaker.startPage -1}&amount=10&type=${ pageMaker.cri.type }&keyword=${ pageMaker.cri.keyword }">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="list?pageNum=${num}&amount=10&type=${ pageMaker.cri.type }&keyword=${ pageMaker.cri.keyword }">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="list?pageNum=${pageMaker.endPage +1 }&amount=10&type=${ pageMaker.cri.type }&keyword=${ pageMaker.cri.keyword }">Next</a></li>
						</c:if>
</ul>
            </div>


				

        </div>

        <div class="wrap">
            <div class="search">
            <form id='searchForm' action="/board/list" method='get'>
							<select name='type' class = "sersel">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> <br/>
                <input type="text" class="searchTerm" name='keyword' placeholder="What are you looking for?" value='<c:out value="${pageMaker.cri.keyword}"/>' />
                <input
								type='hidden' name='pageNum'
								value='1' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
                <button type="submit" class="searchButton">
                </button>
                </form>
            </div>
        </div>

<script type="text/javascript">
var csrf_name = "${_csrf.headerName}";
var csrf_token = "${_csrf.token}";
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='no' value='"+$(this.attr("href")+"'>"));
		actionForm.attr("action","/board/get");
		actionForm.submit();
	});
		$(".paginate_button a").on(
				"click",
				function(e) {

					e.preventDefault();

					console.log('click');

					actionForm.find("input[name='pageNum']")
							.val($(this).attr("href"));
					actionForm.submit();
				});
		$(".move")
		.on(
				"click",
				function(e) {

					e.preventDefault();
					actionForm
							.append("<input type='hidden' name='no' value='"
									+ $(this).attr(
											"href")
									+ "'>");
					actionForm.attr("action",
							"/board/get");
					actionForm.submit();

				});
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",function(e) {
					if (!searchForm.find("option:selected").val()) {
						alert("검색종류를 선택하세요");
						return false;
					}
					if (!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}
					searchForm.find("input[name='pageNum']").val("1");
					e.preventDefault();
					searchForm.submit();
				});

</script>
<script type="text/javascript">
$('#th_checkAll').on("click",function(){
	if($(this).is(":checked")){
		$('.checkRow').prop("checked", true);
	}else{
		$('.checkRow').prop("checked", false);
	}
})
function sdel(){
	for(var i =0 ; i<$('.checkRow').length;i++){
		if($('.checkRow').eq(i).is(":checked")){
			let no = $('.checkRow').eq(i).val();
			 var request = $.ajax({
                 url: "remove",
                 method: "POST",
                 processData:false,
                 contentType:false,
                 beforeSend: function(xhr){
               	xhr.setRequestHeader(csrf_name,csrf_token);  
                 },
                 data:{no:no,
                	 boardnum:${param.boardnum}} ,
                 dataType: "html"
               });
			 request.done(function(){
				// location.href="list?boardnum=${param.boardnum}";
			 })
		}
	}
	
}

</script>
</body>

</html>
