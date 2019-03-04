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
  <link rel="stylesheet" type="text/css" href="/resources/css/post.css">
</head>
<body>
<center>

<hr width='600' size='2' color='gray' noshade>
<h3> BOARD</h3>

<a class="in" href='list.do'>목록</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="in" href='write.do'>글쓰기</a><br/>

<hr width='600' size='2' color='gray' noshade>
</center>

<form name='input' method='post' action='update.do'>
<input type="hidden" name="seq" value="<c:out value="${board.seq}"/>">
<table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>	
<tr>
   <td class="td1" width='20%' align='center' >WRITER</td>
   <td class="td1">
      <c:out value="${board.writer}"/>
   </td>
</tr>

<tr>
	<td class="td2" align='center'>DATE</td>
	<td class="td2"><c:out value="${board.rdate}"/></td>
</tr>

<tr>
	<td class="td3" align='center'>SUBJECT</td>
	<td class="td3"><c:out value="${board.subject}"/></td>
</tr>
			
<tr>
	<td class="td4" align='center'>CONTENT</td>
  <td class="td4"><textarea  name='content' rows='15' cols='70'><c:out value="${board.content}"/></textarea></td>
</tr>
<tr>
	 <td colspan='2' align='center'>
		<input class="button" type='submit' value='Write'>
		<input class="button" type='button' value='ReWrite' onclick=f()>
	 </td>
</tr>

</table>
<hr width="600" size="2" color="gray" noshade>
</form>
</body>
</html>