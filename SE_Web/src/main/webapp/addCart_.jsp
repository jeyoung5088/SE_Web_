<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
	String id = request.getParameter("id");
	String sessionId = request.getParameter("sessionId");
	
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
}
	
	String sql = "select * from cart where p_id = '" + id +"' and p_userid ='" + sessionId + "'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		rs.getString("p_id");
		
		String sql1 = "update cart set p_unitsinstock = p_unitsinstock + 1 where p_id = '" +id + "' and p_userid ='" + sessionId +"'";
		pstmt = conn.prepareStatement(sql1);
		rs = pstmt.executeQuery();
	
	}
	if (rs == null) {
		String sql2 = "select * from product where p_id = '" + id + "'";
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String p_name = rs.getString("p_name");
			String p_unitprice = rs.getString("p_unitprice");
			String p_unitsinstock = rs.getString("p_unitsinstock");
			
			String sql1 = "insert into cart(p_id, p_userid, p_name, p_unitprice, p_unitsinstock) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			pstmt.setString(2, sessionId);
			pstmt.setString(3, p_name);
			pstmt.setString(4, p_unitprice);
			pstmt.setString(5, "1");
			pstmt.executeUpdate();
			
			rs = pstmt.executeQuery();
			//rs.close();
		}
		
	}
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
 	
 	response.sendRedirect("products.jsp");
%>
