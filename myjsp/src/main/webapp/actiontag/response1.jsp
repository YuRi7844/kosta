<%@ page contentType="text/html;charset=utf-8"%>
<!-- result = request.getAttribute("result"); -->
<jsp:useBean scope="request" id="result" class="vo.Person"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>조회 결과</h1>
이름 : <jsp:getProperty name="result" property="name"/> - <%= result.getName() %><br>
나이 : <jsp:getProperty property="age" name="result"/> - <%= result.getAge() %><br>
키	 : <jsp:getProperty property="tall" name="result"/> - <%= result.getTall() %><br>
결혼 여부 : <jsp:getProperty property="marriage" name="result"/> - <%= result.isMarriage() %><br>

<a href="/myjsp/actiontag/request.jsp">request.jsp</a>
<jsp:include page="/WEB-INF/menu.jsp"/>
</body>
</html>