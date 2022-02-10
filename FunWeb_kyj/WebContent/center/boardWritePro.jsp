<%@page import="funweb.board.BoardDAO"%>
<%@page import="funweb.board.BoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>center/boardWritePro.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
		String realPath = request.getRealPath("upload");
		int maxSize = 10 * 1024 * 1024;	//10MB
		MultipartRequest multi=
				new MultipartRequest(
						request,
						realPath,
						maxSize,
						"UTF-8",
						new DefaultFileRenamePolicy());
	%>
	<jsp:useBean id="bdto" class="funweb.board.BoardDTO"/>
	<jsp:setProperty property="*" name="bdto"/>
	<%
		

		bdto.setName(multi.getParameter("name"));
		bdto.setSubject(multi.getParameter("subject"));
		bdto.setContent(multi.getParameter("content"));
		bdto.setFile(multi.getFilesystemName("file"));	//파일명
		bdto.setStar(Integer.parseInt(multi.getParameter("star")));
		
		bdto.setIp(request.getRemoteAddr());
		System.out.println("전달된 정보 : "+bdto);
		
		BoardDAO bdao = new BoardDAO();
	    bdao.insertBoard(bdto);
	    
	    
	    response.sendRedirect("list.jsp");
	%>
<%-- 	<%=multi.getParameter("name") %>
	<%=multi.getParameter("id") %>
	<%=multi.getFilesystemName("file") %>
	<%=multi.getParameter("subject") %>
	<%=multi.getParameter("content") %>
	<%=multi.getParameter("star") % --%>>
	
</body>
</html>