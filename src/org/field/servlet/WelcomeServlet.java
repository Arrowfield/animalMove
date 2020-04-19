package org.field.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class WelcomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("doGet...");
	}
	protected void doPost(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("doPost...");
	}
	
}
