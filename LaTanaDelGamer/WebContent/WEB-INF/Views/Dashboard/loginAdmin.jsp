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
  
  
 <% if(session.getAttribute("adminRoles") != null){
	    boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	    if( adminRoles == true) {
		
	    request.getRequestDispatcher("/WEB-INF/Views/Dashboard/home.jsp").forward(request, response);
		} 
	}%>     


</head>
<body>



<div class="login">
	<img src="/LaTanaDelGamer/immagini/adminLogo.png"  alt="noLogo" class="logo">
	<h1>Login </h1>
	
	<form  action="<%= request.getAttribute("context")%>/accounts/loginAdmin" method="post">
		
		<div class="textbox">
			<input type="text" minlength="5" name="username" placeholder="Username" required>
			
 		</div>
 		
 		<div class="textbox">
			<input type="password" name="passwd"  placeholder="Password "required>
			
			
 		</div>
 		
 		<button type="submit" class="bottone">Accedi</button>
 		<% if(session.getAttribute("failedAdmin") != null){
		    boolean failedAdmin = (Boolean) session.getAttribute("failedAdmin");
		    if( failedAdmin == true) {%>
			<div>
		       <p align="center">Accesso negato</p>
		    <%request.getSession().setAttribute("failedAdmin",false);
		   }
   		 }%>  
	</div>
	</form>
</div>

</body>

</html>