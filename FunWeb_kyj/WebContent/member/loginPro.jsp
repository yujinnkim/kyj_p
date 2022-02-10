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
	<h1>loingPro.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="loginMember" class="funweb.member.MemberDTO"/>
	<jsp:setProperty property="*" name="loginMember"/>
	
	<%=loginMember %>
	
	<%
	
 		MemberDAO mdao=new MemberDAO();
	
		int result=mdao.loginCheck(loginMember.getId(), loginMember.getPass1());
		
		if(result==-1){
			%>
			<script type="text/javascript">
				var value=confirm("아이디가 없습니다. 회원가입 하시겠습니까?");
				if(value){
					location.href='join.jsp';
				}else{
					history.back();
				}
			</script>
			<%
			
		}else if(result==0){
			%>
			<script type="text/javascript">
				alert('비밀번호 오류');
				history.back();
			</script>
		<%
			
		}else{
			session.setAttribute("id", loginMember.getId());
			response.sendRedirect("../main/main.jsp");
		} 
	%>
	
	
	
	
</body>
</html>