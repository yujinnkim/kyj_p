<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
<h1>회원탈퇴</h1>
<%
		String id=(String)session.getAttribute("id");
	
		if(id==null){
			response.sendRedirect("login.jsp");
		}
	
	%>
<form action="deleteMemberPro.jsp" name="fr" id="join">
<fieldset>
<legend>기본정보</legend>
<label>비밀번호 확인 *</label>
<input type="hidden" name="id" class="id" value="<%=id%>">
<input type="password" name="pass1"><br>

</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="탈퇴하기" class="submit">
<input type="button" value="돌아가기" class="cancel" onclick="history.go(-1)">
</div>
</form>
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