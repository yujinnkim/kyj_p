<%@page import="funweb.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>reWritePro	</h1>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="bdto" class="funweb.board.BoardDTO" />	
	<jsp:setProperty property="*" name="bdto"/>
	
	<%
		bdto.setIp(request.getRemoteAddr());
	
		BoardDAO bdao=new BoardDAO();
		bdao.reInsertBoard(bdto);
		
		response.sendRedirect("list.jsp");
	%>
	
</body>
</html>