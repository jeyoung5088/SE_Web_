<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>


<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "C:\\upload"; //�� ���ø����̼ǻ��� ���� ���
	String encType = "utf-8"; //���ڵ� Ÿ��
	int maxSize = 5 * 1024 * 1024; //�ִ� ���ε�� ������ ũ��5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String userid = multi.getParameter("userid");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);

	String sql = "insert into judgeproduct(p_id, p_userid, p_name, p_unitprice, p_description, p_category, p_manufacturer, p_unitsinstock, p_condition, p_filename) values(?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, userid);
	pstmt.setString(3, name);
	pstmt.setInt(4, price);
	pstmt.setString(5, description);
	pstmt.setString(6, category);
	pstmt.setString(7, manufacturer);
	pstmt.setLong(8, stock);
	pstmt.setString(9, condition);
	pstmt.setString(10, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("products.jsp");
%>
