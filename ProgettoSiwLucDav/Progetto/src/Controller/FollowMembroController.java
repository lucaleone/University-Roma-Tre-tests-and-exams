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
import Model.*;
import Service.SocialStartupFacade;


@WebServlet("/FollowMembroController")
public class FollowMembroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB(beanName = "SocialStartupFacade")
	private SocialStartupFacade facade;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String emailMembroDaSeguire = request.getParameter("membroDaSeguire");

		HttpSession session = request.getSession();
		Utente u = (Utente) session.getAttribute("CurrentUser");
		facade.aggiungiFollowingMembro(u, emailMembroDaSeguire);

		ServletContext application = getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher(response
				.encodeURL("/HomePage.jsp"));
		rd.forward(request, response);
	}
}
