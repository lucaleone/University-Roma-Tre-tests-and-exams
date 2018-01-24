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

import Model.Membro;
import Model.Startup;
import Model.Utente;
import Service.SocialStartupFacade;


@WebServlet("/ModificaUtenteController")
public class ModificaUtenteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(beanName="SocialStartupFacade")
	private SocialStartupFacade facade;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String avatar = request.getParameter("urlImg");
		String sitoWeb = request.getParameter("sito");
		String facebook = request.getParameter("facebook");
		String twitter = request.getParameter("twitter");
		String linkedIn = request.getParameter("linkedIn");
		
		Utente u = (Utente)(request.getSession().getAttribute("CurrentUser"));
		if(u instanceof Startup){
			String descBreve = request.getParameter("descBreve");
			String desc = request.getParameter("desc");
			String motto = request.getParameter("motto");
			String dataCreazione = request.getParameter("dataCreazione");
			facade.modificaStartup((Startup) u, dataCreazione, descBreve, desc, avatar, motto, sitoWeb, facebook, twitter, linkedIn);
		}
		else{
			String biografia = request.getParameter("biografia");
			String dataNascita = request.getParameter("annoNascita");
			facade.modificaMembro((Membro)u, avatar, biografia, dataNascita, sitoWeb, facebook, twitter, linkedIn);
		}
		String next=("/ProfilePageController?emailProfile="+u.getEmail());
		ServletContext application = getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
