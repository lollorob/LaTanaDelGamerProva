<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="/WEB-INF/Views/PagineComuni/head.jsp"> 
 	<jsp:param name="title" value ="Prodotti | Admin"/>
 	<jsp:param name="style" value = "prodotti.css"/>
 	<jsp:param name="script" value = "dashboard.js"/>
 </jsp:include>
 
  <% if(session.getAttribute("adminRoles") == null){	
	  response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin"); 
	}%> 
 
  <%
 	Collection<?> prodotti = (Collection<?>)session.getAttribute("listaProdotti");
 
 	if(prodotti == null) {
 		System.out.println("Collection Prodotti NULL");
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
		<caption><a href="/LaTanaDelGamer/prodotti/crea">Aggiungi Prodotto</a></caption>
	 	<div id="tabella"> 
    <table> 
       <thead> 
          <tr> 
        <th>Id-Prodotto</th>
        <th>Nome</th>
        <th>Prezzo</th>
        <th>Descrizione</th>
        <th>Casa Produttrice</th>
        <th>Quantità</th>
        <th>Categoria</th>
          </tr> 
               <%
		if(prodotti != null && prodotti.size() > 0) {
			
			Iterator<?> it = prodotti.iterator();
			while(it.hasNext()) {
				ProdottoBean bean = (ProdottoBean)it.next();
			
	%>
       </thead> 
       <tbody> 
          <tr>
             <td data-title="Id-Prodotto"><%=bean.getId_prodotto() %></td> 
             <td data-title="Nome"><%=bean.getNome() %></td> 
             <td data-title="Prezzo"><%=bean.getPrezzo() %></td> 
             <td data-title="Descrizione"><%=bean.getDescrizione() %></td> 
             <td data-title="Casa Produttrice"><%=bean.getCasaProduttrice() %></td> 
             <td data-title="Quantità"><%=bean.getQuantita()%></td> 
             <td data-title="Categoria"><%=bean.getnomeCategoria() %></td> 
          </tr>
      <%		}
		} else { %>
		<tr>
			<td colspan="15">Non ci sono Prodotti</td>
		</tr>
	<% } %> 
       </tbody>
    </table> 
 </div>
       		
       	</div>	


</body>
</html>