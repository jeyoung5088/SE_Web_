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
		<div class="row">
			<div class ="col-md-5">
				<img src="c:/upload/<%=product.getFilename()%>" style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><b>��ǰ �ڵ� : </b><span class="badge badge-danger"> <%=product.getProductId()%></span>
				<p><b>������</b> : <%=product.getManufacturer()%>
				<p><b>�з�</b> : <%=product.getCategory()%>
				<p><b>��� ��</b> : <%=product.getUnitsInStock()%>
				<h4><%=product.getUnitPrice()%>��</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> ��ǰ �ֹ� &raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning"> ��ٱ��� &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary"> ��ǰ ��� &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
