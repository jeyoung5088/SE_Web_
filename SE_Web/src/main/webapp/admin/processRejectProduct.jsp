<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>


<%
	

	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	
	String reason = multi.getParameter("reason");
	String id = multi.getParameter("id");
	
	System.out.println(reason+ "|"+id);
	
	
	
    String sql = "select * from judgeproduct where p_accept = 0 and p_id = '" + id+ "'";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    while (rs.next()) {
 	
	
    String sql1 ="update judgeproduct set p_accept = 1, p_rejectreason = ? where p_id = '" + id+ "'";
    pstmt = conn.prepareStatement(sql1);
    pstmt.setString(1, reason);
    pstmt.executeUpdate();
    
    }
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

 	response.sendRedirect("../products.jsp");
	
%>