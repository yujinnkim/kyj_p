<%@page import="java.util.ArrayList"%>
<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link href="../css/myPage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	//checkAll()
	function checkAll(){
		if(fr.pass1.value==""){
			alert("비밀번호를 입력하시오.");
			fr.pass1.focus();
			return false;
		}
		if(fr.newPass1.value==""){
			alert("새 비밀번호를 입력하시오.");
			fr.newPass1.focus();
			return false;
		}
		if(fr.newPass2.value==""){
			alert("새 비밀번호를 입력하시오.");
			fr.newPass2.focus();
			return false;
		}
		
		if(fr.newPass1.value!=fr.newPass2.value){
			alert("새 비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		
		
	}	
	//checkAll()

</script>


</head>

<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<jsp:include page="../inc/left.jsp"/>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>비밀번호 변경</h1>


	<%-- <%
		String id = (String) session.getAttribute("id");
		MemberDTO mdto=new MemberDTO();
	%> --%>
	
			

<!-- <fieldset>-->
<form action="changePassPro.jsp" name="fr" id="myPage" onsubmit="return checkAll()">
<table class="mylist" style="width: 500px">
	<rowgroup>
		<row style="width:30%;">
		<row style="width:70%;">
	</rowgroup>
	
		<tr>
			<th style="text-align: center;">현재 비밀번호</th>
			<td><input type="password" name="pass1"></td>
		</tr>


		<tr>
			<th style="text-align: center;">새 비밀번호</th>
			<td><input type="password" name="newPass1"></td>
		</tr>
		<tr>
			<th style="text-align: center;">새 비밀번호 확인</th>
			<td><input type="password" name="newPass2"></td>
		</tr>
</table>
<input type="submit" value="변경하기">
<input type="reset" value="다시작성">
</form>
<!-- </fieldset> -->

</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>