<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>    
    
    
<%
	request.setCharacterEncoding("UTF-8");
	
	//페이지 번호
	int pageNum = 0;
	if(request.getParameter("page") == null){
		pageNum = 1;
	}else{
		pageNum = Integer.parseInt(request.getParameter("page"));
	}
	//한 페이지에 나타낼 리스트 변수 선언
	int pageList = 4;
	
	//검색어
	String searchWord = request.getParameter("searchWord");

%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 검색</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"> <%=searchWord%> 검색 결과</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
		<%@ include file="dbconn.jsp"%>
			<%
			
				stmt = conn.createStatement();
				String sql = "select * from product where p_name like \'%" + searchWord + "%\'";
				System.out.println(sql);
				
				rs = stmt.executeQuery(sql);
			 	
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="c:/upload/<%=rs.getString("p_fileName")%>"" style="width: 100%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_UnitPrice")%>원
				<p>
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
			</div>
			<%
				}
				
			if (rs != null)
				rs.close();
 			if (stmt != null)
 				stmt.close();
 			if (conn != null)
				conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>