<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!doctype html>
  

  
  <html>
       <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
       <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminmain.css">
  <head>
  <%@ include file="../header.html" %>
   <%@ include file="../sidebar.html" %>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript" src="../resources/js/visitorChart.js"></script>

    
      
    
  </head>
  
  <body>
  
         
 <div id="dashboard">
	<div id="slider"></div> 
	 <div id="visitor_chart"></div>
 </div>

  </body>
  
</html>