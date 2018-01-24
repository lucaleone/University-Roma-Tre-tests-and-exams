import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoadData")
public class LoadData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		List<String> prefs = new ArrayList<String>();
		prefs.add("luca");
		prefs.add("marco");
		prefs.add("coso");
		prefs.add("bla");
		request.setAttribute("prefs", prefs);	
		ServletContext application  = getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher("/MostraPrefs.jsp");
		rd.forward(request, response);
	}
}
