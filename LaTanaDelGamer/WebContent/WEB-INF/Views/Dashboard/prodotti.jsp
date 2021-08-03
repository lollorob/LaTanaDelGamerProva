<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Home"/>
 	<jsp:param name="style" value = "prodotti.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 
 

</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto! Quale operazione desidera effettuare?
		</header>
		<caption><a href="/LaTanaDelGamer/prodotti/crea">Aggiungi Prodotto</a></caption>
	<%@include file="/WEB-INF/Views/PagineComuni/tab.jsp" %> 
       		
       	</div>	


</body>
</html>