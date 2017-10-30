<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   request.setAttribute("current", new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
현재일시 : ${requestScope.current }<br>
<h1>fmt를 이용해 일시 출력</h1>
<%-- 
   setLocale 태그로 지역을 설정하면 formatDate/formatNumber의 기본 형식이 그 지역의 형식으로 바뀐다
   지역 코드 형식 : 언어코드_국가코드
   언어코드 : ISO-639, 국가코드 : ISO-3166
      주요 코드 예시
      대한민국 : ko_KR
      중국 : zh_CN
      대만 : zh_TW
      미국 : en_US
      영국 : en_GB
      일본 : ja_JP
 --%>
<fmt:setLocale value="en_US"/><!-- US형식에 맞추는? -->
<fmt:setLocale value="zh_CM"/><!-- 언어_국가 -->
<fmt:formatDate value="${requestScope.current }"/><br> <!-- ${requestScope.product.birthday.current} 이런 식으로? / 기본값이 date이기 때문에 생략 가능 -->
<fmt:formatDate value="${requestScope.current }" type="time"/><br>
<fmt:formatDate value="${requestScope.current }" type="both"/><br>

<fmt:formatDate value="${requestScope.current }"
            pattern="yyyy년 MM월 HH시 mm분 ss초"/><br>
<fmt:formatDate value="${requestScope.current }"
            pattern="yyy/MM/dd HH:mm:ss"/>
</body>
</html>