<%@page import="vo.Person"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%-- JSTL 사용 : 1.	jstl library를 다운. - http://mvnrepository.com 에서 jstl검색	2. 각 JSP에서 taglib 지시자 설정. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="session" var="loginInfo" value='<%=new Person("홍길동", 30, 170, false) %>'/>

<c:set target="${sessionScope.loginInfo }" property="age" value="25"/>

<c:remove scope="session" var="loginInfo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 사용자가 로그인한 상태이면 메뉴2를 로그인 하지 않은 상태이면 메뉴1를 보여준다. 
(고객센터 - 공통메뉴>>로그인 여부와 상관없이 보임) 
로그인 여부 : session영역에 loginInfo 란 이름의 속성이 있으면 로그인
--%>
<c:choose>
	<c:when test="${sessionScope.loginInfo == null }"><%-- <c:when test="${empty sessionScope.loginInfo }"> 도 같은거--%>
		메뉴1 : 로그인 회원가입
	
	</c:when>
	<c:otherwise>
		메뉴2 : 로그아웃 마이페이지 
		<%-- 로그인한 사람의 나이가 20세 이상이면 성인용품 메뉴를 보여준다. --%>
		<c:if test="${sessionScope.loginInfo.age >= 20 }">
			성인용품
		</c:if>
	</c:otherwise>
</c:choose>
고객센터
</body>
</html>