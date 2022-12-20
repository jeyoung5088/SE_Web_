<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	    String cartId = session.getId();
	
		String shipping_cartId = "";
	    String shipping_name = ""; // 구매자 이름
	    String shipping_country = ""; //나라
	    String shipping_zipCode = ""; // 우편번호
	    String shipping_addressName = ""; // 주소
	
	    Cookie[] cookies = request.getCookies();
	
	if (cookies != null) {
	        for (int i = 0; i < cookies.length; i++) {
	            Cookie thisCookie = cookies[i];
	            String n = thisCookie.getName();
	            if (n.equals("Shipping_cartId"))
	                shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	            if (n.equals("Shipping_name"))
	                shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	            if (n.equals("Shipping_country"))
	                shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	            if (n.equals("Shipping_zipCode"))
	                shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	            if (n.equals("Shipping_addressName"))
	                shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	        }
	    }
	
	String sql = "insert into sellchk(s_cartid, s_name, s_country, s_zipcode, s_addname) values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, shipping_cartId);
	pstmt.setString(2, shipping_name);
    pstmt.setString(3, shipping_country);
    pstmt.setString(4, shipping_zipCode);
    pstmt.setString(5, shipping_addressName);
    pstmt.executeUpdate();
   
    if (pstmt != null)
        pstmt.close();
    if (conn != null)
       conn.close();
    
	response.sendRedirect("./thankCustomer.jsp");
    %>