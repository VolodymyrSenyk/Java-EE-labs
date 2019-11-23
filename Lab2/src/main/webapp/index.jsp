<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.DayToShow" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<title>Timetable</title>		
	<link href="view/styles.css" rel="stylesheet">
	<style type="text/css">
		body {
			background-image: url(getBackground);
		}
	</style>
</head>
<body>
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
	<div class="header">
		Timetable
		<hr/>
		<div class="navigation">
			<form action="list" method="POST">
				<% out.print("<input type=\"hidden\" name=\"number\" value=\"" + num + "\">"); %>
				<input type="submit" name="list" value="View timetable">
			</form>
			<form action="edit" method="POST">
				<% out.print("<input type=\"hidden\" name=\"number\" value=\"" + num + "\">"); %>
				<input type="submit" name="edit" value="Edit timetable">
			</form>
			<form action="listAll" method="GET">
				<input type="submit" name="listAll" value="View all week">
			</form>
			<form action="new" method="POST">
				<input style="width: auto;" type="submit" name="new" value="Make new timetable">
			</form>
			<div class="content">
				<p align="center"><img border="5px" src="getKhPI"></p>
			</div>
		</div>
	</div>
</body>
</html>
