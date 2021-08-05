package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.util.ArrayList;

import it.unisa.model.AccountUserBean;
import it.unisa.model.AccountUserModelDS;
import it.unisa.model.CategoriaBean;
import it.unisa.model.CategoriaModelDS;
import it.unisa.model.OrdineBean;
import it.unisa.model.OrdineModelDS;
import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDS;




@WebServlet(name = "AccountUserControl", value = "/accounts/*")
public class AccountUserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountUserModelDS tmp;
	
	
	@Override
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
	
		switch(path) {
		
		case "/crea":
			break;
			
		case "/aggiorna":
			break;
			
		case "/loginAdmin":  //pagina login Admin
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/loginAdmin.jsp").forward(request,response);
			break;
		
		case "/loginCliente":  //login cliente (ricerca nel db)
			break;
			
		case "/registrati":  //registrazione cliente
			break;
			
		
			
		default:
			response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non Consentita");
	
		}
	}
}
