<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${sessionScope.loginMember == null}">
		<a href="/sessionWeb/login/login_form.jsp">로그인폼</a>
	</c:when>
	<c:otherwise>
		<a href="/sessionWeb/stacknums/stack">숫자누적 요청</a>
		<a href="/sessionWeb/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<!-- 로그인 여부와 상관없이 보여지는 화면 -->
<a href="/sessionWeb/cart/showItems">상품목록 보기</a>
