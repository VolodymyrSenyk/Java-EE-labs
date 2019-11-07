package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "ServletNext", urlPatterns = {"/getNext"})
public class ServletNext extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/png");
		ServletContext sc = getServletContext();
		InputStream is = sc.getResourceAsStream("images/next.png");
		BufferedImage bi = ImageIO.read(is);
		OutputStream os = response.getOutputStream();
		ImageIO.write(bi, "png", os);
    }
}
