<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp">
    	<jsp:param name="title" value="Login Admin"/>
    	<jsp:param name="style" value = "loginAdmin.css"/>
  </jsp:include>
</head>
<body>
<div class="login">
	<img src="/LaTanaDelGamer/immagini/adminLogo.png"  alt="noLogo" class="logo">
	<h1>Login </h1>
	
	<form  action="<%= request.getAttribute("context")%>/Dashboard/home" method="get">
		
		<div class="textbox">
			<input type="email"  name="email" placeholder="Email" required>
			
 		</div>
 		
 		<div class="textbox">
			<input type="password" name="password"  placeholder="Password "required>
			
			
 		</div>
 		
 		<button type="submit" class="bottone">Accedi</button>
	</form>
</div>

</body>
</html>