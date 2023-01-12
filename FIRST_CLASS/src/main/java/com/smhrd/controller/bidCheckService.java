package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BidDAO;
import com.smhrd.model.BidVO;
import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;

public class bidCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		int prod_num = (int) session.getAttribute("prod_num");
		int bid_price = Integer.parseInt(request.getParameter("bid"));

		System.out.println("상품번호 :" + prod_num);
		System.out.println("입찰희망가 : " + bid_price);

		BidDAO bdao = new BidDAO();
		ProdDAO pdao = new ProdDAO();

		ArrayList<BidVO> bidCheckList = bdao.bidCheck(prod_num);
		ProdVO prodvo = pdao.selectOneProd(prod_num);

		int prod_cur = prodvo.getProd_cur();

		PrintWriter out = response.getWriter();

//		if(bidCheck.get(0).getBid_price()<bid_price || bidCheck.get(0)==null) {
//			System.out.println("입찰 가능!");
//			out.print("{\"bidCheck\":\"OK\"}");
//		}else {			
//			System.out.println("입찰 불가...");
//			out.print("{\"bidCheck\":\"NO\"}");
//		}
		if (bidCheckList.size()==0) {
			if (bid_price > prod_cur) {
//				System.out.println("입찰 가능!");
				out.print("{\"bidCheck\":\"OK\"}");
			}else {
//				System.out.println("입찰 불가...");
				out.print("{\"bidCheck\":\"NO\"}");				
			}
		} else {
			if (bidCheckList.get(0).getBid_price() < bid_price) {
//				System.out.println("입찰 가능!");
				out.print("{\"bidCheck\":\"OK\"}");
			} else {
//				System.out.println("입찰 불가...");
				out.print("{\"bidCheck\":\"NO\"}");
			}
		}

	}

}
