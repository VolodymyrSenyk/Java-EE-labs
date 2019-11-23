package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "ServletBackground", urlPatterns = {"/getBackground"})
public class ServletBackground extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpg");
		ServletContext sc = getServletContext();
		InputStream is = sc.getResourceAsStream("images/background.jpg");
		BufferedImage bi = ImageIO.read(is);
		OutputStream os = response.getOutputStream();
		ImageIO.write(bi, "jpg", os);
    }
}
