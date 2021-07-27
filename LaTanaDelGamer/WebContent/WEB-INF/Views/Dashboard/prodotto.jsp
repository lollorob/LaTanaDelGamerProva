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
 
 

</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto! Quale operazione desidera effettuare?
		</header>
		<form method="post" action="/LaTanaDelGamer/prodotti/crea">
			<fieldset>
		<legend><b>Crea Prodotto</b></legend>
		<input type="hidden" name="action" value="crea">
		
		<label for="id_prodotto">Id:</label><br>
		<input id="id_prodotto" name="id" type="number" min="1" placeholder="Inserisci id prodotto" required><br>
		
		<label for="nome">Nome:</label><br>
		<input id="nome" name="nome" type="text" maxlength="70" placeholder="Inserisci nome" required><br>
		
		<label for="prezzo">Prezzo:</label><br>
		<input id="prezzo" name="prezzo" type="number" min="0" placeholder="Inserisci prezzo" required><br>
		
		<label for="descrizione">Descrizione:</label><br>
		<input id="descrizione" name="descrizione" type="text" maxlength="500" placeholder="Inserisci descrizione" required><br>
		
		<label for="casaproduttrice">Casa Produttrice:</label><br>
		<input id="casaproduttrice" name="casaproduttrice" type="text" maxlength="50" placeholder="Inserisci casaproduttrice" required><br>
		
		<label for="quantita">Quantità:</label><br>
		<input id="quantita" name="quantita" type="number" min="1" required><br>
				
		<label for="copertina">Copertina:</label><br>
		<input id="copertina" name="copertina" type="file" required><br>
		
		<label for="nome_categoria">Categoria:</label><br>
		<input id="nome_categoria" name="nome_categoria" type="text" placeholder="Inserisci Categoria" required><br>
		
		<button type="submit" class="bottone">Crea</button>
	
		</form>
       		
       	</div>	


</body>
</html>