package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;
import com.smhrd.model.TimeVO;

public class calRemainService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		System.out.println("남은 시간 기능 요청");
		HttpSession session = request.getSession();
		int prod_num = (int) session.getAttribute("prod_num");
//		System.out.println(prod_num);

		ProdDAO dao = new ProdDAO();
		ProdVO vo = dao.selectOne(prod_num);

		Date date = vo.getProd_time();
		Date now = new Date();

		long diffHour = ((date.getTime() - now.getTime()) / 3600000) % 24; // 시 차이
		long diffMin = ((date.getTime() - now.getTime()) / 60000) % 60; // 분 차이
		long diffSec = ((date.getTime() - now.getTime()) / 1000) % 60; // 초 차이

//		System.out.print(Math.abs(diffHour) + ":");
//		System.out.print(Math.abs(diffMin) + ":");
//		System.out.println(Math.abs(diffSec));

		TimeVO tvo = new TimeVO(diffHour, diffMin, diffSec);
		ArrayList<TimeVO> tlist = new ArrayList<>();
		tlist.add(tvo);

//		for (TimeVO tmp : tlist) {
//			System.out.println(tvo.toString());
//		}

		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String result = gson.toJson(tlist);
//		System.out.println(result);
		out.print(result);
	}

}
