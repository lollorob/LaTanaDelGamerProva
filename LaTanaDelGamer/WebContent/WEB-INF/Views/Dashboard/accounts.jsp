<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Categorie | Admin"/>
 	<jsp:param name="style" value = "categorie.css"/>
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
		<caption><a>Lista Degli Utenti Registrati</a></caption>
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
          		<form action="<%=response.encodeURL("/LaTanaDelGamer/accounts/aggiorna")%>" method="POST">
			
			<fieldset>
				<legend><b>Update</b></legend>
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="username" value="<%=account1.getUsername()%>">
				
				
				<label for="e_mail">EMAIL:</label><br>
				<input id="e_mail" name="e_mail"  type="email" maxlength="100" placeholder="inserisci email" required value="<%=account1.geteMail()%>"><br>

				<label for="nome">Nome:</label><br>
				<input id="nome" name="nome" type="text" maxlength="20" placeholder="inserisci name" required value="<%=account1.getNome()%>"><br>

				<label for="cognome">Cognome:</label><br>
				<input id="cognome" name="cognome" type="text" required value="<%=account1.getCognome()%>"><br>


				<label for="datadinascita">Data di nascita:</label><br>
				<input id="datadinascita" name="datadinascita" type ="date" required value="<%=account1.getData()%>"><br>

				<label for="n_ordini">N Ordini:</label><br>
				<input readonly id="n_ordini" name="n_ordini" type="number" min="0" required value="<%=account1.getn_Ordini()%>"><br>

				<label for="via">Via:</label><br>
				<input id="via" name="via" type="text" maxlength="20" placeholder="inserisci via" required value="<%=account1.getVia()%>"><br>

				<label for="numero">Numero:</label><br>
				<input id="numero" name="numero" type="number" min="1" placeholder="inserisci numero" required value="<%=account1.getNumero()%>"><br>		

				<label for="cap">CAP:</label><br>
				<input id="cap" name="cap" type="number" min="1" required  placeholder="inserisci cap" value="<%=account1.getCap()%>"><br>

				<label for="citta">Città:</label><br>
				<input id="citta" name="citta" type="text" maxlength="20" placeholder="inserisci città" required value="<%=account1.getCitta()%>"><br>

				<label for="prvincia">Provincia:</label><br>
				<input id="provincia" name="provincia" type="text" maxlength="20" placeholder="inserisci via" required value="<%=account1.getProvincia()%>"><br>
	
				
				<input type="submit" value="Aggiorna">
				<input type="reset" value="Reset">
			</fieldset>
		</form>
		<form action="/LaTanaDelGamer/Dashboard/account" method="POST">
		<button>Annulla</button>
		</form>
			<%  } %>
 
       </tbody> 
 </div>
       		
       	</div>	


</body>
</html>