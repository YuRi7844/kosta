<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
HashMap<String, Integer> map = (HashMap)session.getAttribute("cart");
Set<String> keys = map.keySet();
%>
<h2>장바구니에 담은 물건들</h2>
<table border="1">
	<thead>
		<tr>
			<th>제품</th>
			<th>주문개수</th>
		</tr>
	</thead>
	<tbody>
		<%for(String key : keys){ %>
			<tr>
				<td><%=key %></td>
				<td><%=map.get(key) %></td>
			</tr>
		<%} %>
	</tbody>
	<!-- <tfoot>태그로 하단을 따로 묶어 합계와 같이 사용가능 -->
</table>
<a href="/sessionWeb/cart/showItems">쇼핑목록이동</a>
<a href="/sessionWeb/logout">로그아웃</a>
</body>
</html>

