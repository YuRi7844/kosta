<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setAttribute("num", 3000000);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
EL : ${requestScope.num}<br>
value만 지정 - 단위구분자 : <fmt:formatNumber value="${requestScope.num}"/><br>
<%-- type : number(기본)-단위구분자, currency:통화기호, percent : %기호(value*100)--%>
<fmt:formatNumber value="${requestScope.num}" type="percent"/><br>
<fmt:formatNumber value="${requestScope.num }" type="currency"/><br>
<fmt:formatNumber value="${requestScope.num }" type="currency" groupingUsed="false"/><br>
<fmt:setLocale value="en_US"/>
en_US : <fmt:formatNumber value="${requestScope.num }" type="currency"/><br>
<fmt:setLocale value="en_GB"/>
en_GB : <fmt:formatNumber value="${requestScope.num }" type="currency"/><br>
<fmt:setLocale value="zh_CN"/>
zh_CN : <fmt:formatNumber value="${requestScope.num }" type="currency"/><br>
<%
	request.setAttribute("doubleNum", 300000.1236);
%>
<fmt:formatNumber value="${requestScope.doubleNum }" pattern="#,###.##"/>
<fmt:formatNumber value="${requestScope.doubleNum }" pattern="#,###.0000000"/>
</body>
</html>