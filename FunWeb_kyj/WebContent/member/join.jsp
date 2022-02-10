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
<script>
	//checkId()
	function checkId(){
		if(document.fr.id.value == ""){
			alert("아이디를 입력하시오.");
			document.fr.id.focus();
			return false;
		}
		if(!(document.fr.id.value.length>=5 && document.fr.id.value.length<=12)){
			alert("5~12자리 아이디를 입력하시오");
			document.fr.id.focus();
			return false;	
		}
		
		window.open("checkId.jsp?id="+document.fr.id.value,"","width=500, height=300");
	}
	//checkId()
	
	
	//checkName()
	function checkName(){
		if(document.fr.name.value == ""){
			alert("이름을 입력하시오.");
			document.fr.name.focus();
			return false;
		}
		
		
		window.open("checkName.jsp?name="+document.fr.name.value,"","width=500, height=300");
	}
	//checkName()
	
	//checkJoin()
	function checkJoin(){
		////////////////////////////////////////////////////////////////////////
		/* if(document.fr.id.value == ""){
			alert("아이디를 입력하시오.");
			document.fr.id.focus();
			return false;
		} */
		////////////////////////////////////////////////////////////////////////
		
		if(!(document.fr.id.value.length>=5 && document.fr.id.value.length<=12)){
			alert("5~12자리 아이디를 입력하시오");
			document.fr.id.focus();
			return false;	
		}
		
		
		//비밀번호, 확인 - 입력, 값 동일여부 체크
		if(document.fr.pass1.value==""){
			alert("비밀번호를 입력하시오.");
			document.fr.pass1.focus();
			return false;
		}
		if(document.fr.pass2.value==""){
			alert("비밀번호를 확인하시오.");
			document.fr.pass2.focus();
			return false;
		}
		
		if(document.fr.pass1.value!=document.fr.pass2.value){
			alert("비밀번호와 확인 데이터가 일치하지 않습니다.");
			document.fr.pass2.select();
			return false;
		}
		
		//이메일
		if(document.fr.email.value==""){
			alert("이메일을 입력하시오.");
			document.fr.pass1.focus();
			return false;
		}
		
	}
	//checkJoin()


	//우편번호
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipCode").value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	//우편번호
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
<%-- <jsp:include page="../inc/left.jsp"/> --%>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>회원가입</h1>




<form action="joinPro.jsp" name="fr" id="join" onsubmit="return checkJoin();">
<fieldset>
<legend>기본정보</legend>
<label>아이디 *</label>
<input type="text" name="id" class="id" >
<input type="button" value="중복확인" class="dup" onclick="checkId()"><br>
<label>비밀번호 *</label>
<input type="password" name="pass1"><br>
<label>비밀번호 확인 *</label>
<input type="password" name="pass2"><br>
<label>이름 *</label>
<input type="text" name="name">
<input type="button" value="중복확인" class="dup" onclick="checkName()"><br> 
<label>이메일 *</label>
<input type="email" name="email"><br>
<label>주소</label>
<!--  -->
<input type="text" id="zipCode" name="zipCode" placeholder="우편번호" >
<input type="button" onclick="findAddress()" name="find" value="우편번호 찾기" class="dup"><br>
<input type="text" id="address" name="address" placeholder="주소">
<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목"><br>
<!--  -->

</fieldset>

<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<!-- <input type="button" value="회원가입" class="submit" onclick="location.href='joinPro.jsp'; "> -->
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