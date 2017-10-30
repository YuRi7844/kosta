<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp"/>
<hr>
<h1>등록결과</h1>
등록된 이름 : ${person.name }<br>
등록된 나이 : ${person.age }세<br>
등록된 키 : ${person.tall}cm<br>
등록된 결혼여부 : ${person.marriage ? "기혼" : "미혼"}

</body>
</html>