<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<h1>joinPro.jsp</h1>
	
	
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="mdto" class="funweb.member.MemberDTO"/>
	<jsp:setProperty property="*" name="mdto"/>
	<%=mdto %>
	
	<%
		MemberDAO mdao=new MemberDAO();
		mdao.insertMember(mdto);
	%>
	
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다.");
		location.href="login.jsp";
	</script>

	
</body>
</html>