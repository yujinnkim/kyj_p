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
	<h1>WebContent/center/deletePro.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
	
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String name=request.getParameter("name");
		
		BoardDAO bdao=new BoardDAO();
		int result= bdao.deleteBoard(num,name);
		if(result==1){
			%>
			<script type="text/javascript">
				alert("게시글 삭제완료");
				location.href='list.jsp';
			</script>
			<%
		}else{
			 %>
			  <script type="text/javascript">
			  	alert("오류");
			  	history.back();
			  </script>
			 <%
		}
		%>
		
		
<%-- <%=num %>
<%=name %> --%>
		
		

</body>
</html>