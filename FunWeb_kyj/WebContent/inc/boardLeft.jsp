<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 왼쪽메뉴 -->

<nav id="sub_menu">
<ul>
<% 
	String id = (String) session.getAttribute("id");
	if(id!=null){%>
		<li><a href="boardWrite.jsp">리뷰쓰기</a></li>
	<%
	}
	%>
<li><a href="list.jsp">게시판 목록</a></li>
</ul>
</nav>