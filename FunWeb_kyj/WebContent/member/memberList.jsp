<%@page import="java.util.ArrayList"%>
<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보보기</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/myPage.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/left.jsp"/>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>회원목록</h1>


	<%
		String id = (String) session.getAttribute("id");
		MemberDAO mdao = new MemberDAO();
		ArrayList memberList=mdao.getMemberList();
				if (id == null) {
			%>
			<script type="text/javascript">
				alert("아이디 정보가 없습니다 로그인화면으로 이동합니다");
				location.href="login.jsp";
			</script>
			<%
				} 
				else {
					%>		
				
			

<!-- <fieldset>
<form action="" name="fr" id="myPage"> -->
<table class="mylist">
<colgroup>
<col style="width:10%;">
<col style="width:10%;">
<col style="width:10%;">
<col style="width:10%;">
<col style="width:60%;">
</colgroup>
	<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>주소</th>
		</tr>
		<%for (int i=0; i<memberList.size(); i++){ 
				MemberDTO mdto=	(MemberDTO) memberList.get(i);
				if(mdto.getId().equals("admin")){
					continue;
				}
		%>
	<tr>
		<td><%=mdto.getId() %></td>
		<td><%=mdto.getPass1() %></td>
		<td><%=mdto.getName() %></td>
		<td><a href="http://localhost:8088/FunWeb_kyj/member/mail.jsp?email=<%=mdto.getEmail() %>"><%=mdto.getEmail() %></a></td>
		<td><%=mdto.getZipCode() %>, <%=mdto.getAddress() %> <%=mdto.getDetailAddress() %>, <%=mdto.getExtraAddress() %></td>
	</tr>
	<%} %>
</table>


<!-- </form>
</fieldset> -->

</article>
<%} %>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>