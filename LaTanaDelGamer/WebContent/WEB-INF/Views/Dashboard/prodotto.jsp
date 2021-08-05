<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Home"/>
 	<jsp:param name="style" value = "prodotto.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 
 
 <script type="text/javascript" src="/LaTanaDelGamer/js/prodotto.js"></script>

</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto! Quale operazione desidera effettuare?
		</header>
		
		
		<div class="tabella">
			<form method="post" class="form" action="/LaTanaDelGamer/prodotti/crea" enctype="multipart/form-data" name="prodotto">
				
					<h4><b>Crea Prodotto</b></h4>
					
					
					<div class="riga">
						<div class="nome">
							<label for="nome">Nome</label>
						</div>
						<div class="area">
							<input id="nome" name="nome" type="text" maxlength="70" placeholder="Nome"><br>
						</div>
					</div>
					
					<div class="riga">
						<div class="nome">	
							<label for="prezzo">Prezzo</label>
						</div>
						<div class="area">
							<input id="prezzo" name="prezzo" type="text" placeholder="Prezzo"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="descrizione">Descrizione</label>
						</div>
						<div class="area">
							<input id="descrizione" name="descrizione" type="text" maxlength="500" placeholder="Descrizione"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="casaproduttrice">Casa produttrice</label>
						</div>
						<div class="area">
							<input id="casaproduttrice" name="casaproduttrice" type="text" maxlength="50" placeholder="Casa Produttrice" ><br>
						</div>
					</div>
						
					<div class="riga">	
						<div class="nome">
							<label for="quantita">Quantità</label>
						</div>
						<div class="area">
							<input id="quantita" name="quantita" type="text" placeholder="Quantità"><br>
						</div>
					</div>
					
					<div class="riga">	
						<div class="nome">
							<label for="copertina">Copertina</label>
						</div>
						<div class="area">
							<input id="copertina" name="copertina" type="file" placeholder="Copertina"><br>
						</div>
					</div>
					
					<div class="riga">
						<div class="nome">	
							<label for="nome_categoria">Categoria</label>
						</div>
								<select id="nome_categoria" name="nome_categoria">
									<option value="Sparatutto">Sparatutto</option>
									<option value="Sportivi">Sportivi</option>
									<option value="NonEsiste">ProvaErrore</option>
								</select>
					</div>	
					
					
						<button type="submit" class="bottone" onClick="return valida()">Crea</button>
						
				
			</form>
	     </div>	
     </div>	


</body>
</html>