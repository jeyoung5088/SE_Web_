<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>ȸ�� ����</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">ȸ������</h1>
		</div>
	</div>

	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>ȸ�������� �����Ǿ����ϴ�.</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>ȸ�������� ���ϵ帳�ϴ�.</h2>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h2 class='alert alert-danger'>" + loginId + "�� ȯ���մϴ�</h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>ȸ�������� �����Ǿ����ϴ�.</h2>");
			}
		%>
	</div>	
</body>
</html>