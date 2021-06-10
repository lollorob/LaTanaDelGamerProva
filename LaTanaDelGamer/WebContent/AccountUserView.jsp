<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
 <%
 	Collection<?> accounts = (Collection<?>)request.getAttribute("accounts");
 
 	String error = (String)request.getAttribute("error");
 	
 	if(accounts == null && error == null) {
 		response.sendRedirect(response.encodeRedirectUrl("./AccountUserControl"));
 		return;
 	}
 	
 	AccountUserBean account = (AccountUserBean) request.getAttribute("account");
 %>
 
<!DOCTYPE html>
<html lang="it">
<head>
	<meta name="author" content="lollorob"> 
	<meta charset="UTF-8">
<title>	Lista Degli Account</title>
</head>
<body>

<h1> Store Demo</h1>
<h2>Accounts</h2>

<table>
	<tr>
		<th>Username <a href="<%=response.encodeURL("AccountUserControl?sort=username")%>">Sort</a></th>
		<th>Nome <a href="<%=response.encodeURL("AccountUserControl?sort=nome")%>">Sort</a></th>
		<th>N-Ordini <a href="<%=response.encodeURL("AccountUserControl?sort=n_Ordini")%>">Sort</a></th>
		<th>Action</th>
	</tr>

	<%
		if(accounts != null && accounts.size() > 0) {
			
			Iterator<?> it  = accounts.iterator();
			while(it.hasNext()) {
				AccountUserBean bean = (AccountUserBean)it.next();	
	%>
			<tr>
				<td><%=bean.getUsername()%></td>
				<td><%=bean.getNome()%></td>
				<td><%=bean.getn_Ordini()%></td>
				<td>
					
					<a href="<%=response.encodeURL("AccountUserControl?action=delete&id=" + bean.getUsername())%>">Delete</a>	
					<a href="<%=response.encodeURL("AccountUserControl?action=insert&id=" + bean.getUsername())%>">Insert</a>
					<a href="<%=response.encodeURL("AccountUserControl?action=insert&id=" + bean.getUsername())%>">Update</a>	
				</td>
			</tr>
	<% 		} 
	 	} else { %>

	<tr>
		<td colspan="4">Non ci sono account</td>
	</tr>	
	<% } %>

</table>

	<%
		if(account != null && !account.isEmpty()) {
	%>


<table>
	<tr>
		<th>Username</th>
		<th>E-Mail</th>
		<th>Password</th>
		<th>Nome</th>
		<th>Cognome</th>
		<th>Data Di Nascita</th>
		<th>N-Ordini</th>
		<th>Via</th>
		<th>Numero</th>
		<th>Cap</th>
		<th>Città</th>
		<th>Provincia</th>
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
		</tr>
	</table>	
	
	
	<form action="<%=response.encodeURL("AccountUserControl")%>" method="POST">
			<fieldset>
				<legend><b>Update</b></legend>
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="username" value="<%=account.getUsername()%>">
				
				<label for="e_mail">EMAIL:</label><br>
				<input id="e_mail" name="e_mail" maxlength="100" placeholder="enter email" required><%=account.geteMail()%><br>
				
				<label for="nome">Nome:</label><br>
				<input id="nome" name="nome" type="text" maxlength="20" placeholder="enter name" required value="<%=account.getNome()%>"><br>
				
				<label for="cognome">Cognome:</label><br>
				<input id="cognome" name="cognome" type="number" min="0" required value="<%=account.getCognome()%>"><br>
				
				<label for="datadinascita">Data(YYYY-MM-DD):</label><br>
				<input id="datadinascita" name="datadinascita" maxlength="100" placeholder="enter data" required><%=account.getData()%><br>
				
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
	
	<%
			}
		}
	}
	%>
		
	






</body>
</html>