<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

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
<nav id="sub_menu">
<ul>
<li><a href="join.jsp">회원가입</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
		<!-- 본문내용 -->
		<article>
			<h1>로그인</h1>
			<form action="loginPro.jsp" id="join">
				<fieldset>
					<legend>로그인</legend>
					<label>아이디</label> <input type="text" name="id"><br>
					<label>비밀번호</label> <input type="password" name="pass1"><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="로그인" class="submit"> 
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