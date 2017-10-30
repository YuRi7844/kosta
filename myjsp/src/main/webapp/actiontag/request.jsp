<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>find person - useBean, getProperty 태그</h1>
<form action="/myjsp/findPerson" method="post">
	<input type="text" name="name">
	<button type="submit">조회</button>
</form>

<h1>add pserson - useBean, setProperty</h1>
<%--요청파라미터를 속성에 넣기 --%>
<form action="/myjsp/actiontag/add_forward.jsp" method="post">
	이름 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>
	키   : <input type="text" name="tall"><br>
	결혼여부 : 
		기혼 - <input type="radio" name="marriage" value="true">
		미혼 - <input type="radio" name="marriage" value="false">
	<p>
	<button type="submit">등록</button>
</form>
<jsp:include page="/WEB-INF/menu.jsp"/>
</body>
</html>