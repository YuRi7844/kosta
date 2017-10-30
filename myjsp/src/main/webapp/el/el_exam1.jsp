<%@page import="vo.Person"%>
<%--@page isELIgnored="true"--%><!-- EL무시하게 하기. -->
<%@ page contentType="text/html;charset=utf-8"%>
<% 
	request.setAttribute("result", "request - 결과값");
	session.setAttribute("result", "session - 결과값");
	request.setAttribute("error message", "XXX 이유로 오류가 발생했습니다.");
	
	session.setAttribute("person", new Person("홍길동", 20, 180, false));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결과값 : ${result } || ${requestScope.result } || ${sessionScope.result }<br>	<%-- getAttribute(result)와 같다. --%>
오류메세지 : ${requestScope["error message"] }<br>
오류메세지 유무 : ${requestScope["error message"] == null} - ${empty requestScope["error message"] } 
		|| ${requestScope["error message"] != null} - ${!empty requestScope["error message"] }	<!-- true/false가 리턴(boolean)값 -->
<br>
Person 나이 : ${sessionScope.person.age } - 
미성년 여부 (19) ${sessionScope.person.age > 19 ? "성인" : '미성년' } -\
					${ sessionScope.person.age gt 19 ? "성인" : '미성년' }
</body>
</html>