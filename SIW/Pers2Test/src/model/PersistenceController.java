package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PersistenceController")
public class PersistenceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(beanName = "pFacade")
	private productFacade productsFacade;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String n = request.getParameter("nome");
		String p = request.getParameter("prezzo");
		productsFacade.createProds();
		//List<Product> pp = productsFacade.getAll();

//		// preparo il tipo (HTML)
//		response.setContentType("text/html");
//		// preparo un oggetto su cui scrivere la risposta
//		PrintWriter out = response.getWriter();
//		// scrivo il corpo
//		out.println("<!DOCTYPE html>");
//		out.println("<html>");
//		out.println("<head>");
//		out.println("<meta charset=\"ISO-8859-1\" />");
//		out.println("<title>mostra parametri</title>");
//		out.println("</head>");
//		out.println("<body style=\"background: rgb(35, 35, 35); color: white\">");
//		out.println("<h1>Nuovo Prodotto:</h1>");
//		out.println("<ul>");
//		for(Product item : pp)
//			out.println("<li>Nome: <b>" + item + "</b></li>");
//		out.println("</ul>");
//		out.println("</body>\n</html> ");
	}
}
