package com.board.mini.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class URIController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String prefix="/WEB-INF";
    private static final String suffix=".jsp";
    private static String getForwardURI(HttpServletRequest request) {
    	return prefix+request.getRequestURI()+suffix;
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd= request.getRequestDispatcher(getForwardURI(request));
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
