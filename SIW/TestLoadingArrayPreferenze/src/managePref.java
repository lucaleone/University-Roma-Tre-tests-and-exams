import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/managePref")
public class managePref extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String q = request.getQueryString();
		response.setContentType("text/html");

		// preparo un oggetto su cui scrivere la risposta
		PrintWriter out = response.getWriter();

		// scrivo il corpo
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"ISO-8859-1\" />");
		out.println("<title>mostra parametri</title>");
		out.println("</head>");
		out.println("<body style=\"background: rgb(35, 35, 35); color: white\">");
		out.println("<h1>Nuova Preferenza:</h1>");
		out.println("<ul>");
		out.println("<li>Nome: <b>" + q + "</b></li>");
		out.println("</ul>");
		out.println("</body>\n</html> ");
	}
}
