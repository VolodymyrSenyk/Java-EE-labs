package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import model.DayToShow;
import model.Day;
import model.Pair;

@WebServlet(name = "ServletSave", urlPatterns = {"/save"})
public class ServletSave extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Day day = new Day();
		day.setDayOfTheWeek(DayToShow.getInstance().getName());
		ArrayList<Pair> pairs = new ArrayList<>();
		int counter = Integer.parseInt(request.getParameter("counter"));
		for(int i=0; i<counter; i++) {
			if(!(request.getParameter("time"+i).equals("") && request.getParameter("name"+i).equals("")
			 && request.getParameter("teacher"+i).equals("") && request.getParameter("place"+i).equals(""))) {
				Pair pair = new Pair(request.getParameter("time"+i),
					request.getParameter("name"+i),
					request.getParameter("teacher"+i),
					request.getParameter("place"+i),
					request.getParameter("typeOfPair"+i));
				pairs.add(pair);
			}
		}
		day.setPairs(pairs);

		Day.writeXML(getServletContext(), day, DayToShow.getInstance().getName());

		request.setAttribute("number", DayToShow.getInstance().getNumber());
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("list");
		requestDispatcher.forward(request, response);
	}
}
