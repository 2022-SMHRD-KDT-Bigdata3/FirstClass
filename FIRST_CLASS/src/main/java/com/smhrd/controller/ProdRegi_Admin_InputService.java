package com.smhrd.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;

public class ProdRegi_Admin_InputService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("charset=UTF-8");

		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int cate_num = Integer.parseInt(request.getParameter("cate_num"));

		String prod_time_temp = request.getParameter("prod_time");
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
		Date prod_time = null;
		try {
			prod_time = SDF.parse(prod_time_temp);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String prod_opinion = request.getParameter("prod_opinion");
		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
		int prod_cur = Integer.parseInt(request.getParameter("prod_cur"));
		int prod_imme = Integer.parseInt(request.getParameter("prod_imme"));
		String prod_img = request.getParameter("prod_img");

		ProdVO vo = new ProdVO(prod_num, cate_num, prod_time, prod_opinion, prod_price, prod_cur, prod_imme,prod_img);

		ProdDAO dao = new ProdDAO();
		
		int res = dao.ProdRegi_Admin_Input(vo);
		
		if(res>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		response.sendRedirect("ProdRegi_Admin.jsp");
	}

}
