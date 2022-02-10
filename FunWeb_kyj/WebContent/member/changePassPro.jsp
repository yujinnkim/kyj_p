<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>changePassPro.jsp</h1>
	
	<%
		//한글처리
		request.setCharacterEncoding("utf-8");%>
	
	<%
		String id=(String)session.getAttribute("id");
		String pass= request.getParameter("pass1");
		String newPass1=request.getParameter("newPass1");
		String newPass2=request.getParameter("newPass2");
		
		MemberDAO mdao= new MemberDAO();
	%>
	<jsp:useBean id="loginMember" class="funweb.member.MemberDTO"/>
	<jsp:setProperty property="*" name="loginMember"/>
<!-- ------------------------------------------------------------------------- -->
	<%if(pass.equals(mdao.getMember(id).getPass1()) ){ 
		boolean result=mdao.changePass(id, newPass1, newPass2);
	%>
		<script type="text/javascript">
		alert("비밀번호가 변경되었습니다.");
		location.href="myPage.jsp";
	</script>	

<%	} else{ %>
		<script type="text/javascript">
		alert("현재 비밀번호를 확인하세요");
		location.href="changePass.jsp";
	</script>
		
<% }%>
	
<!-- ------------------------------------------------------------------------- -->
	<h1>changepass에서 넘어온값</h1>
	<%=id %>
	<%=pass %>
</body>
</html>