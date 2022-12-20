<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<%@ page errorPage ="exceptionNoProductId.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 	href="../resources/css/bootstrap.min.css" />
<title>��ǰ �� ����</title>
<script type="text/javascript">
	function addToDB() {
		if (confirm("��ǰ�� ����Ͻðڽ��ϱ�?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
	function rejectToDB() {
		if (confirm("���� ������ Ȯ�����ּ���.")) {
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
				<p><b>��ǰ �ڵ� : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p><b>�з�</b> : <%=rs.getString("p_category")%>
				<p><b>��� ��</b> : <%=rs.getString("p_unitsinstock")%>
				<%
					int money = rs.getInt("p_UnitPrice");
				%>
				<h4><%=String.format(" %,d", money) %>��</h4>
				
				<!-- ��ǰ �ֹ�, ��ٱ���, ��ǰ ����� accept, reject ������ �ٲٴ� ���� �ʿ� -->
				<p><form name="addForm" action="processAddProduct.jsp?id=<%=rs.getString("p_id")%>" method="post" enctype ="multipart/form-data">
					<a href="#" class="btn btn-success" onclick="addToDB()"> ��ǰ ���� &raquo;</a> 
				</form>
				<form name="reason" action="processRejectProduct.jsp?id=<%=rs.getString("p_id")%>" method="post" enctype ="multipart/form-data">
					<textarea rows="2" cols="80" id = "reason" name= "reason" class= "form-control"></textarea>
					<a class="btn btn-warning" type = "submit" onclick="rejectToDB()"> ��ǰ ���� &raquo;</a>
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
