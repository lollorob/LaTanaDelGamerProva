<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Home"/>
 	<jsp:param name="style" value = "dashboard.css"/>
 	<jsp:param name="script" value = "Home.js"/>
 </jsp:include>
 
 
</head>
<body>

<nav class="menu">
 <a href="#"><img id="logo" alt="logo" src="/LaTanaDelGamer/immagini/logo.png" width="240"></a>
 <%@include file="/icons/icons8-menu.svg" %>
 <ul>
 <a href="#"><li class="active">Home</li></a>
 <a href="#"><li>Clienti</li></a>
 <a href="#"><li>Ordini</li></a>
 <a href="#"><li>Categorie</li></a>
 <a href="#"><li>Prodotti</li></a>
 <a href="#"><li>Disconnetti</li></a>
 </ul>
 </nav>
 
 <topbar>

</body>
</html>