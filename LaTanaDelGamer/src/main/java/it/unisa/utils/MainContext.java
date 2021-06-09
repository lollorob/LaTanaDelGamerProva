package it.unisa.utils;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

@WebListener
public class MainContext implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		Utility.print("Startup web application");
		
		ServletContext context = sce.getServletContext();
		
		DataSource ds = null;
		try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java.comp/env");
		
		ds = (DataSource) envCtx.lookup("jdbc/la_tana_del_gamer");
		} catch(NamingException e) {
			Utility.print(e);
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		Utility.print("Shutdown web application");
	}
}
