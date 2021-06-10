<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
 <%
 	Collection<?> accounts = (Collection<?>)request.getAttribute("accounts");
 
 	String error = (String)request.getAttribute("error");
 	
 	if(accounts == null && error == null) {
 		response.sendRedirect(response.encodeRedirectUrl("./AccountUserControl"));
 		return;
 	}
 	
 	AccountUserBean account = (AccountUserBean) request.getAttribute("username");
 %>

<!DOCTYPE html>
<html lang="it">
<head>
	<meta name="author" content="Lorenzo Lucio Ruocco, Roberto Balestrieri"> 
	<meta charset="UTF-8">
	<link href="AccountUserStyle.css" rel="stylesheet" type="text/css">
<title>	Lista Degli Account</title>
</head>
<body>

<h1> Store Demo</h1>
<h2>Accounts</h2>

<table>
	<tr>
		<th>Username</th>
		<th>E-Mail</th>
		<th>Password</th>
		<th>Nome</th>
		<th>Cognome</th>
		<th>DataDiNascita</th>
		<th>N-Ordini</th>
		<th>Via</th>
		<th>Numero</th>
		<th>Cap</th>
		<th>Città</th>
		<th>Provincia</th>
		<th>Azioni</th>
	</tr>
	<%
		if(accounts != null && accounts.size() > 0) {
			
			Iterator<?> it = accounts.iterator();
			while(it.hasNext()) {
				AccountUserBean bean = (AccountUserBean)it.next();
	%>
		<tr>
			<td><%=bean.getUsername() %></td>
			<td><%=bean.geteMail() %></td>
			<td><%=bean.getPasswd() %></td>
			<td><%=bean.getNome() %></td>
			<td><%=bean.getCognome() %></td>
			<td><%=bean.getData() %></td>
			<td><%=bean.getn_Ordini() %></td>
			<td><%=bean.getVia() %></td>
			<td><%=bean.getNumero() %></td>
			<td><%=bean.getCap() %></td>
			<td><%=bean.getCitta() %></td>
			<td><%=bean.getProvincia() %></td>
			<td>
			<a href="<%=response.encodeURL("AccountUserControl?action=details&id=" + bean.getUsername())%>">Details</a>
			<a href="<%=response.encodeURL("AccountUserControl?action=delete&id=" + bean.getUsername())%>">Delete</a>	
			</td>
		</tr>
	<%		}
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Account</td>
		</tr>
	<% } %>
</table>
	
	<%
		if(account!= null) {  
	%>
	
		<h2>Details</h2>
		<table>
			<tr>
				<th>Username</th>
				<th>Nome</th>
				<th>Cognome</th>
			</tr>
			
			<tr>
				<td><%=account.getUsername()%></td>
				<td><%=account.getNome() %></td>
				<td><%=account.getCognome()%></td>	
			</tr>
		</table>
		
		<form action="<%=response.encodeURL("AccountUserControl")%>" method="POST">
			<fieldset>
				<legend><b>Update</b></legend>
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="username" value="<%=account.getUsername()%>">
				
				
				<label for="e_mail">EMAIL:</label><br>
				<input id="e_mail" name="e_mail"  type="email" maxlength="100" placeholder="enter email" required><%=account.geteMail()%><br>

				<label for="nome">Nome:</label><br>
				<input id="nome" name="nome" type="text" maxlength="20" placeholder="enter name" required value="<%=account.getNome()%>"><br>

				<label for="cognome">Cognome:</label><br>
				<input id="cognome" name="cognome" type="text" required value="<%=account.getCognome()%>"><br>

				<label for="datadinascita">Data(YYYY-MM-DD):</label><br>
				<input id="datadinascita" name="datadinascita" type ="date" required><%=account.getData()%><br>

				<label for="n_ordini">N Ordini:</label><br>
				<input id="n_ordini" name="n_ordini" type="number" min="0" required value="<%=account.getn_Ordini()%>"><br>

				<label for="via">Via:</label><br>
				<input id="via" name="via" type="text" maxlength="20" placeholder="enter via" required value="<%=account.getVia()%>"><br>

				<label for="numero">Numero:</label><br>
				<input id="numero" name="numero" type="number" min="1" required value="<%=account.getNumero()%>"><br>		

				<label for="cap">CAP:</label><br>
				<input id="cap" name="cap" type="number" min="1" required value="<%=account.getCap()%>"><br>

				<label for="citta">Città:</label><br>
				<input id="citta" name="citta" type="text" maxlength="20" placeholder="enter citta" required value="<%=account.getCitta()%>"><br>

				<label for="prvincia">Provincia:</label><br>
				<input id="provincia" name="provincia" type="text" maxlength="20" placeholder="enter via" required value="<%=account.getProvincia()%>"><br>

				
				<input type="submit" value="Update">
				<input type="reset" value="Reset">
			</fieldset>
		</form>		

	<%  } %>

<%
	String message = (String)request.getAttribute("message");
	if(message != null && !message.equals("")) {
%>
	<p style="color: green;"><%=message %></p>
<%
	}
	if(error != null && !error.equals("")) {
%>
	<p style="color: red;">Error: <%= error%></p>
<%
	}
%>	


<form action="<%=response.encodeURL("AccountUserControl")%>" method="POST">
	<fieldset>
		<legend><b>Insert</b></legend>
		<input type="hidden" name="action" value="insert">
		
		<label for="username">Username:</label><br>
		<input id="username" name="username" type="text" maxlength="20" placeholder="Inserisci username" required><br>
		
		<label for="e_mail">EMAIL:</label><br>
		<input id="e_mail" name="e_mail" type="email" maxlength="100" placeholder="enter email" required><br>
		
		<label for="passwd">Password:</label><br>
		<input id="passwd" name="passwd" type="password" min="5" placeholder="enter password" required><br>
		
		<label for="nome">Nome:</label><br>
		<input id="nome" name="nome" type="text" maxlength="20" placeholder="Inserisci nome" required><br>
		
		<label for="cognome">Cognome:</label><br>
		<input id="cognome" name="cognome" type="text" maxlength="20" placeholder="Inserisci cognome" required><br>
		
		<label for="datadinascita">Data di Nascita:</label><br>
		<input id="datadinascita" name="datadinascita" type="date" required><br>
		
		<label for="via">Via:</label><br>
		<input id="via" name="via" type="text" placeholder="enter via" required><br>

		<label for="numero">Numero:</label><br>
		<input id="numero" name="numero" type="number" min="1" required><br>		

		<label for="cap">CAP:</label><br>
		<input id="cap" name="cap" type="text" required><br>

		<label for="citta">Città:</label><br>
		<input id="citta" name="citta" type="text" maxlength="20" placeholder="enter citta" required><br>

		<label for="prvincia">Provincia:</label><br>
		<input id="provincia" name="provincia" type="text" maxlength="20" placeholder="enter via" required ><br>
		
		<input type="submit" value="Insert">
		<input type="reset" value="Reset">
	</fieldset>
</form>

</body>
</html> 