<%@ page contentType="text/html;charset=utf-8"%>
<%--
	요청파라미터들을 attribute의 VO객체에 담아서 실제 요청 처리할 Servlet으로 이동

 --%>
 <jsp:useBean id="person" scope="request" class="vo.Person"/>
 
 <jsp:setProperty property="*" name="person"/>
 <%-- 
 request.getRequestDispatcher("/addPerson").forward(request,response); 
 --%>
 <jsp:forward page="/addPerson"/>
