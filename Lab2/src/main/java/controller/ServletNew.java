package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.WebServlet;
import model.DayToShow;

@WebServlet(name = "ServletNew", urlPatterns = {"/new"})
public class ServletNew extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		File file;
		ServletContext sc = getServletContext();
		for(int i=11, j=21; i<16; i++, j++) {
			file = new File(sc.getRealPath("weeks/") + DayToShow.getName(i)+".xml");
			file.delete();
			file = new File(sc.getRealPath("weeks/") + DayToShow.getName(j)+".xml");
			file.delete();
		}

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit");
		requestDispatcher.forward(request, response);
	}
}
