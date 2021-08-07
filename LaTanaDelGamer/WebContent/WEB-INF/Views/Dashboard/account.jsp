<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Categorie | Admin"/>
 	<jsp:param name="style" value = "accounts.css"/>
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
		
			<div class="tabella">
          		<form action="<%=response.encodeURL("/LaTanaDelGamer/accounts/crea")%>" method="POST">
			
				<h4><b>Crea Un Utente</b></h4>
				
				<div class="riga">
					<div class="nome">
						<label for="nome">Username</label>
					</div>
				<div class="area">
					<input id="username" name="username" type="text" maxlength="70" placeholder="Username"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Password</label>
					</div>
				<div class="area">
					<input id="passwd" name="passwd" type="password" maxlength="50" placeholder="Inserisci Password"><br>
				</div>			
			</div>			
		
				<div class="riga">
					<div class="nome">
						<label for="nome">E-Mail</label>
					</div>
				<div class="area">
					<input id="e_mail" name="e_mail" type="text" maxlength="100" placeholder="Inserisci E-Mail"><br>
				</div>			
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Nome</label>
					</div>
				<div class="area">
					<input id="nome" name="nome" type="text" maxlength="20" placeholder="Inserisci Nome"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Cognome</label>
					</div>
				<div class="area">
					<input id="cognome" name="cognome" type="text" maxlength="20" placeholder="Inserisci Cognome"><br>
				</div>	
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Data Di Nascita</label>
					</div>
				<div class="area">
					<input id="datadinascita" name="datadinascita" type="date"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Via</label>
					</div>
				<div class="area">
					<input id="via" name="via" type="text" maxlength="100" placeholder="Inserisci Via"><br>
				</div>
			</div>

				<div class="riga">
					<div class="nome">
						<label for="nome">Numero</label>
					</div>
				<div class="area">
					<input  id="numero" name="numero" type="number" min="1" placeholder="Inserisci Numero"><br>
				</div>
			</div>		
			
				<div class="riga">
					<div class="nome">
						<label for="nome">CAP</label>
					</div>
				<div class="area">
					<input  id="cap" name="cap" type="number" min="1"  placeholder="Inserisci CAP"><br>
				</div>
			</div>

				<div class="riga">
					<div class="nome">
						<label for="nome">Città</label>
					</div>
				<div class="area">
					<input  id="citta" name="citta" type="text" maxlength="20" placeholder="Inserisci Città"><br>
				</div>
			</div>	
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Provincia</label>
					</div>
				<div class="area">
					<input  id="provincia" name="provincia" type="text" maxlength="20" placeholder="Inserisci Provincia"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Admin</label>
					</div>
				<div class="area">
					<select id="is_admin" name="is_admin">
						<option value="true">SI</option>
						<option value="false">NO</option>
					</select>
				</div>
			</div>			
			
			<button type="submit" class="bottone" onClick="return valida()">Crea</button>
		</form>
				<form action="/LaTanaDelGamer/Dashboard/account" method="POST">
		<button>Annulla</button>
		</form>
	</div>
</div>

       </tbody> 


</body>
</html>