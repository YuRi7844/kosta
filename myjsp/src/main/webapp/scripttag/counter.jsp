<%@ page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%!
//선언자 태그 - instance 변수 , 메소드(jspInit, jspDstroy) 선언/구현
private int count = 100000;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//프로그램 로직 - 스크립트 태그
	int size = (int)(Math.random()*50+1);//1~50
	DecimalFormat format = new DecimalFormat("#,###");//3단위로 숫자가 끊겨서 ,가 들어감.
	String countStr = format.format(++count);
%>
<span style="font-size:<%=size%>px"><%= countStr %> 번째 방문자 입니다.</span>

<jsp:include page="/WEB-INF/menu.jsp"/>
</body>

</html>
<%-- http://127.0.0.1:8088/myjsp/scripttag/counter.jsp --%>