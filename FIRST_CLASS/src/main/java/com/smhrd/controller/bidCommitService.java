package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.BidDAO;
import com.smhrd.model.BidVO;
import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;

public class bidCommitService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int bid_price = Integer.parseInt(request.getParameter("bid_price"));
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));

		// 컬럼명이랑 맞춰주기
		int prod_cur = bid_price;

		BidVO vo = new BidVO(prod_num, bid_price, mem_num);
		BidDAO bdao = new BidDAO();

//		System.out.println(vo.toString());

		ProdDAO pdao = new ProdDAO();
		ProdVO pvo = new ProdVO(prod_num, prod_cur, 0);
		ProdVO immeProd = pdao.selectOneProd(prod_num);

		int res = 0;

		res = bdao.bidInsert(vo);
		
		// 입찰한 가격만큼 보유 포인트에서 차감하기

		PrintWriter out = response.getWriter();
		if (res > 0) {
			System.out.println("입찰 성공!");
			int Cres = pdao.updateCur(pvo);
			if (Cres > 0) {
				System.out.println("현재가 업데이트 성공!");
				if (immeProd.getProd_imme() == bid_price) {
					int ires = pdao.aucClose(prod_num);
					if (ires > 0) {
						System.out.println("즉시구매 성공!");
					} else {						
						System.out.println("즉시구매 실패...");
					}
				}
			} else {
				System.out.println("현재가 업데이트 실패...");
			}
			out.print("{\"bidCommit\":\"OK\"}");
		} else {
			System.out.println("입찰 실패...");
			out.print("{\"bidCommit\":\"NO\"}");
		}

	}

}
