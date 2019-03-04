<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tr>
    <th>Rank</th>
    <th>NickName</th>
    <th>Record</th>
</tr>
<c:set var="count" value="0" />
<c:forEach var="item" items="${rank}">
<c:set var="count" value="${count + 1}" />
<tr>
<td>${count}</td>
<td>${item.username}</td>
<td>${item.showRecord}</td>
</tr>
</c:forEach>
