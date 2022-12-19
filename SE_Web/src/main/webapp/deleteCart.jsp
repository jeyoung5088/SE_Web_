<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="../dbconn.jsp" %>

<%

	request.setCharacterEncoding("UTF-8");
	
	
	String id = request.getParameter("id");
	String sessionId = (String) session.getAttribute("sessionId");
	String cartid = request.getParameter("cartId");
	/*
	if(id ==null || id.trim().equals("")) {
	response.sendRedirect("cart.jsp");
	return;
	}
	*/
	
	String sql = "delete from cart2 where p_userid = '" + sessionId + "'";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	
	//session.invalidate();
	
	response.sendRedirect("cart.jsp");
%>