<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<nav class="navbar navbar-expand  navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<form name="searchForm" action = "searchProduct.jsp" method ="get">
					<div class = "search_input">
						<input type = "text" name = "searchname">
						<button class = 'btn search_btn'> �˻�</button>
					</div>
				</form>
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">�α��� </a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'>ȸ�� ����</a>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>��]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">�α׾ƿ� </a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/updateMember.jsp"/>'>ȸ�� ����</a>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/searchProduct.jsp"/>">��ǰ �˻�</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/products.jsp"/>">��ǰ ���</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/addProduct.jsp"/>">��ǰ ���</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/editProduct.jsp?edit=update"/>">��ǰ ����</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/editProduct.jsp?edit=delete"/>">��ǰ ����</a></li>			
			</ul>
		</div>
	</div>
</nav>