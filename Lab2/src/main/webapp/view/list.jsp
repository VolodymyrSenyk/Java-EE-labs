<%@ page import="model.Day" %>
<%@ page import="model.DayToShow" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>Timetable</title>			
	<link href="view/styles.css" rel="stylesheet">
	<style type="text/css">
		body {
			background-image: url(getBackground);
		}
		table {
    		width: 80%;
    		border-collapse: collapse;
    		border: 3px solid black;
   		}
   		td, th {
   			border: 2px solid black;
   		}
	</style>
</head>
<body>
	<div class="buttonLeft">
		<form action="list" method="POST">
			<%
				/*int num = 11;
				if(request.getParameter("number") != null)
					num = Integer.parseInt(request.getParameter("number"));
				switch(num) {
					case 11:
						num = 15;
						break;
					case 21:
						num = 25;
						break;
					default:
						num -= 1;
				}*/
				int num = DayToShow.getInstance().getNumber();// Integer.parseInt(request.getParameter("number"));
				num = DayToShow.prev(num);
				out.print("<input type=\"hidden\" name=\"number\" value=\"" + num + "\">");
			%>
			<input type="image" name="submit" src="getPrev">
		</form>
	</div>
	<div class="header">
		<% out.print(request.getAttribute("dayOfTheWeek")); %>
		<div class="content">
			<hr/>
			<div class="checker">
				<form action="list" method="POST">
						<%
							out.print("<input type=\"hidden\" name=\"number\" value=\"" + DayToShow.getInstance().getNumber()/*Integer.parseInt(request.getParameter("number"))*/ + "\">");
					//		out.print(Integer.parseInt(request.getParameter("number")));
							if(DayToShow.getInstance().getNumber()<16) {
					//		if(Integer.parseInt(request.getParameter("number"))<16) {
								out.print("<input class=\"active\" type=\"submit\" name=\"numOfWeek\" value=\"First\">");
								out.print("<input type=\"submit\" name=\"numOfWeek\" value=\"Second\">");
							}
							else {
								out.print("<input type=\"submit\" name=\"numOfWeek\" value=\"First\">");
								out.print("<input class=\"active\" type=\"submit\" name=\"numOfWeek\" value=\"Second\">");
							}
						%>
				</form>
				<table align="center">
					<%
						Day day = (Day) request.getAttribute("day");
						if(day.getPairs().size() != 0) {
							%>
								<tr>
									<th>Time</th>
									<th>Name</th>
									<th>Teacher</th>
									<th>Type of pair</th>
									<th>Place</th>
								</tr>
							<%
							for(int i=0; i<day.getPairs().size(); i++) {
								/*
								В tomcat7 используется java1.6, а использование строк в switch case доступно только с java1.7
								switch(day.getPairs().get(i).getTypeOfPair()) {
									case "Тип пары не указан":
										out.println("<tr>");
										break;
									case "Лекция":
										out.println("<tr class=\"lection\">");
										break;
									case "Практика":
										out.println("<tr class=\"lection\">");
										break;
									case "Лабораторная":
										out.println("<tr class=\"laboratory\">");
										break;
									case "Физкультура":
										out.println("<tr class=\"sport\">");
										break;
									default:
										out.println("<tr>");
								}
								*/
								String type = day.getPairs().get(i).getTypeOfPair();
								if(type.equals("Lection"))
									out.println("<tr class=\"lection\">");
								else if(type.equals("Practice"))
									out.println("<tr class=\"practice\">");
								else if(type.equals("Laboratory"))
									out.println("<tr class=\"laboratory\">");
								else if(type.equals("Sport"))
									out.println("<tr class=\"sport\">");
								else
									out.println("<tr class=\"ns\">");
								out.println("<td>" + day.getPairs().get(i).getTime() + "</td>");
								out.println("<td>" + day.getPairs().get(i).getName() + "</td>");
								out.println("<td>" + day.getPairs().get(i).getTeacher() + "</td>");
								out.println("<td>" + day.getPairs().get(i).getTypeOfPair() + "</td>");
								out.println("<td>" + day.getPairs().get(i).getPlace() + "</td>");
								out.println("</tr>");
							}
						}
						else {
							out.println("<tr>");
							out.println("<td align=\"center\" colspan=\"4\">There are no pairs at that day of the week!</td>");
							out.println("</tr>");
						}
					%>
				</table>
				<hr/>
				<div class="navigation">
					<form action="index.jsp">
						<input type="submit" name="main" value="Return to main page">
					</form>
					<form action="edit" method="POST">
						<% out.print("<input type=\"hidden\" name=\"number\" value=\"" + DayToShow.getInstance().getNumber()/*Integer.parseInt(request.getParameter("number"))*/ + "\">"); %>
						<input type="submit" name="edit" value="Edit timetable">
					</form>
					<form action="listAll" method="GET">
						<input type="submit" name="listAll" value="View all week">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="buttonRight">
		<form action="list" method="POST">
			<%
				/*	int num2 = 11;
				if(request.getParameter("number") != null)
					num2 = Integer.parseInt(request.getParameter("number"));
				switch(num2) {
					case 15:
						num2 = 11;
						break;
					case 25:
						num2 = 21;
						break;
					default:
						num2 += 1;
			}*/
				int num2 = DayToShow.getInstance().getNumber();// Integer.parseInt(request.getParameter("number"));
				num2 = DayToShow.next(num2);
				out.print("<input type=\"hidden\" name=\"number\" value=\"" + num2 + "\">");
			%>
			<input type="image" name="submit" src="getNext">
		</form>
	</div>
</body>
</html>
