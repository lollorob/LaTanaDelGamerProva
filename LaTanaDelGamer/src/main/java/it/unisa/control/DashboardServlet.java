package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name= "DashboardServlet" , value="/Dashboard/*")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		switch(path) {
		case "/home":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/home.jsp").forward(request, response);
			break;
		case "/prodotti":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/prodotti.jsp").forward(request, response);
			break;
		default:
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Risorsa non Trovata");
			
		}	
	}
}
