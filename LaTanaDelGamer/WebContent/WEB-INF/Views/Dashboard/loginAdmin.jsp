<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
    
    
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
	
	<form  action="<%= request.getAttribute("context")%>/accounts/loginAdmin" method="post">
		
		<div class="textbox">
			<input type="text" minlength="5" name="username" placeholder="Username" required>
			
 		</div>
 		
 		<div class="textbox">
			<input type="password" name="passwd"  placeholder="Password "required>
			
			
 		</div>
 		
 		<button type="submit" class="bottone">Accedi</button>
	</form>
</div>

</body>

<script type="text/javascript">
 
    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
         
                password: "required",
            },
             
            messages: {
                email: {
                    required: "Please enter email",
                    email: "Please enter a valid email address"
                },
                 
                password: "Please enter password"
            }
        });
 
    });
</script>
</html>