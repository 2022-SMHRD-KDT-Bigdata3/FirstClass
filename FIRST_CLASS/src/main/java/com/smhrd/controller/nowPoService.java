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
import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;

public class nowPoService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemVO info = (MemVO) session.getAttribute("info");
		
		int mem_num = info.getMem_num();
		
		MemDAO dao = new MemDAO();
		MemVO vo = dao.selectOne(mem_num);
		
		System.out.println("포인트 보유량 : "+ vo.getMem_po());
		
		ArrayList<MemVO> list = new ArrayList<>();
		list.add(vo);
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String result = gson.toJson(list);
		out.print(result);
		
	}

}
