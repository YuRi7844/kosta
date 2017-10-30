<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>장바구니에 담은 물건들</h2>
	<table border="1">
		<thead>
			<tr>
				<th>제품</th>
				<th>주문개수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sessionScope.cart }" var="entry">
				${entry.key }    ${entry.value }
				<tr>
					<td>${entry.key }</td>
					<td>${entry.value }</td>
				</tr>
			</c:forEach>
		</tbody>
		<!-- <tfoot>태그로 하단을 따로 묶어 합계와 같이 사용가능 -->
	</table>
	<a href="/sessionWeb/cart/showItems">쇼핑목록이동</a>
	<a href="/sessionWeb/logout">로그아웃</a>
</body>
</html>

