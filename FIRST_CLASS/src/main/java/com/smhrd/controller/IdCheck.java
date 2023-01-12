package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;

public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mem_email = request.getParameter("mem_email");
		MemDAO dao = new MemDAO();
		MemVO check = dao.search_id(mem_email);
		PrintWriter out = response.getWriter();

		if (check != null) {
			System.out.println("중복된 회원이 존재함");
			out.print("{\"idCheck\":\"NO\"}");
		} else {
			System.out.println("중복된 회원이 존재하지 않음");
			out.print("{\"idCheck\":\"OK\"}");

		}

	}

}