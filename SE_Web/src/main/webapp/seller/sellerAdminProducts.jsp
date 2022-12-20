<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>상품 관리</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 관리</h1>
		</div>
	</div>
	<div class="container">
		<a href="editProduct.jsp?edit=update" class="btn btn-success" role="button"> 상품 수정 &raquo;></a>
		<a href="editProduct.jsp?edit=delete" class="btn btn-danger" role="button"> 상품 삭제 &raquo;></a>
		<a href="showjudge.jsp"	class="btn btn-success" role="button"> 심사 중 상품 확인 &raquo;></a>
		<!-- <a href="showjudge.jsp"	class="btn btn-success" role="button"> 들어온 주문 목록 &raquo;></a> -->
	</div>
</body>
</html>