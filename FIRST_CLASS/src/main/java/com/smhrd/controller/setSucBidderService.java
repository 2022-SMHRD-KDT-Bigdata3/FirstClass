package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemDAO;
import com.smhrd.model.MemVO;
import com.smhrd.model.ProdDAO;
import com.smhrd.model.ProdVO;
import com.smhrd.model.TrdDAO;
import com.smhrd.model.TrdVO;

public class setSucBidderService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int bidder_id = Integer.parseInt(request.getParameter("bidder_id"));
		int bid_price = Integer.parseInt(request.getParameter("bid_price"));
		int seller_id = Integer.parseInt(request.getParameter("seller_id"));
		
		ProdDAO dao = new ProdDAO();
		ProdVO vo = dao.selectOneProd(prod_num);

		// 낙찰자 업데이트할 VO(update vo)
		ProdVO upvo = new ProdVO(prod_num, 0, bidder_id);
		int res = dao.updateBidder(upvo);

		if (res > 0) {
			System.out.println("낙찰자 등록 성공");
		} else {
			System.out.println("낙찰자 등록 실패");
		}
		
		
		
		MemDAO mdao = new MemDAO();
		
		// 낙찰자 포인트 업데이트할 VO
		int mem_num = bidder_id;
		int mem_po = bid_price;
		MemVO mvo = new MemVO(mem_num, mem_po);
		int mres = mdao.updatePoint(mvo);
		
		if(mres>0) {
			System.out.println("낙찰자 포인트 업데이트 성공");
		} else {
			System.out.println("낙찰자 포인트 업데이트 실패");
		}
		
		// 구매자 정보 trd 테이블에 저장할 vo
		
		MemVO mvo1 = mdao.selectOne(mem_num);
		String receiver_addr = mvo1.getMem_addr();
		String receiver_name = mvo1.getMem_name();
		String receiver_phone = mvo1.getMem_ph();
		
		TrdVO tvo = new TrdVO(receiver_addr, receiver_name, receiver_phone, prod_num);
		TrdDAO tdao = new TrdDAO();
		int tres = tdao.insertInfo(tvo);
		if(tres>0) {
			System.out.println("낙찰자 정보 업데이트 성공");
		} else {
			System.out.println("낙찰자 정보 업데이트 실패");			
		}
		// 판매자 포인트 업데이트할 VO
		mem_num=seller_id;
		MemVO mvo2 = new MemVO(mem_num, mem_po);
		int mres2 = mdao.updatePoint2(mvo2);
		
		if(mres2>0) {
			System.out.println("판매자 포인트 업데이트 성공");
		} else {
			System.out.println("판매자 포인트 업데이트 실패");
		}
		
		
		
		response.sendRedirect("AuctionConfirm.jsp");
	}

}
