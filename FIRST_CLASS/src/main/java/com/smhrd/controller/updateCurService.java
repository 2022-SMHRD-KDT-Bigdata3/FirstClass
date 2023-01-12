package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;

public class updateCurService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int prod_num = (int) session.getAttribute("prod_num");
		
		ProdDAO dao = new ProdDAO();
		ProdVO vo = dao.selectOneProd(prod_num);
		
		ArrayList<ProdVO> list = new ArrayList<>();
		list.add(vo);
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String result = gson.toJson(list);
		out.print(result);
	}

}
