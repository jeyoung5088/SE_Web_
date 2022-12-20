<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.util.*"%>

<%
   String sessionId = (String) session.getAttribute("sessionId");
	
%>

<%@ include file="dbconn.jsp"%>
         <%
         	String dbusertype = "";
            String sql = "select * from member where id ='"+sessionId+"'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
               dbusertype = rs.getString("usertype");
            }
         %>
   
   
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<nav class="navbar navbar-expand  navbar-dark bg-dark">
   <div class="container">
      <div class="navbar-header">
         <a class="navbar-brand" href="/products.jsp">Home</a>
      </div>
      <div>
         <ul class="navbar-nav mr-auto">
         	<form align = "center" name="searchForm" action = "searchProduct.jsp" method ="get">
               <div class = "search_input">
                  <input name ="searchWord" type = "text" name = "searchname">
                  <button class="btn btn-light" > 검색</button>
               </div>
            </form>
            <c:choose>
               <c:when test="${empty sessionId}">
                  <li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인 </a></li>
                  <li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'>회원 가입</a>
               </c:when>
               <c:otherwise>
                  <li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
                  <li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃 </a></li>
                  <li class="nav-item"><a class="nav-link" href='<c:url value="/member/updateMember.jsp"/>'>개인정보 관리</a>
               </c:otherwise>
            </c:choose>
            
            <% if (dbusertype.equals("1")){ //구매자 %>
            	<li class="nav-item"><a class="nav-link" href="<c:url value="/cart.jsp"/>">장바구니</a></li>   
			<%} else if( dbusertype.equals("2")){ //판매자 %>
            	<li class="nav-item"><a class="nav-link" href="<c:url value="/seller/sellerAdminProducts.jsp"/>">상품 목록 관리</a></li>
            	<li class="nav-item"><a class="nav-link" href="<c:url value="/seller/addsellproduct.jsp"/>">상품 등록</a></li>
			<%} else if(dbusertype.equals("5")) {  //5: 관리자%>
               	<li class="nav-item"><a class="nav-link" href="<c:url value="/admin/adminJudgeProducts.jsp"/>">등록 요청 관리</a></li>
            <%}%>
         </ul>
      </div>
   </div>
</nav>