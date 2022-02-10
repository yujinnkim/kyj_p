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
	<h1>updateMemberPro.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="member" class="funweb.member.MemberDTO" />
	<jsp:setProperty property="*"  name="member"/>
	
	<%
	System.out.println("수정할 데이터 : " + member);
	MemberDAO mdao=new MemberDAO();
	int result=mdao.updateMember(member);
	if(result==-1){
		System.out.println("-1");
		%>
		<script type="text/javascript">
			alert('다시 시도해주세요.');
			history.back();
		</script>
		
		<%
	}else if(result==0){
		%>
		<script type="text/javascript">
			alert('비밀번호 오류입니다.');
			history.back();
		</script>
		
		<%
	}else{	//result==1
		%>
		<script type="text/javascript">
			alert('회원정보 수정완료');
			location.href='myPage.jsp';
		</script>
		
		<%
	}

%>
</body>
</html>