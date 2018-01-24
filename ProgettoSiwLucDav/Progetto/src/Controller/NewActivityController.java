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
import Model.Attivita;
import Model.Utente;
import Service.SocialStartupFacade;

@WebServlet("/NewActivityController")
public class NewActivityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(beanName="SocialStartupFacade")
	private SocialStartupFacade facade;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String nextPage = null;
		String titolo = request.getParameter("titolo");
		String testo = request.getParameter("testo");
		String url = request.getParameter("url");
		String urlImg = request.getParameter("imageUrl");
		String urlVideo = request.getParameter("videoUrl");
		
		HttpSession session = request.getSession();
		Utente u = (Utente) session.getAttribute("CurrentUser");

		try {
			Attivita attivita = new Attivita(titolo, testo, u, url, urlImg,urlVideo);
			facade.aggiungiAttivita(attivita, u);
			nextPage = "/HomePage.jsp";
		} catch (NotNullableFieldException e) {
			request.setAttribute("newAttivitaError","completare i campi titolo e testo");
			nextPage = "/NewActibity.jsp";
		}

		ServletContext application = getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher(response.encodeURL(nextPage));
		rd.forward(request, response);
	}

}
