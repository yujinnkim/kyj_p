<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- WebContent/inc/top.jsp (상단메뉴) -->

<header>
	<div id="login">
	<%
	String id = (String) session.getAttribute("id");

	// 해당 회원의 모든 정보를 가져와서 화면에 출력
	MemberDAO mdao = new MemberDAO();
	MemberDTO Member = mdao.getMember(id);
	// 해당 회원의 모든 정보를 가져와서 화면에 출력
	
	if (id != null) {%>	
 	<span id="loginText"><input type="text" value="<%=id%>님 안녕하세요" readonly="readonly" style="border:none; text-align: right;" ></span> | <a href="../member/logout.jsp">로그아웃</a>
 	<%
		}else{
	%>
		<a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a> 
	
	<%
		}
	%>
	<!-- -------------------------------------------------------------------------------------------------------------------- -->
	
	
	</div>
	<div class="clear"></div>
	<!-- 로고들어가는 곳 -->
	<div id="logo">
		<img src="../images/logo.gif" width="265" height="62" alt="Fun Web">
	</div>
	<!-- 로고들어가는 곳 -->
	<nav id="top_menu">
		<ul>
			<li><a href="../main/main.jsp">메인화면</a></li>
<!-- 			<li><a href="company/welcome.html">COMPANY</a></li>
 -->			<!-- <li><a href="../center/fileUploadForm.jsp">ITWILL 자료실</a></li> -->
			<li><a href="../center/list.jsp">리뷰</a></li>
			
			<li><a href="../member/myPage.jsp">회원정보보기</a></li>
		</ul>
	</nav>
</header>