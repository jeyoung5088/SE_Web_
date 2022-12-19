<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	String cartId = session.getId();
	String sessionId = (String) session.getAttribute("sessionId");
%>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<!-- <td align="right"><a href="./pay.jsp" class="btn btn-success">주문하기</a></td> -->
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				
				<%@ include file="dbconn.jsp"%>
				<%
					int sum = 0;
					String sql = "select p_id, p_name, p_unitprice, sum(p_unitprice) as total, count(*) as cnt from cart2 where p_userid = '"+ sessionId +"' group by p_id, p_name, p_unitprice";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
					
				%>
				
				<tr>
					<td><%=rs.getString("p_name")%></td>
					<td><%=rs.getString("p_unitprice")%></td>
					<td><%=rs.getString("cnt")%></td>
					<td><%=rs.getString("total")%></td>
					
					<% sum = sum + rs.getInt("total");%>
					<td><a href="./removeCart.jsp?id=<%=rs.getString("p_id")%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
					request.setAttribute("totalPrice", sum);
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>