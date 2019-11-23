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
		th {
			border-collapse: collapse;
		}
	</style>
</head>
<body>
	<div class="buttonLeft">
		<form action="edit" method="POST">
			<%
			/*	int num = 11;
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
				int num = DayToShow.getInstance().getNumber();//Integer.parseInt(request.getParameter("number"));
				num = DayToShow.prev(num);
				out.print("<input type=\"hidden\" name=\"number\" value=\"" + num + "\">");
			%>
			<input type="image" name="submit" src="getPrev">
		</form>
	</div>
	<div class="header">
		<%
			out.print(request.getAttribute("dayOfTheWeek"));
			int counter = (Integer) request.getAttribute("numOfPairs");
		%>
		<div class="content">
			<hr/>
			<div class="checker">
				<form action="edit" method="POST">
						<%
							out.print("<input type=\"hidden\" name=\"number\" value=\"" + DayToShow.getInstance().getNumber() + "\">");
							if(DayToShow.getInstance().getNumber()<16) {
								out.print("<input class=\"active\" type=\"submit\" name=\"numOfWeek\" value=\"First\">");
								out.print("<input type=\"submit\" name=\"numOfWeek\" value=\"Second\">");
							}
							else {
								out.print("<input type=\"submit\" name=\"numOfWeek\" value=\"First\">");
								out.print("<input class=\"active\" type=\"submit\" name=\"numOfWeek\" value=\"Second\">");
							}
						%>
				</form>
				<hr/>
				<form action="edit" method="POST">
					<p style="font-size: 15px;">Enter number of pairs</p>
					<%
					//	if(request.getParameter("number") != null)
					//		num = Integer.parseInt(request.getParameter("number"));
						out.print("<input type=\"number\" name=\"numOfPairs\" value=\"" + counter + "\">");
						out.print("<input type=\"hidden\" name=\"number\" value=\"" + DayToShow.getInstance().getNumber() /*Integer.parseInt(request.getParameter("number"))*/ + "\">");
					%>
					<input type="submit" name="submit" value="Confirm">
				</form>
				<hr/>
				<div class="content" style="text-align: center;">
					<form action="save" method="POST">
						<table align="center">
							<tr>
								<th>Time</th>
								<th>Name</th>
								<th>Teacher</th>
								<th>Type of pair</th>
								<th>Place</th>
							</tr>
							<%
								out.print("<input type=\"hidden\" name=\"number\" value=\"" + DayToShow.getInstance().getNumber()/* Integer.parseInt(request.getParameter("number")) */+ "\">");
								out.print("<input type=\"hidden\" name=\"counter\" value=\"" + counter + "\">");
								Day day = (Day) request.getAttribute("day");
								for(int i=0; i<counter; i++) {
									out.println("<tr>");
									if(day.getPairs().size() > i) {
										out.println("<td><input type=\"time\" name=\"time"+i+"\" value=\""+ day.getPairs().get(i).getTime() +"\">");
										out.println("<td><input type=\"text\" name=\"name"+i+"\" value=\""+ day.getPairs().get(i).getName() +"\">");
										out.println("<td><input type=\"text\" name=\"teacher"+i+"\" value=\""+ day.getPairs().get(i).getTeacher() +"\">");
											out.println("<td><select size=\"1\" name=\"typeOfPair"+i+"\">");
		    									out.println("<option");
		    									if(day.getPairs().get(i).getTypeOfPair().equals("Type of pair not stated"))
		    										out.print(" selected");
		    									out.println(" value=\"Type of pair not stated\">Type of pair not stated</option>");
		    									out.println("<option");
		    									if(day.getPairs().get(i).getTypeOfPair().equals("Lection"))
		    										out.print(" selected");
		    									out.println(" value=\"Lection\">Lection</option>");
		    									out.println("<option");
		    									if(day.getPairs().get(i).getTypeOfPair().equals("Practice"))
		    										out.print(" selected");
		    									out.println(" value=\"Practice\">Practice</option>");
		    									out.println("<option");
		    									if(day.getPairs().get(i).getTypeOfPair().equals("Laboratory"))
		    										out.print(" selected");
		    									out.println(" value=\"Laboratory\">Laboratory</option>");
		    									out.println("<option");
		    									if(day.getPairs().get(i).getTypeOfPair().equals("Sport"))
		    										out.print(" selected ");
		    									out.println(" value=\"Sport\">Sport</option>");
	    								out.println("</select>");
										out.println("<td><input type=\"text\" name=\"place"+i+"\" value=\""+ day.getPairs().get(i).getPlace() +"\">");
									}
									else {
										out.println("<td><input type=\"time\" name=\"time"+i+"\">");
										out.println("<td><input type=\"text\" name=\"name"+i+"\">");
										out.println("<td><input type=\"text\" name=\"teacher"+i+"\">");
										out.println("<td><select size=\"1\" name=\"typeOfPair"+i+"\">");
		    									out.println("<option value=\"Type of pair not stated\">Type of pair not stated</option>");
		    									out.println("<option value=\"Lection\">Lection</option>");
		    									out.println("<option value=\"Practice\">Practice</option>");
		    									out.println("<option value=\"Laboratory\">Laboratory</option>");
		    									out.println("<option value=\"Sport\">Sport</option>");	
										out.println("<td><input type=\"text\" name=\"place"+i+"\">");
									}
									out.println("</tr>");
								}
							%>
							<tr>
								<td align="center" colspan="5"><input type="submit" name="submit" value="Save"></td>
							</tr>
						</table>
					</form>
					<hr/>
					<div class="navigation">
						<form action="index.jsp">
							<input type="submit" name="main" value="Return to main page">
						</form>
						<form action="list" method="POST">
							<% out.print("<input type=\"hidden\" name=\"number\" value=\"" + DayToShow.getInstance().getNumber()/* Integer.parseInt(request.getParameter("number")) */+ "\">"); %>
							<input type="submit" name="list" value="View timetable">
						</form>
						<form action="listAll" method="GET">
							<input type="submit" name="listAll" value="View all week">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="buttonRight">
		<form action="edit" method="POST">
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
				int num2 = DayToShow.getInstance().getNumber();//Integer.parseInt(request.getParameter("number"));
				num2 = DayToShow.next(num2);
				out.print("<input type=\"hidden\" name=\"number\" value=\"" + num2 + "\">");
			%>
			<input type="image" name="submit" src="getNext">
		</form>
	</div>
</body>
</html>
