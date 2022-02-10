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
<h1>메일 보내기</h1>


<form action="mailSend.jsp" name="fr" id="myPage">
<table class="mylist">
<input type="hidden" name="from" value="yujin4114@naver.com" readonly="readonly">
				<tr>
					<th colspan="2">메일 보내기</th>
				</tr>
				<tr>
					
				</tr>
				<tr>
				<%
					request.setCharacterEncoding("utf-8");
					String email=request.getParameter("email");
					//System.out.println(email);
				%>
					<td>수신자</td>
					<td><input type="text" name="to" style="border: none;" value="<%=email%>"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" style="border: none;" placeholder="제목을 입력하세요"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content"
							style="width: 500px; height: 200px;"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input
						type="submit" value="메일 보내기" /></td>
				</tr>
			</table>


</form>


</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>