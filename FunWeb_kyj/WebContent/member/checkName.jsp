<%@page import="funweb.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
 	<h1>이름중복체크</h1>
	<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
 	

	 MemberDAO mdao = new MemberDAO();
	 int result = mdao.checkName(name);
	 if (result == 1){
	 	out.print("사용 가능한 이름입니다");
	 	%>
	 	 <input type="button" value="사용하기" onclick="use();"><br>
	 	<%
	 	
	 }else if(result == 0){
	 	out.print("사용할 수 없는 이름입니다");
	 }else{
	 	out.print("중복(-1)"); 
	 }

	 %>
 	
	 
	 <fieldset>
	<form action="checkName.jsp" method="post" name="wfr">
		ID : <input type="text" name="name" value="<%=name%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>
	 
<script type="text/javascript">

	//close()
 	function use(){
    	opener.document.fr.name.value = document.wfr.name.value;
    	opener.document.fr.name.readOnly=true;
    	window.close();}
	//close()
</script>	 
	
	
	
</body>
</html>