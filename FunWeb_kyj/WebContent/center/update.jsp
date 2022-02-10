<%@page import="funweb.board.BoardDTO"%>
<%@page import="funweb.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>글 수정 페이지</h1>

<%
	// 전달되는 정보저장(파라미터)
	int num= Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	//	DB안에 있는 데이터 저장
	BoardDAO bdao= new BoardDAO();
	BoardDTO bdto= bdao.getBoard(num);
	
	
%>


<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post">
	<input type ="hidden" name="num" value="<%=bdto.getNum()%>">

<table id="notice">
<tr><th class="tno" colspan="5">게시물 수정</th></tr>


			<tr>
				<td colspan="2">글쓴이</td>
				<td class="left" colspan="3"><input type="text" name="name" value="<%=bdto.getName() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2">글 제목</td>
				<td class="left" colspan="3"><input type="text" name="subject" value="<%=bdto.getSubject()%>"></td>
			</tr>
			<%
			String file=bdto.getFile();
		
			//System.out.println("파일있"+file);
			if(file !=null){
		%>
			<tr>
				<td colspan="2">첨부파일</td>
				<td class="left" colspan="3">
					<%-- <a href="file_down.jsp?file_name=<%=bdto.getFile()%>"> <%=bdto.getFile() %></a> --%>
					<img scr="file_down.jsp?file_name=<%=bdto.getFile()%>"> <%=bdto.getFile() %></a>
				</td>
			</tr>
			<%} %>
			<tr>
				<td colspan="2">내용</td>
				<td class="left" colspan="3">
					<textarea rows="10" cols="20" name="content"><%=bdto.getContent()%></textarea> </td>
			</tr>
<!-- -----------------------------별점-------------------------------------------->
<% 
			if(bdto.getStar()!=0){
			%>
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
			<%} %>
<!-- -----------------------------별점-------------------------------------------->

		</table>



<div id="table_search">
	<input type="submit" value="글쓰기" class="btn">
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