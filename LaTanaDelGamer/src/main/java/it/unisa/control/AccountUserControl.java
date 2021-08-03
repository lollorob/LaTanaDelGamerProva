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
		HttpSession session=request.getSession();
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
			
		
		case "/logout":
			session.invalidate();
            response.sendRedirect(request.getContextPath()+"/accounts/loginAdmin");
            
			break;	
			
		default:
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Risorsa non Trovata");
			
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		HttpSession session=request.getSession();
		AccountUserBean user = new AccountUserBean();
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		switch(path) {
		
		case "/crea":
			break;
			
		case "/aggiorna":
			break;
			
		case "/loginAdmin":  //login admin (ricerca nel db)
		
		    String username = (String) session.getAttribute("username");
		    String passwd = (String) session.getAttribute("passwd");
		   
			
            if (username==null && passwd==null ) { //SE PRIMA VOLTA
                username = request.getParameter("username");
                passwd = request.getParameter("passwd");
                session.setAttribute("username", username);
                session.setAttribute("passwd", passwd);
                
                
            } 
            AccountUserModelDS accountmodel = new AccountUserModelDS(ds);
            try {
            	
				user = accountmodel.doRetrieveAccountUserByEmailPassword(username, passwd);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
            if (user !=null && user.isAdmin()) { //SE ADMIN
            	 	OrdineModelDS ordine = new OrdineModelDS(ds);
            	 	CategoriaModelDS categoria = new CategoriaModelDS(ds);
            	 	AccountUserModelDS utente = new AccountUserModelDS(ds);
            	 	ProdottoModelDS prodotto = new ProdottoModelDS(ds);
            	 	
                    session.setAttribute("adminRoles", true);
                    session.setAttribute("nomeAdmin",user.getNome());
                   
                    Collection<OrdineBean> ord;
					try {
						ord = ordine.doRetrieveAll("");
	                    request.setAttribute("numeroOrdini",ord.size());
	                    
	                    Collection<CategoriaBean> cat = categoria.doRetrieveAll("");
	                    request.setAttribute("numeroCategorie",cat.size());
	                    
	                    Collection<AccountUserBean> ute = utente.doRetrieveAll("");
	                    request.setAttribute("numeroClienti",ute.size());
	                    
	                    Collection<ProdottoBean> pro = prodotto.doRetrieveAll("");
	                    request.setAttribute("numeroProdotti",pro.size());
	                    
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
                    request.getRequestDispatcher("/WEB-INF/Views/Dashboard/home.jsp").forward(request, response);
                    
            }else{ // ALTRIMENTI NON SEI AUTORIZZATO
                session.removeAttribute("username");
                session.removeAttribute("passwd");
                session.setAttribute("failedAdmin",true);
                session.removeAttribute("adminRoles");
                response.sendRedirect(request.getContextPath() + "/accounts/loginAdmin");     //alert da aggiungere
            }
            
		
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
