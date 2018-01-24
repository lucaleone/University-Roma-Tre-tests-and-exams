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
import javax.servlet.http.HttpSession;

import Exceptions.NotNullableFieldException;
import Exceptions.UtenteGiaEsistenteException;
import Model.Membro;
import Service.SocialStartupFacade;

@WebServlet("/MembroSignupController")
public class MembroSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB(beanName="SocialStartupFacade")
	private SocialStartupFacade facade;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {		
		String nextPage = null;
				
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String avatar = request.getParameter("urlImg");
		String annoDiNascita = request.getParameter("annoDiNascita");
		String sito = request.getParameter("sito");
		String facebook = request.getParameter("facebook");
		String twitter = request.getParameter("twitter");
		String linkedIn = request.getParameter("linkedIn");
		ServletContext application = getServletContext();
		try {
			Membro m = new Membro(nome,cognome,email,password,avatar, annoDiNascita, sito,facebook,twitter,linkedIn);
			facade.aggiungiUtente(m);
			HttpSession session=request.getSession();
			session.setAttribute("CurrentUser", m);
			application.setAttribute("Comunita", facade.GetComunita());
			nextPage="/HomePage.jsp";
		} catch (NotNullableFieldException e) {
			request.setAttribute("StartupSignUpError","completare tutti i campi contrassegnati da *");
			nextPage = "/SignUp.jsp";
		} catch (UtenteGiaEsistenteException e) {
			
			request.setAttribute("StartupSignUpError","l'email inserita è già stata utilizzata");
			nextPage = "/SignUp.jsp";
		}
		
		RequestDispatcher rd = application.getRequestDispatcher(response.encodeURL(nextPage));
		rd.forward(request, response);
		return;
	}
}
