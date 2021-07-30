package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import it.unisa.model.AccountUserBean;
import it.unisa.model.AccountUserModelDS;
import it.unisa.model.AccountUserSessione;

@WebServlet(name = "AccountUserControl", value = "/accounts/*")
public class AccountUserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountUserModelDS tmp;
	
	@Override
	public void init() throws ServletException {
		super.init();
		DataSource ds = null;
		tmp = new AccountUserModelDS(ds);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		switch(path) {
		
		case "/":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/accounts.jsp").forward(request, response);
			break;
			
		case "/accedi":   //login cliente(pagina)
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/loginCliente.jsp").forward(request, response);
			break;
			
		case "/crea":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/account.jsp").forward(request, response);
			break;
		
		case "/mostra":  //mostra info admin
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/account.jsp").forward(request, response);
			break;
		
		case "/loginAdmin":  //login admin(pagina)
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/loginAdmin.jsp").forward(request, response);
			break;
			
		case "/registrazione":
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/registrazione.jsp").forward(request, response);
			break;
		
		case "/profilo":  //mostra profilo utente
			request.getRequestDispatcher("/WEB-INF/Views/Dashboard/profilo.jsp").forward(request, response);
			break;
		default:
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Risorsa non Trovata");
			
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		
		switch(path) {
		
		case "/crea":
			break;
			
		case "/aggiorna":
			break;
			//login admin (ricerca nel db)
		case "/loginAdmin":
			request.setAttribute(back, view());
			validate(AccountUserValidator.validateSignin(request));
			AccountUserBean tmpAccount = new AccountUserBean();
			tmpAccount.seteMail(request.getParameter("e_mail"));
			tmpAccount.setPasswd(request.getParameter("passwd"));
			AccountUserBean optAccount = tmp.findAccount(tmpAccount.geteMail(),tmpAccount.getPasswd(), true);
			if(tmpAccount != null) {
				AccountUserSessione accountsessione = new AccountUserSessione(optAccount.get());
			}
			break;
		
		case "/loginCliente":  //login cliente (ricerca nel db)
			break;
			
		case "/registrati":  //registrazione cliente
			break;
			
		case "/logout":
			break;
			
		default:
			response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non Consentita");
	
		}
	}
}
