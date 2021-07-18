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

<main class="app">

      <aside class="laterale"> 
      <nav class="menu grid-y align-center">
      <img alt="No Image" src="/LaTanaDelGamer/immagini/logo.png" width=80 height=30>
        <a href="#">Clienti</a>
        <a href="#">Prodotti</a> 
        <a href="#">Categorie</a>
        <a href="#">Ordini</a>
        <a href="#">Disconnetti</a>
      </nav>
      </aside>
    
    
    <section class="contenuto grid-y">
    	<header class= "superiore">
    	Menu superiore
    	</header>
    	<div class="corpo"></div>
    	<footer class= "info">
    	<p>Copyright 2020. La Tana Del Gamer tutti i diritti riservati </p>
    	</footer>
    	
    </section>
    







</main>
</body>
</html>