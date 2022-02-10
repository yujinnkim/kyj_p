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
	<h1>UpdatePro.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
		// pageNum 정보저장
		String pageNum = request.getParameter("pageNum");
	
		//전달된 수정할 정보를 저장( 이름, 비밀번호, 제목, 내용, 글 번호)
		// => 액션태그
	%>
	<jsp:useBean id="bdto" class="funweb.board.BoardDTO"/>	
	<jsp:setProperty property="*" name="bdto"/>
	
	<%
		System.out.println("수정정보 " + bdto);
		BoardDAO bdao = new BoardDAO();
		int result=bdao.updateBoard(bdto);
		
		if(result==1){
			%>
			<script type="text/javascript">
				alert("게시글 수정완료");
				location.href='list.jsp';
			</script>
			<%
		}else if(result ==0){
			 %>
			  <script type="text/javascript">
			  	alert("비밀번호 오류");
			  	history.back();
			  </script>
			 <%
		}else{
			%>
			<script type="text/javascript">
		  	alert("게시물 없음");
		  	history.back();
		  </script>
		  <%
		}
	%>
</body>
</html>