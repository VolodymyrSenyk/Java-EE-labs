package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import model.DayToShow;
import model.Day;

@WebServlet(name = "ServletListAll", urlPatterns = {"/listAll"})
public class ServletListAll extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ArrayList<Day> firstWeek = new ArrayList<>();
		for(int i=11; i<16; i++) {
			Day day = Day.readXML(getServletContext(), DayToShow.getInstance().getName(i));
			firstWeek.add(day);
		}
		ArrayList<Day> secondWeek = new ArrayList<>();
		for(int i=21; i<26; i++) {
			Day day = Day.readXML(getServletContext(), DayToShow.getInstance().getName(i));
			secondWeek.add(day);
		}

		request.setAttribute("firstWeek", firstWeek);
		request.setAttribute("secondWeek", secondWeek);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/listAll.jsp");
		requestDispatcher.forward(request, response);
	}
}
