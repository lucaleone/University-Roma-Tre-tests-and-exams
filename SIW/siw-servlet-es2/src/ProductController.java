import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// gestione della RICHIESTA

		// leggo i parametri
		String nome = request.getParameter("nome").toUpperCase();
		String prezzo = request.getParameter("prezzo");
		String desc = request.getParameter("desc");
		String code = request.getParameter("code");

		// leggo (alcune) intestazioni http della richiesta
		 String address = (String)request.getRemoteAddr();
		 String host = (String)request.getRemoteHost();
		 String userAgent = request.getHeader("User-Agent");

		// gestione della RISPOSTA

		// preparo il tipo (HTML)
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
		out.println("<h1>Nuovo Prodotto:</h1>");
		out.println("<ul>");
		out.println("<li>Nome: <b>" + nome + "</b></li>");
		out.println("<li>Prezzo: <b>" + prezzo + "</b></li>");
		out.println("<li>Descrizione: <b>" + desc + "</b></li>");
		out.println("<li>Codice: <b>" + code + "</b></li>");
		out.println("</ul>");
		out.println("<h2>Altri dati relativi alla richiesta</h2>");
		out.println("<br />IP: <b>" + address + "</b>");
		out.println("<br />User Agent: <b>" + userAgent + "</b>");
		out.println("</body>\n</html> ");
	}
}
