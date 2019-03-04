<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/css/board/write.css">
</head>
<body>
<center>

<hr width='600' size='2' color='gray' noshade>
<h3> rainbow BOARD</h3>

<a class="button" href='list.do'>목록</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="button" href='write.do'>글쓰기</a><br/>
<hr width='600' size='2' color='gray' noshade>
</center>

<form name='input' method='post' action='register'>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="no" value="${board.no}">
<input type="hidden" name="boardnum" value="${param.boardnum}">
<table border='0' width='600' align='center' cellpadding='3' cellspacing='1' bordercolor='gray'>	
<tr>
   <td class="td1" width='20%' align='center' >WRITER</td>
   <td class="td1">
      <input type="text" name='writer' value ="<sec:authentication property="principal.member.name"/>" readonly/>
   </td>
</tr>

<tr>
	<td class="td2" align='center'>EMAIL</td>
	<td class="td2"><input type="text" name='email' value ="<sec:authentication  property="principal.member.email"/>" readonly/></td>
</tr>

<tr>
	<td class="td3" align='center'>SUBJECT</td>
	<td class="td3"><input type="text" name='subject'/></td>
</tr>
<tr>

	<td class="td5" align='center'>FILE</td>
	<td class="td5"><input type="file" name='file'/></td>

</tr>			
<tr>
	<td class="td4" align='center'>CONTENT</td>
  <td class="td4"><textarea  name='content' rows='15' cols='70'></textarea></td>
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