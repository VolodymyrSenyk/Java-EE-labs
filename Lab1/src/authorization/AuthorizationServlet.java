package authorization;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Authorization")
public class AuthorizationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String LOGIN = "Volodymyr";
	private static final String PASSWORD = "password";
    
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("authorization.html");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
			try (PrintWriter writer = response.getWriter()) {
			if (request.getParameter("login").equals(LOGIN)
					&& request.getParameter("password").equals(PASSWORD)) {
				response.sendRedirect("resume.html");
			} else {
				writer.println("<p align='center'><a href='authorization.html'>Incorrect login or password. Try again</a></p>");
			}
		}
	}

}
