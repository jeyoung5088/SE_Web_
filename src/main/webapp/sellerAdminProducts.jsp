<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>��ǰ ��� �� ����</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">��ǰ ��� �� ����</h1>
		</div>
	</div>
	<div class="container">
		<a href="/editProduct.jsp?edit=update" class="btn btn-success" role="button"> ��ǰ ���� &raquo;></a>
		<a href="/editProduct.jsp?edit=delete" class="btn btn-danger" role="button"> ��ǰ ���� &raquo;></a>
		<a href="/showjudge.jsp"	class="btn btn-success" role="button"> �ɻ� �� ��ǰ Ȯ�� &raquo;></a>
		<!-- ��ǰ �ɻ� Ȯ�� �������� ������ -->
	</div>
</body>
</html>