package it.unisa.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MainContext implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		Utility.print("Startup web application");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		Utility.print("Shutdown web application");
	}
}
