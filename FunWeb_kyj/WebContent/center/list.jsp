<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@page import="funweb.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="funweb.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
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

<%
	// BoardDAO객체 생성
	BoardDAO bdao= new BoardDAO();
	// 게시판 DB에 있는 글 개수를 확인
	int cnt=bdao.getBoardCount();
	
	/////////////////////////////////////////////////////////////////////////////
	// 페이징 처리
	
	// 한 페이지에 출력될 글 개수
	int pageSize=5;
	
	//현 페이지 정보 설정
	String pageNum= request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	
	//첫행번호를 계산
	int currentPage= Integer.parseInt(pageNum);
	int startRow=(currentPage-1)*pageSize+1;
	
	/////////////////////////////////////////////////////////////////////////////

%>






<!-- 게시판 -->

<article>
<h1>리뷰 게시판 [총 게시물 : 
			<%=cnt %>]</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">제목</th>
    <th class="twrite">글쓴이</th>
    <th class="tdate">날짜</th>
    <th class="tread">조회수</th></tr>
    
 <%if(cnt!=0){ 
    List boardList = bdao.getBoardList(startRow,pageSize);
    for(int i=0;i<boardList.size();i++){
    	 BoardDTO bdto = (BoardDTO)boardList.get(i);   
%>
			<tr>
				<td><%=bdto.getNum() %></td>
				<td class="left">
				<%if(bdto.getRe_lev()>0){//답글일 때만 %>
					<img src="level.gif" height="10" width="<%=bdto.getRe_lev()*10%>">	
					<img src="re.gif">	
				<%} %>			
					<a href="contents.jsp?num=<%=bdto.getNum()%>&pageNum=<%=pageNum%>"><%=bdto.getSubject() %></a>
					</td>
				<td><%=bdto.getName() %></td>
				<td><%=bdto.getDate() %></td>
				<td><%=bdto.getReadcount() %></td>
			</tr>
			<%
	}//for
  
	}else{ %>
			<tr>
				<td colspan="5">게시판에 글이 없습니다.<br> 새 글을 작성하세요<br> 
				<a href="boardWrite.jsp"> 글쓰기 페이지로 </a>
				</td>
			</tr>
			<%} %>
		</table>
		<div id="table_search">
			<input type="text" name="search" class="input_box"> 
			<input type="button" value="search" class="btn">
		</div>   
    




<div class="clear"></div>
<div id="page_control">
<!-- ----------------------------------------------- -->
<!-- <a href="#">Prev</a>
<a href="#">1</a><a href="#">2</a><a href="#">3</a>
<a href="#">4</a><a href="#">5</a><a href="#">6</a>
<a href="#">7</a><a href="#">8</a><a href="#">9</a>
<a href="#">10</a>
<a href="#">Next</a> -->
<!-- ----------------------------------------------- -->

<%	
	if (cnt != 0) {
	///////////////////////////////////////////////////////////////
	// 페이징처리
	// 전체 페이지 수 계산
	int pageCount=cnt/pageSize + (cnt%pageSize==0? 0: 1);
			
	//한 페이지에 보여 줄 페이지 블럭
	int pageBlock = 3;
				
	// 한 페이지에 보여줄 시작번호 계산
	int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
				
	// 한 페이지에 보여줄 페이지 블럭 끝번호 계산
	  int endPage = startPage + pageBlock-1;
	     if(endPage > pageCount){
	    	 endPage = pageCount;
		    }
			%>

		 <% if(startPage>pageBlock){ %>
			<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
		<% } %>
		
		<% for(int i=startPage;i<=endPage;i++){ %>
			<a href="list.jsp?pageNum=<%=i%>"><%=i %></a>
		<% }%>
		
		<% if(endPage < pageCount){%>
			<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
		<% }%>
		
	  <% } %>



</div>
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