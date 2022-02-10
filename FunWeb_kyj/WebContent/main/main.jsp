<%@page import="java.util.List"%>
<%@page import="funweb.board.BoardDTO"%>
<%@page import="funweb.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->


<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->

<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">

<div class="clear"></div>
<div id="news_notice">
<h3><span class="orange">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지</span></h3>
<%
	BoardDAO bdao= new BoardDAO();
	int cnt=bdao.getBoardCount();
	
	 int pageSize=5;
	
	String pageNum= request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	
	int currentPage= Integer.parseInt(pageNum);
	int startRow=(currentPage-1)*pageSize+1;
%>

	<table>
<%
if(cnt!=0){ 
    List boardList = bdao.getBoardList();
    for(int i=0;i<boardList.size();i++){
    	 BoardDTO bdto = (BoardDTO)boardList.get(i);  
    	 if(bdto.getName().equals("관리자")){%>
			<tr>
				<td class="contxt">
					<a href="../center/contents.jsp?num=<%=bdto.getNum()%>&pageNum=<%=pageNum%>"><%=bdto.getSubject() %></a>
				</td>
				<td><%=bdto.getDate() %></td>
			</tr>
			
	<%
    	 }
    	 }
    }
    %>
	</table>



</div>

<div id="news_notice">
<h3 class="brown">최근 게시물</h3>

	<table>
<%if(cnt!=0){ 
    List boardList = bdao.getBoardList(startRow,pageSize);
    for(int i=0;i<boardList.size();i++){
    	 BoardDTO bdto = (BoardDTO)boardList.get(i);   
%>
			<tr>
				<td class="contxt">
					<a href="../center/contents.jsp?num=<%=bdto.getNum()%>&pageNum=<%=pageNum%>"><%=bdto.getSubject() %></a>
					</td>
				<td ><%=bdto.getDate() %></td>
			</tr>
			
<%}
    }%>
	</table>

</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>