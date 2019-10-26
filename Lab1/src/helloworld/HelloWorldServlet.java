package helloworld;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/HelloWorld")
public class HelloWorldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter writer = response.getWriter()) {
            writer.println("<h2 align='center'>Hello, web world!</h2>");
            writer.println("<form action='Authorization'>");
            writer.println("<p align='center'><input type='submit' value='Go to authorization'/>");
            writer.println("</form>");
            writer.println("<p align='right'>Сеник В. Н.</p>");
            writer.println("<p align='right'>КН-37г</p>");
        }
    }
}
