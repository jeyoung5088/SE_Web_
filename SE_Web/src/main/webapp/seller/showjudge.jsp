<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!-- 심사중인걸 판매자에게 보여줌 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">심사신청 물품</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			<%@ include file="../dbconn.jsp"%>
			<%
				String sql = "select * from judgeproduct where p_accept <= 1 and p_userid = '" + sessionId + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="/upload/<%=rs.getString("p_fileName")%>" style="width: 100%">
				<h3><%=rs.getString("p_name")%></h3>
				
				<% if (rs.getInt("p_accept") == 0 ) { %>
            		<p> 심사중 </p>
				<%} else if( rs.getInt("p_accept") == 1 ) {  %>
            		<p> 거절 </p>
				<%} %>
				<p><%=rs.getString("p_rejectreason") %>  			
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