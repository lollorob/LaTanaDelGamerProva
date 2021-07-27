<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Home"/>
 	<jsp:param name="style" value = "home.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
 

</head>

<body>


	<div id="sidebar" onmouseleave="closeMenu()">
		<h3>Pannello</h3>
		<nav>
			
		 	<ul >
		 		<li><a href="#">Home</a>
		 		<li><a href="/laTanaDelGamer/dashboard/clienti">Clienti</a>
		 		<li><a href="#">Ordini</a>
		 		<li><a href="#">Categorie</a>
		 		<li><a href="#">Prodotti</a>
		 		<li><a href="#">Disconnetti</a>	
		 	</ul>
	 	</nav>
	
	</div>
	
	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto! Quale operazione desidera effettuare?
		</header>
		
		<div class="info">
       		<div class="clienti">
       			<h4>clienti registrati</h4>
       			<h2>24</h2>
       		</div>
       		
       		<div class="clienti">
       			<h4>utenti registrati</h4>
       			<h2>24</h2>
       		</div>
       		
       		<div class="clienti">
       			<h4> registrati</h4>
       			<h2>24</h2>
       		</div>
       		
       		<div class="clienti">
       			<h4>clienti registrati</h4>
       			<h2>24</h2>
       		</div>
       		
       		
       	</div>	
       		<!--  <footer>
       			<p>Copyright 2020 lollorob.</p>
       		</footer>-->
    	
    	
    	
    </div>



</body>
</html>



