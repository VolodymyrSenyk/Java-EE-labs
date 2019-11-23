<%@ page import="model.Day" %>
<%@ page import="model.DayToShow" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
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
   		}
   		td, th {
   			border: 2px solid black;
   			min-width: 5px;
   		}
   		td.ns {
			background-color: white;
			min-width: 15px;
		}	
		td.lection {
			background-color: #FFD700;
			min-width: 15px;
		}
		td.practice {
			background-color: #9370DB;
			min-width: 15px;
		}
		td.laboratory {
			background-color: #4682B4;
			min-width: 15px;
		}
		td.sport {
			background-color: #2E8B57;
			min-width: 15px;
		}
	</style>
</head>
<body>
	<div class="header">
		Whole week
		<div class="content">
			<hr/>
			<%
					ArrayList<Day> firstWeek = (ArrayList<Day>) request.getAttribute("firstWeek");
					out.println("<b><i><p align=\"center\">First week</i></b>");
			%>
			<table align="center">
					<tr>
						<th colspan="3">Monday</th>
						<td style="border: 0px"></td>
						<th colspan="3">Tuesday</th>
						<td style="border: 0px"></td>
						<th colspan="3">Wednesday</th>
						<td style="border: 0px"></td>
						<th colspan="3">Thursday</th>
						<td style="border: 0px"></td>
						<th colspan="3">Friday</th>
					</tr>
					<%
					for(int j=0; j<DayToShow.maxNumOfPairs(firstWeek); j++) {
						out.println("<tr>");
						for(int i=0; i<5; i++) {
							if(j < firstWeek.get(i).getPairs().size()) {
								String type = firstWeek.get(i).getPairs().get(j).getTypeOfPair();
								if(type.equals("Lection")) {
									out.print("<td class=\"lection\">");
									out.println(firstWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"lection\">");
									out.println(firstWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"lection\">");
									out.println(firstWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								else if(type.equals("Practice")) {
									out.print("<td class=\"practice\">");
									out.println(firstWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"practice\">");
									out.println(firstWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"practice\">");
									out.println(firstWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								else if(type.equals("Laboratory")) {
									out.print("<td class=\"laboratory\">");
									out.println(firstWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"laboratory\">");
									out.println(firstWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"laboratory\">");
									out.println(firstWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								else if(type.equals("Sport")) {
									out.print("<td class=\"sport\">");
									out.println(firstWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"sport\">");
									out.println(firstWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"sport\">");
									out.println(firstWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								else {
									out.print("<td class=\"ns\">");
									out.println(firstWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"ns\">");
									out.println(firstWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"ns\">");
									out.println(firstWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								out.println("<td style=\"border: 0px\"></td>");
							}
							else if(j!=0) {
								out.println("<td style=\"border: 0px\"></td>");
								out.println("<td style=\"border: 0px\"></td>");
								out.println("<td style=\"border: 0px\"></td>");
								out.println("<td style=\"border: 0px\"></td>");
							}
							else if(j==0) {
								out.println("<td class=\"ns\" align=\"center\" colspan=\"3\">No pairs</td>");
								out.println("<td style=\"border: 0px\"></td>");
							}
						}
						out.println("</tr>");
					}
				/*	else {
						out.println("<tr>");
						out.println("<td align=\"center\" colspan=\"4\">No pairs</td>");
						out.println("</tr>");
					}*/
				%>
			</table>
			<hr/>
			<%
					ArrayList<Day> secondWeek = (ArrayList<Day>) request.getAttribute("secondWeek");
					out.println("<b><i><p align=\"center\">Second week</i></b>");
			%>
			<table align="center">
					<tr>
						<th colspan="3">Monday</th>
						<td style="border: 0px"></td>
						<th colspan="3">Tuesday</th>
						<td style="border: 0px"></td>
						<th colspan="3">Wednesday</th>
						<td style="border: 0px"></td>
						<th colspan="3">Thursday</th>
						<td style="border: 0px"></td>
						<th colspan="3">Friday</th>
					</tr>
					<%
					for(int j=0; j<DayToShow.maxNumOfPairs(secondWeek); j++) {
						out.println("<tr>");
						for(int i=0; i<5; i++) {
							if(j < secondWeek.get(i).getPairs().size()) {
								String type = secondWeek.get(i).getPairs().get(j).getTypeOfPair();
								if(type.equals("Lection")) {
									out.print("<td class=\"lection\">");
									out.println(secondWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"lection\">");
									out.println(secondWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"lection\">");
									out.println(secondWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								else if(type.equals("Practice")) {
									out.print("<td class=\"practice\">");
									out.println(secondWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"practice\">");
									out.println(secondWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"practice\">");
									out.println(secondWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								else if(type.equals("Laboratory")) {
									out.print("<td class=\"laboratory\">");
									out.println(secondWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"laboratory\">");
									out.println(secondWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"laboratory\">");
									out.println(secondWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								else if(type.equals("Sport")) {
									out.print("<td class=\"sport\">");
									out.println(secondWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"sport\">");
									out.println(secondWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"sport\">");
									out.println(secondWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								else {
									out.print("<td class=\"ns\">");
									out.println(secondWeek.get(i).getPairs().get(j).getTime() + "</td>");
									out.print("<td class=\"ns\">");
									out.println(secondWeek.get(i).getPairs().get(j).getName() + "</td>");
									out.print("<td class=\"ns\">");
									out.println(secondWeek.get(i).getPairs().get(j).getPlace() + "</td>");
								}
								out.println("<td style=\"border: 0px\"></td>");
							}
							else if(j!=0) {
								out.println("<td style=\"border: 0px\"></td>");
								out.println("<td style=\"border: 0px\"></td>");
								out.println("<td style=\"border: 0px\"></td>");
								out.println("<td style=\"border: 0px\"></td>");
							}
							else if(j==0) {
								out.println("<td class=\"ns\" align=\"center\" colspan=\"3\">No pairs</td>");
								out.println("<td style=\"border: 0px\"></td>");
							}
						}
						out.println("</tr>");
					}
				%>
			</table>
			<p/>
			<hr/>
			<div class="navigation">
				<%
			    	int num;
			    	Calendar calendar = Calendar.getInstance();
			        int day = calendar.get(Calendar.DAY_OF_WEEK);
			        switch(day) {
			            case Calendar.MONDAY:
			                num = 11;
			                break;
			            case Calendar.TUESDAY:
			                num = 12;
			                break;
			            case Calendar.WEDNESDAY:
			                num = 13;
			                break;
			            case Calendar.THURSDAY:
			                num = 14;
			                break;
			            case Calendar.FRIDAY:
			                num = 15;
			                break;
			            default:
			            	num = 11;
			        }
			    %>
				<form action="index.jsp">
					<input type="submit" name="main" value="Return to main page">
				</form>
				<form action="list" method="POST">
					<% out.print("<input type=\"hidden\" name=\"number\" value=\"" + num + "\">"); %>
					<input type="submit" name="list" value="View timetable">
				</form>
				<form action="edit" method="POST">
					<% out.print("<input type=\"hidden\" name=\"number\" value=\"" + num + "\">"); %>
					<input type="submit" name="edit" value="Edit timetable">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
