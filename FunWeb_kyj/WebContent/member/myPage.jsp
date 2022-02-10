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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
<h1>마이 페이지</h1>


	<%
		String id = (String) session.getAttribute("id");
		// 해당 회원의 모든 정보를 가져와서 화면에 출력
		MemberDAO mdao = new MemberDAO();
		MemberDTO Member = mdao.getMember(id);
		// 해당 회원의 모든 정보를 가져와서 화면에 출력
				if (id == null) {
			%>
			<script type="text/javascript">
				alert("아이디 정보가 없습니다 로그인화면으로 이동합니다");
				location.href="login.jsp";
			</script>
			<%
				} else {
			%>
			

	


<form action="" name="fr" id="myPage">

<table class="myPage">
<rowgroup>
<row style="width:10%;">
<row style="width:90%;">
</rowgroup>
	<tr>
		<th scope="row">아이디</th>
		<td><%=Member.getId() %></td>
	</tr>
	<tr>
		<th scope="row">이름</th>
		<td><%=Member.getName() %></td>
	</tr>
	<tr>
		<th scope="row">이메일</th>
		<td><%=Member.getEmail() %></td>
	</tr>
	<tr>
		<th scope="row">주소</th>
		<td><%=Member.getZipCode() %>, <%=Member.getAddress() %> <%=Member.getDetailAddress() %>, <%=Member.getExtraAddress() %></td>
	</tr>
</table>
<input type="button" value="비밀번호 변경하기" onclick="location.href='changePass.jsp';" style="float: left;">



<div class="clear"></div>
</form>
</article>

		<%
		}
	%>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>