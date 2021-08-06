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
		<th>Nome</th>
		<th>Cognome</th>
		<th>Via</th>
		<th>Numero</th>
		<th>CAP</th>
		<th>Citta</th>
		<th>Provincia</th>
		<th>Admin</th>
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
             <td data-title="Nome"><%=bean.getNome() %></td>
             <td data-title="Cognome"><%=bean.getCognome() %></td>
             <td data-title="Via"><%=bean.getVia() %></td>
             <td data-title="Numero"><%=bean.getNumero() %></td>
             <td data-title="Cap"><%=bean.getCap() %></td>
             <td data-title="Città"><%=bean.getCitta() %></td>
             <td data-title="Provincia"><%=bean.getProvincia() %></td>
             <td data-title="Admin"><%=bean.isAdmin() %></td>
			 <td> <a href="<%=response.encodeURL("AccountUserControl?action=delete&id=" + bean.getUsername())%>">Cancella</a>  <a href="<%=response.encodeURL("accounts/aggiorna?action=update&id=" + bean.getUsername())%>">Aggiorna</a></td>
          </tr>
      <% }
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Clienti</td>
		</tr>
	<% } %> 
       </tbody>
    </table> 
 </div>
       		
       	</div>	


</body>
</html>