<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Person"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	//EL을 이용해 Collertion(배열/List)의 요소(element) 출력
	//List/배열 - index로 접근. => [] 표기법사용 ([index])
	//Map - key로 접근. => .표기법, []표기법(.key, ["key"])
	//Set - EL로 요소출력은 할 수 없다.
	
	String [] names = {"김회원", "이회원", "최회원"};
	request.setAttribute("nameList", names);
	
	HashMap map = new HashMap();
	map.put("product name", "텔레비젼");
	map.put("price", 200000);
	map.put("owner", new Person("김영수", 33, 189, false));
	request.setAttribute("product", map);
	
	ArrayList<Person> personList = new ArrayList<>();
	//Person 객체 5개 add
	personList.add(new Person("김", 30, 188, false));
	personList.add(new Person("이", 20, 156, false));
	personList.add(new Person("박", 55, 178, true));
	personList.add(new Person("신", 13, 157, false));
	personList.add(new Person("최", 45, 198, true));
	
	request.setAttribute("result", personList);
	
	
	HashSet set = new HashSet();
	set.add("a");
	set.add("b");
	set.add("c");
	session.setAttribute("set", set);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width:500px;
		border-collapse: collapse;
	}
	table,td,th{
		border:1px solid black;
		padding: 15px;
		text_align : left;
	}
</style>
<%--padding 는 안쪽 여백, margins은 바깥쪽 여백 --%>
</head>
<body>
<h1>Set출력 - EL : Set의 요소 조회 및 출력은 안됨.</h1>
${sessionScope.set }



<h1>조회결과 - List를 EL로 출력</h1>
<%-- <table border="1"><th>는 가운데 정렬과 <b>처리를 해준다. --%>
<%--table 경계선 border : table, td/th => table에 대한 경계선과 td/th의 경계선이 각각 생기기 때문에 출력하면 table경계선이 두줄로 나옴 --%>
<table>
	<thead>
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>키</th>
			<th>결혼여부</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${requestScope.result[0]["name"] }</td>
			<td>${requestScope.result[0]["age"] }</td>
			<td>${requestScope.result[0]["tall"] }</td>
			<td>${requestScope.result[0]["marriage"] }</td>
		</tr>
		<tr>
			<td>${requestScope.result[1]["name"] }</td>
			<td>${requestScope.result[1]["age"] }</td>
			<td>${requestScope.result[1]["tall"] }</td>
			<td>${requestScope.result[1]["marriage"] }</td>
		</tr>
		<tr>
			<td>${requestScope.result[2]["name"] }</td>
			<td>${requestScope.result[2]["age"] }</td>
			<td>${requestScope.result[2]["tall"] }</td>
			<td>${requestScope.result[2]["marriage"] }</td>
		</tr>
		<tr>
			<td>${requestScope.result[3]["name"] }</td>
			<td>${requestScope.result[3]["age"] }</td>
			<td>${requestScope.result[3]["tall"] }</td>
			<td>${requestScope.result[3]["marriage"] }</td>
		</tr>
		<tr>
			<td>${requestScope.result[4]["name"] }</td>
			<td>${requestScope.result[4]["age"] }</td>
			<td>${requestScope.result[4]["tall"] }</td>
			<td>${requestScope.result[4]["marriage"] }</td>
		</tr>
	</tbody>
</table>


<h2>Map의 값 출력 - EL</h2>
<%-- 식별자 규칙에 어긋나는 문자가 포함된 경우는 [] 표기법을 사용해 조회. --%>
제품명 : ${requestScope.product["product name"] }<br>
가격 : ${requestScope.product.price }<br>
owner의 이름-나이 : ${requestScope.product.owner.name } - ${requestScope.product.owner.age }
${requestScope.product["owner"]["name"] } - ${requestScope.product["owner"]["age"] }


<h1>배열의 값 출력 - EL</h1>
${requestScope.nameList[0] } - ${requestScope.nameList['1'] } - ${requestScope.nameList["2"] }
 - ${requestScope.nameList[7] }<%-- 없는 index 접근 : 출력을 하지 않는다. --%>
 
 
</body>
</html>