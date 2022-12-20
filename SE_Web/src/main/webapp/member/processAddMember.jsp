<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="/dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameterValues("birthmm")[0];
	String day = request.getParameter("birthdd");
	String birth = year + "/" + month + "/" + day;
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String usertype = request.getParameter("usertype");

	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String sql="select * from member where id='" + id + "'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	String tmpid = null;
	rs.next();
		tmpid = rs.getString("id");
		System.out.println(tmpid);
    	if (tmpid != null){
	%>
		<script>
			alert("중복 아이디가 존재합니다.");
			history.back();
		</script>
		
	<% 
	}else{
	%>
		
		<sql:setDataSource var="dataSource"
		url="jdbc:oracle:thin:@192.168.0.16:1521:xe"
		driver="oracle.jdbc.driver.OracleDriver" user="MALLDB" password="12345" />

		<sql:update dataSource="${dataSource}" var="resultSet">
		   INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		   <sql:param value="<%=id%>" />
			<sql:param value="<%=password%>" />
			<sql:param value="<%=name%>" />
			<sql:param value="<%=gender%>" />
			<sql:param value="<%=birth%>" />
			<sql:param value="<%=mail%>" />
			<sql:param value="<%=phone%>" />
			<sql:param value="<%=address%>" />
			<sql:param value="<%=timestamp%>" />
			<sql:param value="<%=usertype %>" />
		</sql:update>
		
		<c:if test="${resultSet>=1}">
			<c:redirect url="resultMember.jsp?msg=1" />
		</c:if>
		
	<%	
		//response.sendRedirect("addMember.jsp");
	
	}
	%>
	

	
<%-- </body>
</html>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@192.168.0.16:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="MALLDB" password="12345" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
   <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=birth%>" />
	<sql:param value="<%=mail%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=timestamp%>" />
	<sql:param value="<%=usertype %>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>

 --%>