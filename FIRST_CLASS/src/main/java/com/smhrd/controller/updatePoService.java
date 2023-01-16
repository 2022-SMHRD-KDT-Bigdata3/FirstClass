package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BidDAO;
import com.smhrd.model.BidVO;
import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;

public class updatePoService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		MemVO info = (MemVO) session.getAttribute("info");
		int prod_num = (int) session.getAttribute("prod_num");
		int mem_num = info.getMem_num();
		BidDAO dao = new BidDAO();
		BidVO vo = new BidVO(prod_num, 0, mem_num);

		BidVO maxBidvo = dao.selectMaxBid(vo);

		int bid_price = Integer.parseInt(request.getParameter("bid_price"));
		System.out.println("업데이트포에 전달된 입찰가 : " + bid_price);

		// 실제 감소될 포인트
		int realDecPo = 0;

		if (maxBidvo != null) {
			int prevMaxBid = maxBidvo.getBid_price();
			System.out.println("이전 최대 입찰가 : " + prevMaxBid);
			realDecPo = bid_price - prevMaxBid;
		} else {
			realDecPo = bid_price;
		}
		
		session.setAttribute("realDecPo", realDecPo);

	}

}
