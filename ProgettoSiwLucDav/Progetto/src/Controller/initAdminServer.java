package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.SocialStartupFacade;

@WebServlet("/initAdminServer")
public class initAdminServer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(beanName = "SocialStartupFacade")
	private SocialStartupFacade facade;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		facade.initSocialStartup();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"ISO-8859-1\" />");
		out.println("<title>mostra parametri</title>");
		out.println("</head>");
		out.println("<body style=\"background: rgb(35, 35, 35); color: white\">");
		out.println("<h1>Server inizializzato!</h1>");
		out.println("</body>\n</html> ");
	}

}
