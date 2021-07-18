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
	.tabella{
		
		background: linear-gradient(green,white);
		width: 100vw;
		height: 100vh;
		max-width: 100%;
		display: flex;
		flex-flow: row wrap;
		justify-content: center;
		align-items: center;
	}	
	
	.credenziali{
		display: flex;
		flex-basis: 50%;
		padding: 1rem;
		background-color: white;
		border: 2px;
	    border-radius: 10px;
		flex-flow: column wrap;
	}

	.campo{
		flex-basis:100%;
		display: flex;
		align-items: center;
}
	
	.credenziali > *{
		margin : 10px;
	}

	.bottone{
		padding: 8px;
		border: 2px;
		border-radius: 5px;
		cursor: pointer;
		background : green;
	}

      .bottone:hover{
        border-color: #F90;
        background-color: #66FF00;
</style>
<body>
<form class="tabella" action="<%= request.getAttribute("context")%>/Dashboard/home" method="get">
	<fieldset class="credenziali">
	
		<h2>Login Admin</h2> 
		
		<span>Email</span> 
		<label for="email" class = "campo">
				<input type="email" name="email" id="email" placeholder="mrisi@unisa.it">		
		</label>
		
		<span>Password</span>
		<label for="password" class="campo">
			<input type="password" name="password" id="password" placeholder="****">
		</label>
		<button type="submit" class="bottone">Accedi</button>
	</fieldset>
</form>

</body>
</html>