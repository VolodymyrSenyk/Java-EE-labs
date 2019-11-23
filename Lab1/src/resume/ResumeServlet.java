package resume;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/Platforms")
public class ResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter writer = response.getWriter()) {
            writer.println("<table border=\"1\" align=\"center\" style=\"width:60%;\">");
            writer.println("<tr>");
            writer.println("<td align ='center'><b>Platform</b></td>");
            writer.println("<td align ='center'><b>Languages</b></td>");
            writer.println("<td align ='center'><b>Experience</b></td>");
            writer.println("</tr>");
            for (Platform platform : getFilledPlatforms()) {
            	writer.println("<tr>");
                writer.println("<td>"+platform.name+"</td><td>"+platform.languages+"</td><td>"+platform.experience+"</td>");
                writer.println("</tr>");
            }
        }
    }
	
	private static List<Platform> getFilledPlatforms() {
		List<Platform> platforms = new ArrayList<Platform>();
		platforms.add(new Platform("Android", "Java, Kotlin", "1 year"));
		platforms.add(new Platform("Web", "Java, PHP", "1 year"));
		platforms.add(new Platform("Desktop", "Java, C#", "1 year"));
		return platforms;
	}
	
	private static class Platform {
		private String name;
		private String languages;
		private String experience;
		
		public String getName() {
			return name;
		}

		public String getLanguages() {
			return languages;
		}

		public String getExperience() {
			return experience;
		}
		
		public Platform(String name, String languages, String experience) {
			this.name = name;
			this.languages = languages;
			this.experience = experience;
		}
	}
	
}
