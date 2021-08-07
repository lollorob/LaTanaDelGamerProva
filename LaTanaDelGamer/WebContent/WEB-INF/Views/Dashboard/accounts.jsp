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
 
  <%
 	Collection<?> accounts = (Collection<?>)session.getAttribute("listaAccount");
 
 	if(accounts == null) {
 		System.out.println("Collection ACCOUNTS NULL");
 		return;
 	}
 %>

</head>

<body>

	<%@include file="/WEB-INF/Views/PagineComuni/menu.jsp" %> 

	<img src="/LaTanaDelGamer/icone/freccia.svg" alt="Freccia" class="freccia" onmouseover="openMenu()" id="menu">
	<div id="contenuto" onClick="closeMenu()">
		 
		<header class="top">
			Benvenuto! Quale operazione desidera effettuare?
		</header>
				<caption><a href="/LaTanaDelGamer/accounts/crea">Aggiungi Utente</a></caption>
	 	<div id="tabella"> 
    <table> 
       <thead> 
          <tr> 
 		<th>Username</th>
		<th>E-Mail</th>
		<th>DataDiNascita</th>
		<th>N-Ordini</th>
		<th>Azioni</th>
          </tr> 
               <%
		if(accounts != null && accounts.size() > 0) {
			
			Iterator<?> it = accounts.iterator();
			while(it.hasNext()) {
				AccountUserBean bean = (AccountUserBean)it.next();
			
	%>
       </thead> 
       <tbody> 
          <tr>	
             <td data-title="Username"><%=bean.getUsername() %></td> 
             <td data-title="E-Mail"><%=bean.geteMail() %></td>
             <td data-title="DataDiNascita"><%=bean.getData() %></td>
             <td data-title="N-Ordini"><%=bean.getn_Ordini() %></td>
			 <td><form method="POST" action="/LaTanaDelGamer/accounts/cancella">
             		<button type="submit" name="id" class="bottone" value="<%=bean.getUsername()%>">Elimina</button>
             	</form> 
             	 <form method="POST" action="/LaTanaDelGamer/accounts/dettagli">
             		<button type="submit" name="id" class="bottone" value="<%=bean.getUsername()%>">Dettagli</button>
             	</form>
             	
             	</td>
          </tr>
                <% }
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Utenti Registrati</td>
		</tr>
	<% } %>
         </table>
    <% AccountUserBean account1 = (AccountUserBean) session.getAttribute("clienti");
    	session.removeAttribute("clienti");%>
	
	<%
		if(account1!= null) {  
	%>
         		<h2>Dettagli</h2>
		<table>
			<tr>
				<th>Username</th>
				<th>Nome</th>
				<th>Cognome</th>
				<th>Via</th>
				<th>Numero</th>
				<th>CAP</th>
				<th>Citta</th>
				<th>Provincia</th>
				<th>Admin</th>
			</tr>
			
			<tr>
				<td><%=account1.getUsername()%></td>
				<td><%=account1.getNome() %></td>
				<td><%=account1.getCognome()%></td>
				<td><%=account1.getVia()%></td>
				<td><%=account1.getNumero()%></td>
				<td><%=account1.getCap()%></td>
				<td><%=account1.getCitta()%></td>	
				<td><%=account1.getProvincia()%></td>
				<td><%=account1.isAdmin()%></td>
			</tr>
		</table>
		
			<div class="tabella">
          		<form action="<%=response.encodeURL("/LaTanaDelGamer/accounts/aggiorna")%>" method="POST">
			
				<h4><b>Update</b></h4>
				
				<div class="riga">
					<div class="nome">
						<label for="nome">Username</label>
					</div>
				<div class="area">
					<input id="username" name="username" type="text" maxlength="70" placeholder="Username" value="<%=account1.getUsername()%>"><br>
				</div>
			</div>
		
				<div class="riga">
					<div class="nome">
						<label for="nome">E-Mail</label>
					</div>
				<div class="area">
					<input id="e_mail" name="e_mail" type="text" maxlength="100" placeholder="Inserisci E-Mail" value="<%=account1.geteMail()%>"><br>
				</div>			
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Nome</label>
					</div>
				<div class="area">
					<input id="nome" name="nome" type="text" maxlength="20" placeholder="Inserisci Nome" value="<%=account1.getNome()%>"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Cognome</label>
					</div>
				<div class="area">
					<input id="cognome" name="cognome" type="text" maxlength="20" placeholder="Inserisci Cognome" value="<%=account1.getCognome()%>"><br>
				</div>	
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Data Di Nascita</label>
					</div>
				<div class="area">
					<input id="datadinascita" name="datadinascita" type="date" value="<%=account1.getData()%>"><br>
				</div>
			</div>
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Numero Di Ordini</label>
					</div>
				<div class="area">
					<input  readonly id="n_ordini" name="n_ordini" type="number" min="0" value="<%=account1.getn_Ordini()%>"><br>
				</div>
			</div>
		
				<div class="riga">
					<div class="nome">
						<label for="nome">Via</label>
					</div>
				<div class="area">
					<input id="via" name="via" type="text" maxlength="20" placeholder="Inserisci Via"  value="<%=account1.getVia()%>"><br>
				</div>
			</div>

				<div class="riga">
					<div class="nome">
						<label for="nome">Numero</label>
					</div>
				<div class="area">
					<input  id="numero" name="numero" type="number" min="1" placeholder="Inserisci Numero" value="<%=account1.getNumero()%>"><br>
				</div>
			</div>		
			
				<div class="riga">
					<div class="nome">
						<label for="nome">CAP</label>
					</div>
				<div class="area">
					<input  id="cap" name="cap" type="number" min="1"  placeholder="Inserisci CAP" value="<%=account1.getCap()%>"><br>
				</div>
			</div>

				<div class="riga">
					<div class="nome">
						<label for="nome">Città</label>
					</div>
				<div class="area">
					<input  id="citta" name="citta" type="text" maxlength="20" placeholder="Inserisci Città"  value="<%=account1.getCitta()%>"><br>
				</div>
			</div>	
			
				<div class="riga">
					<div class="nome">
						<label for="nome">Provincia</label>
					</div>
				<div class="area">
					<input  id="provincia" name="provincia" type="text" maxlength="20" placeholder="Inserisci Provincia" value="<%=account1.getProvincia()%>"><br>
				</div>
			</div>
			
			<button type="submit" class="bottone" onClick="return valida()">Aggiorna</button>
		</form>
		<form action="/LaTanaDelGamer/Dashboard/account" method="POST">
		<button>Annulla</button>
		</form>
	</div>
</div>
	
			<%  } %>
 
       </tbody> 

</div>

</body>
</html>