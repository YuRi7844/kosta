<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. Session에서 numberList를 조회.
	2. 반복문을 이용해 list내의 숫자들을 출력.
	ArrayList<Integer> numberList = (ArrayList<Integer>)session.getAttribute("numberList");
	Object numberList = session.getAttribute("numberList");
 -->
 <p>
 	<a href="/sessionWeb/stacknums/stack">숫자누적 요청</a>
 	<a href="/sessionWeb/stacknums/removenums">누적된 숫자 제거</a>
 </p>
 <c:choose>
 	<c:when test="${sessionScope.numberList !=null && !empty sessionScope.numberList}">
 	 <ul>
 		<c:forEach items="${sessionScope.numberList}" var="num">
 			<li>${num }</li>
 		</c:forEach>
 	</ul>
 	</c:when>
 	<c:otherwise>
 	 누적된 숫자가 없습니다.
 	</c:otherwise>
 </c:choose> 
 <br><a href="/sessionWeb/index.jsp">메인페이지</a>
</body>
</html>