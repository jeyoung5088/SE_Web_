<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    
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
String keyWord = request.getParameter("keyWord");
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

</body>
</html>