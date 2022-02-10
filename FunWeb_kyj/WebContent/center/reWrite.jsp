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
<h1>글쓰기 페이지</h1>
<!-----------------------------------------  ---------------------------------------------->
<%
	String id=(String)session.getAttribute("id");
	if(id==null){
	response.sendRedirect("login.jsp");
	}

	// 해당 회원의 모든 정보를 가져와서 화면에 출력
	MemberDAO mdao= new MemberDAO();
	MemberDTO Member=mdao.getMember(id);
	
	
	// 전달 된 파라미터 데이터 저장(num, re_ref, re_lev, re_seq)
		int num=Integer.parseInt(request.getParameter("num"));
		int re_ref= Integer.parseInt(request.getParameter("re_ref"));
		int re_lev= Integer.parseInt(request.getParameter("re_lev"));
		int re_seq= Integer.parseInt(request.getParameter("re_seq"));
%>
<!----------------------------------------- ---------------------------------------------->
<form action="reWritePro.jsp" method="post" >
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="re_ref" value="<%=re_ref%>">
	<input type="hidden" name="re_lev" value="<%=re_lev%>">
	<input type="hidden" name="re_seq" value="<%=re_seq%>">
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
			<!-- <tr>
				<td colspan="2">첨부파일</td>
				<td class="left" colspan="3"><input type="file" name="file"></td>
			</tr> -->
			<tr>
				<td colspan="2">내용</td>
				<td class="left" colspan="3">
					<textarea rows="10" cols="20" name="content"></textarea> </td>
			</tr>
<!-- -----------------------------별점-------------------------------------------->

<!-- -----------------------------별점-------------------------------------------->

		</table>



<div id="table_search">
	<input type="submit" value="등록" class="btn">
	<input type="button" value="돌아가기" class="btn" onclick="history.back;">
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