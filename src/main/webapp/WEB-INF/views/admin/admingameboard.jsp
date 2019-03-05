<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gameboard.css">
    
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="../resources/js/gameChart.js"></script>
  </head>
  
  <body>
	 <%@ include file="../header.html" %>
	 <%@ include file="../sidebar.html" %>	

<div class="background">
        <div class="tabbed_area">  
        
      <div id="admin_gameboard"/>
      <div name="dashboard"/>
      <div id="string_filter_div"/>
      </div>
      </div>
</body>
   
    
</html>
