<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<%@ page errorPage ="exceptionNoProductId.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 	href="./resources/css/bootstrap.min.css" />
<title>��ǰ �� ����</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("��ǰ�� ��ٱ��Ͽ� �߰��Ͻðڽ��ϱ�?")) {
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
			<h1 class="display-3">��ǰ ����</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row" align="center">
		<%@ include file="dbconn.jsp"%>
			<%
				String sql = "select * from judgeproduct where p_accept = 0";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="c:/upload/<%=rs.getString("p_fileName")%>" style="width: 100%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_UnitPrice")%>��
				<p>
					<a href="./adminJudgeProduct.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button"> �� ���� &raquo;></a>
			</div>
			<%
			//	}
				
			//if (rs != null)
			//	rs.close();
 			//if (pstmt != null)
 			//	pstmt.close();
 			//if (conn != null)
			//	conn.close();
			%>
		</div>
		<hr>
	</div>
	<div class="container">
		<div class="row">
			<div class ="col-md-5">
				<img src="c:/upload/<%=rs.getString("p_filename")%>" style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><b>��ǰ �ڵ� : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p><b>������</b> : <%=rs.getString("p_manufacturer")%>
				<p><b>�з�</b> : <%=rs.getString("p_category")%>
				<p><b>��� ��</b> : <%=rs.getString("p_unitsinstock")%>
				<h4><%=rs.getString("p_unitprice")%>��</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
				<!-- ��ǰ �ֹ�, ��ٱ���, ��ǰ ����� accept, reject ������ �ٲٴ� ���� �ʿ� -->
				
					<a href="#" class="btn btn-success" onclick="addToCart()"> ��ǰ ���� &raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning"> ��ǰ ���� &raquo;</a>
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
