package com.meddew.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;

import com.meddew.beans.Coyote;

public class TestServletElOnly extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		//String nom = req.getParameter("nom");
		String message = "Hello valeur provenant d'une servlet";
		req.setAttribute("test", message);
		
		com.meddew.beans.Coyote coyote = new Coyote();
		coyote.setNom("Med");
		coyote.setPrenom("Gaz");
		req.setAttribute("coyote", coyote);
		
		String[] arr = {"Un", "Deux", "Trois"};
		req.setAttribute("arr", arr);
		
		
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/test_el_only.jsp").forward(req, resp);
	}
}
