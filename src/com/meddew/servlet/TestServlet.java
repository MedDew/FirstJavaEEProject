package com.meddew.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meddew.beans.Coyote;

public class TestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		/*resp.setContentType("text/html");
		resp.setCharacterEncoding( "UTF-8" );
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"utf-8\" />");
		out.println("<title>Test</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>Ceci est une page générée depuis une servlet.</p>");
		out.println("</body>");
		out.println("</html>");*/
		Coyote coyote = new Coyote();
		coyote.setNom("Billy");
		coyote.setPrenom("Boy");
		//Coyote coyote3 = new Coyote();
		//coyote3.setNom("Gaz");
		//coyote3.setPrenom("Med");
		
		String auteur = req.getParameter("auteur");
		String message = "Transmission de variable OK!" + auteur;
		req.setAttribute("test", message);
		req.setAttribute("coyote", coyote);
		//req.setAttribute("coyote3", coyote3);
		
		System.out.print("Servlet Name : "+this.getServletName()); 
		this.getServletContext().getRequestDispatcher("/WEB-INF/test.jsp").forward(req, resp);
	}
 
}
