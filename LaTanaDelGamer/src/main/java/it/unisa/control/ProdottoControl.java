package it.unisa.control;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

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
		DataSource ds = (DataSource)getServletContext().getAttribute("DataSource");
		HttpSession session=request.getSession();

		switch(path) {
			case "/crea":{
				String message;
			
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
					
					
					SAVE_DIR="immaginiDB";
					String savePath = request.getServletContext().getRealPath("") + File.separator + SAVE_DIR;
					
					File fileSaveDir = new File(savePath);
					if (!fileSaveDir.exists()) {
						fileSaveDir.mkdir();
					}

					message = "upload =\n";
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
				
				
				request.setAttribute("message2", message);
				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
			}
			break;
			
			case "/dettagli":
			{	
				ProdottoModelDS model = new ProdottoModelDS(ds);
				try {
					String id = request.getParameter("id");
					int chiave=Integer.parseInt(id);
					
					request.removeAttribute("prodotto");
					session.setAttribute("prodotti", model.doRetrieveByKey(chiave));
					
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
			}
				break;
			
		
			case "/elimina" :{
				
				String id = request.getParameter("id");
				int chiave=Integer.parseInt(id);
				ProdottoModelDS model= new ProdottoModelDS(ds);
				ProdottoBean bean= new ProdottoBean();
				try {
					bean = model.doRetrieveByKey(chiave);
					
					if (bean != null) {
						model.doDelete(bean);
					}
					
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
			}
			
				break;
			
			case "/aggiorna" :{
				
				String message;
				
				ProdottoModelDS model = new ProdottoModelDS(ds);
				ProdottoBean prodotto = new ProdottoBean();
				
				try {	
							
					
					String id = request.getParameter("id");
					int chiave=Integer.parseInt(id);

					prodotto.setId_prodotto(chiave);
					prodotto.setNome(request.getParameter("nome"));
					prodotto.setPrezzo(Float.parseFloat(request.getParameter("prezzo")));
					prodotto.setDescrizione(request.getParameter("descrizione"));
					prodotto.setCasaproduttrice(request.getParameter("casaproduttrice"));
					prodotto.setQuantita(Integer.parseInt(request.getParameter("quantita")));
					Part filePart = request.getPart("copertina");
					String nomeFile=Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
					
					
					SAVE_DIR="immaginiDB";
					String savePath = request.getServletContext().getRealPath("") + File.separator + SAVE_DIR;
					
					File fileSaveDir = new File(savePath);
					if (!fileSaveDir.exists()) {
						fileSaveDir.mkdir();
					}

					message = "upload =\n";
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
					prodotto.setCopertina(nomeFile);
					prodotto.setnomeCategoria(request.getParameter("nome_categoria"));
					model.doUpdate(prodotto);
					request.setAttribute("message", "Prodotto" + prodotto.getNome() + " AGGIUNTO");
					
				}  catch (SQLException e) {
					e.printStackTrace();
			}
				response.sendRedirect(request.getContextPath() + "/Dashboard/prodotti");
	}
			break;
		
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
