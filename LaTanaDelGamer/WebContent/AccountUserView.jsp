<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
 <%
 	Collection<?> accounts = (Collection<?>)request.getAttribute("accounts");
 
 	String error = (String)request.getAttribute("error");
 	
 	if(accounts == null && error == null) {
 		response.sendRedirect(response.encodeRedirectUrl("./AccountUserControl"));
 		return;
 	}
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
		
	<%
			}
		} else {
	
	%>

		<tr>
			<td colspan="4">Non ci sono Account</td>
		</tr>
		
	<% } %>
	
</table>

</body>
</html>