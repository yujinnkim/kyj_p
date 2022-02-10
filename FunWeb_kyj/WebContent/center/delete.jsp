<%@page import="funweb.board.BoardDTO"%>
<%@page import="funweb.board.BoardDAO"%>
<%@page import="funweb.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
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
<nav id="sub_menu">
<ul>
<li><a href="boardWrite.jsp">리뷰쓰기</a></li>
<li><a href="list.jsp">게시판 목록</a></li>
<li><a href="fileDownload.jsp">파일 다운로드</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>게시물 삭제</h1>
<%
	int num= Integer.parseInt(request.getParameter("num"));
	BoardDAO bdao= new BoardDAO();
	BoardDTO bdto= bdao.getBoard(num);
%>

<form action="deletePro.jsp?pageNum=<%=request.getParameter("pageNum")%>" method="post">
<input type="hidden" name="num" value="<%=request.getParameter("num")%>">

<table id="notice">
<tr><th class="tno" colspan="5">리뷰 게시판</th></tr>

			<tr>
				<td colspan="2">삭제하시겠습니까?</td>
				<td class="left" colspan="3"><input type="hidden" name="name" value="<%=bdto.getName()%>">
				
				</td>
			</tr>

		</table>



<div id="table_search">
	<input type="submit" value="삭제하기" class="btn">
	<input type="button" value="뒤로가기" class="btn" onclick="history.go(-1)">
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