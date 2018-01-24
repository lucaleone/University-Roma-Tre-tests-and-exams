package Controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Exceptions.UtenteNonEsistenteException;
import Model.Utente;
import Service.SocialStartupFacade;

@WebServlet("/ProfilePageController")
public class ProfilePageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(beanName="SocialStartupFacade")
	private SocialStartupFacade facade;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {			
		String email = request.getParameter("emailProfile");
		
		try {
			Utente utente = (Utente)facade.GetUser(email);
			request.setAttribute("ProfileUser", utente);			
		} catch (UtenteNonEsistenteException e) {
		}
		
		ServletContext application = getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher(response.encodeURL("/ProfilePage.jsp"));
		rd.forward(request, response);		
	}
}
