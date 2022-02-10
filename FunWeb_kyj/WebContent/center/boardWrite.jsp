<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 게시판</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/boardLeft.jsp"/>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>글쓰기 페이지</h1>
<%
	String id=(String)session.getAttribute("id");
	if(id==null){ response.sendRedirect("../member/login.jsp");}%>
		

<form action="boardWritePro.jsp" method="post" enctype="multipart/form-data">
<%
	// 해당 회원의 모든 정보를 가져와서 화면에 출력
	MemberDAO mdao= new MemberDAO();
	MemberDTO Member=mdao.getMember(id);
	 %>
<table id="notice">
<tr><th class="tno" colspan="5">리뷰 게시판</th></tr>

			<tr>
				<td colspan="2">글쓴이</td>
				<td class="left" colspan="3">
				<input type="text" name="name" value="<%=Member.getName() %>" readonly="readonly" style="border: none;">
				<input type="hidden" name="id" value="<%=id %>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td colspan="2">글 제목</td>
				<td class="left" colspan="3"><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td colspan="2">첨부파일</td>
				<td class="left" colspan="3"><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
				<td class="left" colspan="3">
					<textarea rows="10" cols="20" name="content"></textarea> </td>
			</tr>
<!-- -----------------------------별점-------------------------------------------->
 			<tr>
				<td colspan="2">별점</td>
				<td class="left" colspan="3">
				<select name="star">
				<option value="">별점을 선택하시오</option>
			 	<option value="1">1점</option>
			 	<option value="2">2점</option>
			 	<option value="3">3점</option>
			 	<option value="4">4점</option>
			 	<option value="5">5점</option>
			 </select>
				</td>
			</tr>

<!-- -----------------------------별점-------------------------------------------->

		</table>



<div id="table_search">
	<input type="submit" value="글쓰기" class="btn">
	<input type="button" value="돌아가기" class="btn" onclick="history.back(-1);">
</div>

</form>

<div class="clear"></div>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>