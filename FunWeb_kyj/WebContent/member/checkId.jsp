<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복체크</title>

</head>
<body>
 	<h1>아이디중복체크</h1>
	<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
 	

	 MemberDAO mdao = new MemberDAO();
	 int result = mdao.checkId(id);
	 if (result == 1){
	 	out.print("사용 가능한 아이디입니다");
	 	%>
	 	 <input type="button" value="사용하기" onclick="use();"><br>
	 	<%
	 	
	 }else if(result == 0){
	 	out.print("중복된 아이디입니다");
	 }else{
	 	out.print("중복(-1)"); 
	 }

	 %>
 	
	 
	 <fieldset>
	<form action="checkId.jsp" method="post" name="wfr">
		ID : <input type="text" name="id" value="<%=id%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>
	 
<script type="text/javascript">

	//close()
 	function use(){
    	opener.document.fr.id.value = document.wfr.id.value;
    	opener.document.fr.id.readOnly=true;
    	window.close();}
	//close()
</script>	 
	
	
	
</body>
</html>