<%@page import="funweb.member.MemberDTO"%>
<%@page import="funweb.member.MemberDAO"%>
<%@page import="funweb.board.BoardDAO"%>
<%@page import="funweb.board.BoardDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fileDOWNLOAD</h1>
<%
	

	 //전달 된 정보 저장(file_name)
	String file_name=request.getParameter("file_name");
	
	//서버에 파일이 업로드 된 경로
	String savePath	= "upload";
	
	//사용중인 프로젝트 정보를 가져옴
	ServletContext ctx=getServletContext();
	//다운로드 할 폴더경로(파일을 업로드한 파일경로)
	String sDownloadPath = ctx.getRealPath(savePath);
	
	System.out.println("sDownloadPath >>>" + sDownloadPath);
	
	// 실제 다운로드 할 파일의 경로
	String sFilePath=sDownloadPath+"\\" + file_name;
	
	System.out.println("sFilePath >> " + sFilePath);
	
	/////////////////////////////////////////////////////////////////////////
	
	byte b[]= new byte[4096];	//4kb씩 다운로드, 한번에 파일을 읽고 쓰기 위한 배열
	
	FileInputStream fis = new FileInputStream(sFilePath);
	// 파일 입력객체 -> 다운로드 가능한 통로 생성
	
	String sMimeType=getServletContext().getMimeType(sFilePath);
	//파일의 MIME 타입 설정
	
	System.out.println("sMimeType >>>" + sMimeType);
	
	if(sMimeType==null){
		sMimeType="application/octet-stream";
		
	}
	// => MIME 타입의 정보가 없을 경우 기본값으로 설정
	
			
	//응답할 데이터를 마임타입으로 사용하겠다라는 설정
	response.setContentType(sMimeType);
	
	///////////////////////////////////////////////////////////////////
	
	//브라우저에 따른 처리 ie
	
	String agent=request.getHeader("User-Agent");
	// => 접근한 사용자의 브라우저 정보 확인
	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
	
	System.out.println(" ieBrowser >> " + ieBrowser);
	
	if(ieBrowser){//ie일 때 ㅡ> 다운로드 시 한글파일 깨짐, 공백문자를 "+"로 표시 ->"%20" 공백문자
		//"부산 =+아이티윌+수강생.txt"=>"부산 아이티윌 수강생.txt"
		file_name=URLEncoder.encode(file_name, "UTF-8").replaceAll("\\+","%20");
		
		
	}else{//ie아닐 때
		file_name=new String(file_name.getBytes("UTF-8"), "iso-8859-1");
	}
	
	/////////////////////////////////////////////////////////////////////////
	
	// 브라우저에서 읽을 수 있는 파일은 다운로드 X
	// 모든 파일을 다운로드 형태로 처리 할 수 있도록 설정
	response.setHeader("Content-Disposition", "attachment; filename="+file_name);
	
	
	///////////////////////////////////////////////////////////////////////
	// servlet 객체 생성 시(jsp 파일 실행 시)out 내장객체 자동생성
	// 추가적으로 out객체를 생성했기 때문에 에러 발생
	
	// 기존의 out객체를 정리
	out.clear();
	out=pageContext.pushBody();
	///////////////////////////////////////////////////////////////////////
	
	// 다운로드 시작
	
	//출력스트림 생성
	ServletOutputStream out2= response.getOutputStream();
	
	int data;
	while( (data = fis.read(b,0,b.length)) != -1){	// -1 파일의 끝(EOF)
		out2.write(b,0,data);
	}
	out2.flush(); 	//배열(버퍼)에 빈공간을 채워서 전달
	out2.close();
	fis.close(); 
%>
</body>
</html>