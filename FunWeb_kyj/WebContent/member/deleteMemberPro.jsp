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
	<h1>deleteMemberPro</h1>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id=request.getParameter("id");
		String pass=request.getParameter("pass1");
	%>

	<%=pass %>	
	<%	
		MemberDAO mdao = new MemberDAO();
		int result=mdao.deleteMember(id, pass);
		if(result==-1){
			%>
			<script type="text/javascript">
				alert('아이디 없음');
				history.back();
			</script>
			<%
		}else if(result==0){
			%>
			<script type="text/javascript">
				alert('비밀번호 오류');
				history.back();
			</script>
			<%
			
		}else{//result=1
			//로그인 세션 정보를 삭제(초기화)
			session.invalidate();
			%>
			<script type="text/javascript">
				alert('삭제 완료');
				location.href="../main/main.jsp";
			</script>
			<%
		}
	%>
</body>
</html>