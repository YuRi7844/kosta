<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Arrays"%>
<%@page import="vo.Person"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] nameList = {"홍", "박", "이", "최"};
	request.setAttribute("nameList", nameList);
	
	List list = Arrays.asList(new Person("이름1", 20, 190, false),
			new Person("이름2", 10, 167, false),
			new Person("이름3", 50, 160, false),
			new Person("이름4", 25, 195, false));
	session.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름<br>
<ul>
	<c:forEach items="${requestScope.nameList }" var="name">
		<li>${name}</li> 
	
	</c:forEach>
</ul>
<h1>목록</h1>
<%-- 
	varStatus="변수명" - 반복횟수를 제공할 변수 선언
	${변수명.count} - 1부터 시작, ${변수명.index} - 0부터 시작
 --%>
<c:forEach items="${sessionScope.list }" var="person" varStatus="cnt">
	${cnt.count}-${cnt.index} : 이름 : 	${person.name } 나이: ${person.age } 키: ${person.tall } 결혼여부 : ${person.marriage ? '기혼' : '미혼' }<br>
</c:forEach>
<%
	HashSet set = new HashSet();
	set.add("a");
	set.add("b");
	set.add("c");
	request.setAttribute("set", set);

%>
<ul>
	<c:forEach items="${requestScope.set }" var="value">
		<li>${value }</li>
	</c:forEach>
</ul>
<%
	HashMap map = new HashMap();
	map.put("name", "홍길동");
	map.put("age", 20);
	map.put("address", "경기도 성남시 분당구 삼평동");
	request.setAttribute("map", map);
%>
<h1>Map 반복</h1>
<c:forEach items="${requestScope.map }" var="entry">
	<c:if test="${entry.key != 'address' }">
		키 : ${entry.key } 값 : ${entry.value }<br>
	</c:if>
</c:forEach>
<h2>단순반복 - 특정 횟수만큼 반복</h2>
<c:forEach begin="1" end="10" var="num" step="3">
	${num}.안녕하세요<br>
</c:forEach>
</body>
</html>