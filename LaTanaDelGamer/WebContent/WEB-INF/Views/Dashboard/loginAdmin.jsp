<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp">
    	<jsp:param name="title" value="Login Admin"/>
    </jsp:include>
<meta charset="UTF-8">

</head>

<style>
	.login{
		
		}




</style>
<body>

<form class="app" action="/loginAdmin" method="post">
	<fieldset class="grid-y cell w50">
	
		<h2>Login Admin</h2> 
		
		<span>Email</span> 
		<label for="email">
				<input type="email" name="email" id="email" placeholder="mrisi@unisa.it">		
		</label>
		
		<span>Password</span>
		<label for="password">
			<input type="password" name="password" id="password" placeholder="0000">
		</label>
		<button type="submit">Accedi</button>
	</fieldset>





</form>

</body>
</html>