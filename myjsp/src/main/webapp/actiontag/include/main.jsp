<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--top.jsp를 포함(include) --%>
<%--@ include file="top.jsp" --%><%--절대경로 : /WEB-INF/top.jsp --%>
<jsp:include page="/WEB-INF/top.jsp"/>
<hr>
main.jsp
<jsp:include page="/WEB-INF/menu.jsp"/>

</body>
</html>