<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setAttribute("nameList", new String[]{"김영수", "김철수", "김영희", "박영희"});
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${fn:length(requestScope.nameList) ==0 }">
		조회된 이름이 없습니다.
	</c:when>
	<c:otherwise>
		<h2>김씨들의 이름</h2>
		<c:forEach items="${requestScope.nameList }" var="name">
			<c:if test='${fn:startsWith(name, "김") }'>
				${name}
			</c:if>
		</c:forEach>
	</c:otherwise>
</c:choose>
<p>
${fn:join(requestScope.nameList, '-') }
</body>
</html>