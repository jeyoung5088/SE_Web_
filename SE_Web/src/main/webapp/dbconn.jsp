<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 

<%
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String url = "jdbc:oracle:thin:@192.168.0.16:1521:xe";
		String user = "MALLDB";
		String password = "12345";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);

		
	} catch (SQLException ex) {
		out.println("데이터베이스 연결에 실패했습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
		
%>