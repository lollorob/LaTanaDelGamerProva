package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
			
		case "/loginAdmin":  //login admin (ricerca nel db)
		{
		    String username = request.getParameter("username");
		    String passwd = request.getParameter("password");
		 
		    AccountUserSessione loginBean = new AccountUserSessione();
		 
		    loginBean.setUsername(username);
		    loginBean.setPassword(passwd);
		 
		   AccountUserModelDS loginDao = new AccountUserModelDS();
		 
		    try
		    {
		        String userValidate = loginDao.authenticateUser(loginBean);
		 
		        if(userValidate.equals("Admin_Role"))
		        {
		            System.out.println("Admin's Home");
		 
		            HttpSession session = request.getSession(); //Creating a session
		            session.setAttribute("Admin", userName); //setting session attribute
		            request.setAttribute("userName", userName);
		 
		            request.getRequestDispatcher("/JSP/Admin.jsp").forward(request, response);
		        }
		        else if(userValidate.equals("Editor_Role"))
		        {
		            System.out.println("Editor's Home");
		 
		            HttpSession session = request.getSession();
		            session.setAttribute("Editor", userName);
		            request.setAttribute("userName", userName);
		 
		            request.getRequestDispatcher("/JSP/Editor.jsp").forward(request, response);
		        }
		        else if(userValidate.equals("User_Role"))
		        {
		            System.out.println("User's Home");
		 
		            HttpSession session = request.getSession();
		            session.setMaxInactiveInterval(10*60);
		            session.setAttribute("User", userName);
		            request.setAttribute("userName", userName);
		 
		            request.getRequestDispatcher("/JSP/User.jsp").forward(request, response);
		        }
		        else
		        {
		            System.out.println("Error message = "+userValidate);
		            request.setAttribute("errMessage", userValidate);
		 
		            request.getRequestDispatcher("/JSP/Login.jsp").forward(request, response);
		        }
		    }
		    catch (IOException e1)
		    {
		        e1.printStackTrace();
		    }
		    catch (Exception e2)
		    {
		        e2.printStackTrace();
		    }
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
