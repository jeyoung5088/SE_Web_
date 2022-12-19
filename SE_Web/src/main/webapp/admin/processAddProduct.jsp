<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>


<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String filename = "";
	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	System.out.println(id);
	
    String sql = "select * from judgeproduct where p_accept = 0 and p_id = '" + id+ "'";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    while (rs.next()) {
 	
    	String p_id = rs.getString("p_id");
    	String p_userid = rs.getString("p_userid");
    	String p_name = rs.getString("p_name");
    	String p_unitprice = rs.getString("p_unitprice");
    	String p_description = rs.getString("p_description");
    	String p_category = rs.getString("p_category");
    	String p_unitsinstock = rs.getString("p_unitsinstock");
    	String p_filename = rs.getString("p_filename");
    
	

	String sql1 = "insert into product(p_id, p_userid, p_name, p_unitprice, p_description, p_category, p_unitsinstock, p_filename) values(?,?,?,?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql1);
    pstmt.setString(1, p_id);
    pstmt.setString(2, p_userid);
    pstmt.setString(3, p_name);
    pstmt.setString(4, p_unitprice);
    pstmt.setString(5, p_description);
    pstmt.setString(6, p_category);
    pstmt.setString(7, p_unitsinstock);
    pstmt.setString(8, p_filename);
    pstmt.executeUpdate();
	
    String sql2 ="update judgeproduct set p_accept = 2 where p_id = '" + id+ "'";
    pstmt = conn.prepareStatement(sql2);
    pstmt.executeUpdate();
    
    }
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("../products.jsp");
%>