import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/processa")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		// gestione della RICHIESTA
		String nome = request.getParameter("nome").toUpperCase();
		String cognome = request.getParameter("cognome").toUpperCase();
		
		//metto i valori nella sessione
		HttpSession session = request.getSession();
		session.setAttribute("NOME", nome);
		session.setAttribute("COGNOME", cognome);
		
		ServletContext app = getServletContext(); 
		RequestDispatcher req = app.getRequestDispatcher("/conferma");
		req.forward(request, response);
		return;
	}
}
