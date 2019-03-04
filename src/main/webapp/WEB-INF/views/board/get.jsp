<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/css/get.css">
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</head>
<body>
<center>

<hr width='600' size='2' color='gray' noshade>
<h3> BOARD</h3>

<a class="in" href='list'>목록</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="in" href='register'>글쓰기</a><br/>

<hr width='600' size='2' color='gray' noshade>
</center>
<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='seq' name='seq' value='<c:out value="${board.seq}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>

<input type="hidden" name="seq" value="<c:out value="${board.seq}"/>">
<table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>	
<tr>
   <td class="td1" width='20%' align='center' >WRITER</td>
   <td class="td1">
      ${board.writer}
   </td>
</tr>

<tr>
	<td class="td2" align='center'>DATE</td>
	<td class="td2"><c:out value="${board.rdate}"/></td>
</tr>

<tr>
	<td class="td3" align='center'>SUBJECT</td>
	<td class="td3">${board.subject}</td>
</tr>
			
<tr>
	<td class="td4" align='center'>CONTENT</td>
  <td class="td4"><textarea class="form-control" style="resize: none;" rows="10" name='content'
            readonly="readonly"><c:out value="${board.content}" /></textarea></td>
</tr>
<tr>
	 <td colspan='2' align='center'>
		<input class="button" type='submit' value='Write'>
		<input class="button" type='button' value='Modify' onclick="modify">
	 </td>
</tr>

</table>
<hr width="600" size="2" color="gray" noshade>

</body>
</html>