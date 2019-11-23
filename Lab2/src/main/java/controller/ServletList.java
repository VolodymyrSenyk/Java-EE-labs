package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.WebServlet;
import model.DayToShow;
import model.Day;

@WebServlet(name = "ServletList", urlPatterns = {"/list"})
public class ServletList extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		if(request.getParameter("number") != null)
			DayToShow.getInstance().setNumber(Integer.parseInt(request.getParameter("number")));
		if(request.getParameter("numOfWeek") != null)
			if(request.getParameter("numOfWeek").equals("First"))
				if(DayToShow.getInstance().getNumber()>15)
					DayToShow.getInstance().setNumber(DayToShow.getInstance().getNumber()-10);
		if(request.getParameter("numOfWeek") != null)
			if(request.getParameter("numOfWeek").equals("Second"))
				if(DayToShow.getInstance().getNumber()<20)
					DayToShow.getInstance().setNumber(DayToShow.getInstance().getNumber()+10);

		Day day = Day.readXML(getServletContext(), DayToShow.getInstance().getName());

		request.setAttribute("number", DayToShow.getInstance().getNumber());
		request.setAttribute("dayOfTheWeek", DayToShow.getNameToShow(DayToShow.getInstance().getName()));
		request.setAttribute("day", day);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
		requestDispatcher.forward(request, response);
	}
}
