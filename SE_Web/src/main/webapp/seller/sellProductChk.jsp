<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>들어온 주문 목록</title>
</head>
<%

	String sessionId = (String) session.getAttribute("sessionId");
%>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">들어온 주문 목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<%@ include file="../dbconn.jsp"%>
			<%
				String sql = "select * from sellchk";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<tr>
					<td>주문자 이름: <%=rs.getString("s_name")%></td>
					<td>배송 주소: <%=rs.getString("s_country")%> <%=rs.getString("s_addname") %></td>
					<td>우편번호: <%=rs.getString("s_zipcode")%></td>
				</tr>
			</div>
			
			<%
				}
				if (rs != null)
					rs.close();
	 			if (pstmt != null)
	 				pstmt.close();
	 			if (conn != null)
					conn.close();
	 			%>
		</div>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>