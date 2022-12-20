<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<%@ page errorPage ="exceptionNoProductId.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 	href="./resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		String sessionId = (String) session.getAttribute("sessionId");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
		System.out.println("id");
	%>
	<div class="container">
		<div class="row" align="center">
		<%@ include file="dbconn.jsp"%>
			<%
				int unitprice = 0;
				String sql = "select * from product where p_id ='" + id +"'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class ="col-md-5">
				<img src="upload/<%=rs.getString("p_fileName")%>" style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p><b>분류</b> : <%=rs.getString("p_category")%>
				<p><b>재고 수</b> : <%=rs.getString("p_unitsinstock")%>
				<%
					int money = rs.getInt("p_UnitPrice");
				%>
				<h4><%=String.format(" %,d", money) %>원</h4>
				
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post" >
				<c:choose>
               		<c:when test="${!empty sessionId}">
                 		<a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a> 
               		</c:when>
               	</c:choose>
					<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
				</form>
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
