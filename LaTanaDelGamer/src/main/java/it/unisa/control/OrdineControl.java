package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name="OrdineControl", value = "/ordini/*")
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		switch (path) {
			case "/": 
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/ordini.jsp").forward(request, response);
				break;
				
			case "/mostra":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/ordini.jsp").forward(request, response);
				break;
				
			case "/cerca":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
				break;

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		HttpSession session=request.getSession();
		
		switch (path) {
		case "/": 
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/ordini.jsp").forward(request, response);
			break;
			
		case "/mostra":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/ordini.jsp").forward(request, response);
			break;
			
		case "/cerca":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
			break;

	}
	}

}
