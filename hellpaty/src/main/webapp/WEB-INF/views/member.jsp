<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>

<style type="text/css">
body {
	font-size: 12px;
	font-family: sans-serif;
}
</style>
</head>
<body>
	<h3>## 회원가입 페이지 ##</h3>
        <input type = "text" id = "cpuid" placeholder="아이디"><br>
        <input type = "password" id = "cpupw" placeholder="비밀번호"><br>
        <input type = "text" id = "code" placeholder="회사코드"><br>
        <button id = "register_process">회원가입</button>
        <p>만약 로그인 할 아이디가 있다면 <a href = "${cpath}/memberlogin.do">여기</a>를 눌러주세요.</p>
        
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
        <script>
        $(document).ready(function(){
            $("#register_process").click(function(){
                var json = {
                		cpuid : $("#cpuid").val(),
                		cpupw : $("#cpupw").val(),
                		code : $("#code").val()
                };
                
                for(var str in json){
                    if(json[str].length == 0){
                        alert($("#" + str).attr("placeholder") + "를 입력해주세요.");
                        $("#" + str).focus();
                        return;
                    }
                }
                 $.ajax({
                    type : "post",
                    url : "${cpath}/register.do",
                    data : json,
                    success : function(){
                    	alert("정상적으로 회원가입 되었습니다.");
                    },
                    error : function(error) {
                    	alert("오류 발생"+ error);
                    }
                });
        })

        </script>
</body>
</html>

<%--                     success : function(data) {
                        switch (data.length) {
                        case 0:
                            alert("정상적으로 회원가입 되었습니다.");
                            location.href = "${cpath}/memberLogin.do";
                            break;
                        case 1:
                            alert("아이디가 중복 되었습니다.");
                            break;
                     default:
                            alert("알수없는 오류가 발생 했습니다. [Error Code :" + Number(data) + "]");
                            break;
                        }
                    }, 
                    
                    if(${m.cpuid}.val() == null) {
                    		
                    		};
                    	else {
                    		alert("이미 등록된 아이디입니다.")
                    		};,
                    --%>