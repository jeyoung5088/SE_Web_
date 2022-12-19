<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ include file="../dbconn.jsp" %>

<%

	request.setCharacterEncoding("UTF-8");
	
	
	String id = request.getParameter("id");
	String sessionId = (String) session.getAttribute("sessionId");
	
	
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
}
	
	String sql = "select * from product where p_id = '" + id+ "'";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    while (rs.next()) {
 	
    	String p_id = rs.getString("p_id");
    	String p_name = rs.getString("p_name");
    	String p_unitprice = rs.getString("p_unitprice");
    
	

	String sql1 = "insert into cart2(p_id, p_userid, p_name, p_unitprice) values(?,?,?,?)";
    pstmt = conn.prepareStatement(sql1);
    pstmt.setString(1, p_id);
    pstmt.setString(2, sessionId);
    pstmt.setString(3, p_name);
    pstmt.setString(4, p_unitprice);
    pstmt.executeUpdate();
	
    
    }
    response.sendRedirect("product.jsp?id=" + id);
%>
