<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<script type="text/javascript">
   tmp = tmp.replace(/&nbsp;/gi,"");//공백제거 
</script>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
		<%@ include file="dbconn.jsp"%>
			<%
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					
				%>
				<div class="col-md-4" style ="width: 31%">
				<img src="upload/<%=rs.getString("p_fileName")%>" style="display: block; max-width: 100%; " />
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<%
					int money = rs.getInt("p_UnitPrice");
				%>
				<p> <%=String.format(" %,d", money)%>원
				<p>
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
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
	<jsp:include page="footer.jsp" />
</body>
</html>