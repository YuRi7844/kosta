<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>out 태그</h1>
<br>은 엔터입니다.
&lt;br&gt;은 엔터입니다.
<%-- &lt가 <역할을, &gt가 >역할을 하는데 꺽새로 뿐아니라 부등호로도 의미를 가지게된다.
(원래 부등호 쓸래도 꺽새로 인식되어버림.) --%>
<p>
<c:out value="<br>은 엔터입니다.-<out>태그로 출력"/><br>
<c:out value="${requestScope.message }" default="메세지가 없습니다."/>
<%-- EL은 단독으로 써도 출력을 해서 굳이 태그안에 안써도 되지만 메세지가 없을경우 표시가 아예안되기 때문에 
체크를 하기위해 <out>태그를 이용해 메세지가 없다는 내용을 출력시키게 한다. --%>

<h1>url 태그</h1>
<c:url value="/jstl/url_response.jsp" var="myurl">
	<%--요청파라미터 등록 : url뒤에 QueryString으로 추가 - URL Encoding 처리--%>
	<c:param name="name">홍길동</c:param>
</c:url>

<a href="/myjsp/jstl/url_response.jsp?name=홍길동">url_response.jsp</a><br>
<a href='<c:url value="/jstl/url_response.jsp"/>'>url_response.jsp</a><br>
<a href="${myurl }">url_response.jsp</a>
</body>
</html>