<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
		<li><a href="myPage.jsp">마이페이지</a></li>
		<li><a href="updateMember.jsp">회원정보 수정</a></li>
		
<% 
	String id = (String) session.getAttribute("id");
	/* // 해당 회원의 모든 정보를 가져와서 화면에 출력
	MemberDAO mdao = new MemberDAO();
	MemberDTO Member = mdao.getMember(id);
	// 해당 회원의 모든 정보를 가져와서 화면에 출력 */
	if(id!= null){
		if(id.equals("admin")){
		
		%>
	<li><a href="memberList.jsp">회원목록</a></li>
	<%
			} else{%>
				<li><a href="deleteMember.jsp">회원탈퇴</a></li>
		<%	}
		}
	%>
	</ul>
</nav>




<!-- --------------------------------------------------------------------------- -->
<!-- <nav id="sub_menu">
	<ul>
		<li><a href="myPage.jsp">마이페이지</a></li>
		<li><a href="updateMember.jsp">회원정보 수정</a></li>
		<li><a href="deleteMember.jsp">회원탈퇴</a></li>
	</ul>
</nav> -->
<!-- --------------------------------------------------------------------------- -->


<!-- 왼쪽메뉴 -->