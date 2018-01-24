import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/conferma")
public class ConfermaDati extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>"); 
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"ISO-8859-1\" />");
		out.println("<title>Conferma Dati</title>");
		out.println("</head>");
		out.println("<body style=\"background: rgb(35, 35, 35); color: white\">");
		out.println("<h1>Nuova Persona:</h1>");
		out.println("<ul>");
		out.println("<li>Nome: <b>"+session.getAttribute("NOME")+"</b></li>");
		out.println("<li>Cognome: <b>"+session.getAttribute("COGNOME")+"</b></li>");
		out.println("</ul>");
		out.println("<h2>Confermi?</h2>");
		out.println("<ul>");
		out.println("<li><a href=\"mostraDati\">Yes</a></li>");
		out.println("<li><a href=\"inserimento.html\">Back</a></li>");
		out.println("</ul>");
		out.println("</body>\n</html> ");
	}
}
