package it.unisa.control;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import it.unisa.model.AccountUserModelDS;
import it.unisa.model.CategoriaBean;
import it.unisa.model.CategoriaModelDS;
import it.unisa.model.ProdottoBean;
import it.unisa.model.ProdottoModelDS;
import it.unisa.utils.Utility;


@WebServlet(name = "ProdottoControl", value = "/prodotti/*")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		) //per mandare file binari
public class ProdottoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String SAVE_DIR = "immaginiDB";

	public void init() {
		// Get the file location where it would be stored
		SAVE_DIR = getServletConfig().getInitParameter("file-upload");
	}
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		switch (path) {
			case "/": 
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/prodotti.jsp").forward(request, response);
				break;
				
			case "/mostra":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/prodotto.jsp").forward(request, response);
				break;
				
			case "/crea":			
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/prodotto.jsp").forward(request, response);
				break;
				
			case "/cerca":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
				break;
				
			case "/ricercaAvanzata":
				request.getRequestDispatcher("/WEB-INF/Views/Dashboard/cerca.jsp").forward(request, response);
				break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (request.getPathInfo() != null) ? request.getPathInfo() : "/";
		HttpSession session=request.getSession();
		
		switch(path) {
			case "/crea":{
				DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
	
				ProdottoModelDS model = new ProdottoModelDS(ds);
			
				
				try {	
							
					ProdottoBean prodotto = new ProdottoBean();
					
					
					prodotto.setNome(request.getParameter("nome"));
					prodotto.setPrezzo(Float.parseFloat(request.getParameter("prezzo")));
					prodotto.setDescrizione(request.getParameter("descrizione"));
					prodotto.setCasaproduttrice(request.getParameter("casaproduttrice"));
					prodotto.setQuantita(Integer.parseInt(request.getParameter("quantita")));
					Part filePart = request.getPart("copertina");
					String nomeFile=Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
					
					
					prodotto.setCopertina(nomeFile);
					prodotto.setnomeCategoria(request.getParameter("nome_categoria"));
					
					model.doSave(prodotto);
					request.setAttribute("message", "Account " + prodotto.getNome() + " AGGIUNTO");
					
				} catch(SQLException e) {
					Utility.print(e);
					
					request.setAttribute("error", e.getMessage());
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index.jsp");
					dispatcher.forward(request, response);
					return;
				}				
				
				SAVE_DIR="immaginiDB";
				String savePath = request.getServletContext().getRealPath("") + File.separator + SAVE_DIR;
				
				System.out.println("path di salvataggio:" + savePath);
				File fileSaveDir = new File(savePath);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdir();
				}

				String message = "upload =\n";
				if (request.getParts() != null && request.getParts().size() > 0) {
					for (Part part : request.getParts()) {
						String fileName = extractFileName(part);
						if (fileName != null && !fileName.equals("")) {
							part.write(savePath + File.separator + fileName);
							System.out.println(savePath + File.separator + fileName);
							message = message + fileName + "\n";
						} else {
							request.setAttribute("error2", "Errore: Bisogna selezionare almeno un file");

						}
					}
				}

				request.setAttribute("message2", message);

				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
		
		
			}
		
		
		}
	}
	
	
	private String extractFileName(Part part) {
		// content-disposition: form-data; name="file"; filename="file.txt"
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
