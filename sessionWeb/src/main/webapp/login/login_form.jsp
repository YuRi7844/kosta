<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<c:choose>
		<c:when test="${requestScope.errorMessage !=null }">
			<span style="color:red">${requestScope.errorMessage }</span>
		</c:when>
	</c:choose>

	<form action="/sessionWeb/login" method="post">
		ID : <input type="text" name="id"><br> Password : <input
			type="password" name="password"><br>
		<button type="submit">로그인</button>
	</form>
</body>
</html>