<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<a href="/">홈</a>
		<a href="/lists/board-list.jsp">게시글 목록</a>
	</nav>
	<hr/>
	<h1>게시글 목록</h1>
	
	<form action="">
		<select name="">
			<option value="">제목</option>
			<option value="">작성자</option>
		</select>
		<input name=""/>
		<button type="submit">검색</button>
	</form>
	<hr/>
	
	<table>
		<tr>
			<th>게시 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>1</td>
			<td>테스트 제목</td>
			<td>관리자</td>
			<td>yyyy:mm:dd</td>
		</tr>
		<tr>
			<td>2</td>
			<td>테스트 제목</td>
			<td>관리자</td>
			<td>yyyy:mm:dd</td>
		</tr>
	</table>
</body>
</html>