<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@page import="funweb.board.BoardDTO"%>
<%@page import="funweb.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
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
<h1>글 본문 보기</h1>

<%
	//전달된 파라미터 값 저장(num, pageNum)
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	
	//DAO 객체 생성
	BoardDAO bdao=new BoardDAO();

	//조회수 1증가 - updateReadCount();
	bdao.updateReadcount(num);
	
	
	//기존의 글정보 가져오기
	BoardDTO bdto= bdao.getBoard(num);
%>

<form action="boardWritePro.jsp" method="post">
<table id="notice">
<tr><th class="tno" colspan="5" style="border-radius: 12px;">리뷰 게시판</th></tr>

			<tr>
				<td colspan="2">글쓴이</td>
				<td class="left" colspan="3"><input type="text" name="name" value="<%=bdto.getName()%>" style="border:none;"></td>
			</tr>
			<tr>
				<td colspan="2">글 제목</td>
				<td class="left" colspan="3"><input type="text" name="subject" value="<%=bdto.getSubject()%>" style="border:none;"></td>
			</tr>
			<% 
			if(bdto.getStar()!=0){
			%>
			<tr>
				<td colspan="2">별점</td>
				<td class="left" colspan="3"><input type="text" name="star" value="<%=bdto.getStar()%>" style="border:none;"></td>
			</tr>
			<%} %>
			<tr>
				<td colspan="2">글 내용</td>
				<td class="left" colspan="3">
					<textarea rows="10" cols="20" name="content" style="border: none;" ><%=bdto.getContent()%></textarea> </td>
			</tr>
			<!-- ------------------------------------------------------------------------------------- -->
		<%
			String file=bdto.getFile();
		
			//System.out.println("파일있"+file);
			if(file !=null){
		%>
			<tr>
				<td colspan="2">첨부파일 </td>
				<td class="left" colspan="3">
					<img src="../upload/<%=bdto.getFile()%>" style="max-width: 500px; height: auto;"><hr><input type="button" value="다운로드" onclick="location.href='fileDownload.jsp?file_name=<%=bdto.getFile()%>'"> 
				</td>
			</tr>
			<%} %>
			<!-- ------------------------------------------------------------------------------------- -->
		</table>



<div id="table_search">
<%
	String id = (String) session.getAttribute("id");

	// 해당 회원의 모든 정보를 가져와서 화면에 출력
	MemberDAO mdao = new MemberDAO();
	MemberDTO Member = mdao.getMember(id);
	// 해당 회원의 모든 정보를 가져와서 화면에 출력
	
	if (id != null) {
		if((bdto.getName()).equals(Member.getName())){%>
		<input type="button" value="수정하기" class="btn" onclick="location.href='update.jsp?num=<%=num%>&pageNum=<%=pageNum%>'" >
		<input type="button" value="삭제하기" class="btn" onclick="location.href='delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
		<%	
		}
		%>
		
	<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWrite.jsp?num=<%=num%>&re_ref=<%=bdto.getRe_ref()%>&re_lev=<%=bdto.getRe_lev()%>&re_seq=<%=bdto.getRe_seq()%>';">
<%} %>
	<input type="button" value="목록으로" class="btn" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
</div>








<!-- -------------------------------------------------------------------------------------------------------- -->
<%-- <div id="table_search">
	<input type="button" value="수정하기" class="btn" onclick="location.href='update.jsp?num=<%=num%>&pageNum=<%=pageNum%>'" >
	<input type="button" value="삭제하기" class="btn" onclick="location.href='delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
	<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWrite.jsp?num=<%=num%>&re_ref=<%=bdto.getRe_ref()%>&re_lev=<%=bdto.getRe_lev()%>&re_seq=<%=bdto.getRe_seq()%>';">
	<input type="button" value="목록으로" class="btn" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
</div> --%>
<!-- -------------------------------------------------------------------------------------------------------- -->

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