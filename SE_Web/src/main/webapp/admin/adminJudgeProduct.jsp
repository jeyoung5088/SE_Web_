<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<%@ page errorPage ="exceptionNoProductId.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 	href="../resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToDB() {
		if (confirm("상품을 등록하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
	function rejectToDB() {
		if (confirm("거절 사유를 확인해주세요.")) {
			document.reason.submit();
		} else {		
			document.reason.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row" align="center">
		<%@ include file="../dbconn.jsp"%>
			<%
				String sql = "select * from judgeproduct where p_accept = 0 and p_id ='" + id +"'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			
			 <div class ="col-md-5">
				<img src="/upload/<%=rs.getString("p_fileName")%>" style="width: 100%" />
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
				
				<!-- 상품 주문, 장바구니, 상품 목록을 accept, reject 등으로 바꾸는 쿼리 필요 -->
				<p><form name="addForm" action="processAddProduct.jsp?id=<%=rs.getString("p_id")%>" method="post" enctype ="multipart/form-data">
					<a href="#" class="btn btn-success" onclick="addToDB()"> 상품 승인 &raquo;</a> 
				</form>
				<form name="reason" action="processRejectProduct.jsp?id=<%=rs.getString("p_id")%>" method="post" enctype ="multipart/form-data">
					<textarea rows="2" cols="80" id = "reason" name= "reason" class= "form-control"></textarea>
					<a class="btn btn-warning" type = "submit" onclick="rejectToDB()"> 상품 거절 &raquo;</a>
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
	<jsp:include page="../footer.jsp" />
</body>
</html>
