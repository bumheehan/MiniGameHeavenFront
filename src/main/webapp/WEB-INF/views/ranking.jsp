 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">-->
<html>
	<head>
		<link rel="stylesheet" href="/resources/css/ranking.css">
	</head>
	<body>
		<table class="ranking_table">
		 <caption><span class="neon">Weekly Ranking</span></caption>
			<thead class="ranking_table_header">
				<tr class="ranking_table_header_rows">
				<th>RANK</th>
				<th>GAME</th>
				<th>READ</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="rank">
				<tr class="ranking_table_rows">
					<td>${rank.ranking}</td>
					<td>
						<a href="#">
						<span><c:out value="${rank.id}"></c:out></span>
						</a>
					</td>
					
					<td><c:out value="${rank.score}"></c:out></td>
				</tr>
			</c:forEach>	
			</tbody>
				<tfoot>
					<tr></tr>
				</tfoot>
		</table>
	</body>

</html>