<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>

<style type="text/css">
body {
	font-size: 12px;
	font-family: sans-serif;
}
</style>
</head>
<body>
	<h3>## ȸ������ ������ ##</h3>
        <input type = "text" id = "cpuid" placeholder="���̵�"><br>
        <input type = "password" id = "cpupw" placeholder="��й�ȣ"><br>
        <input type = "text" id = "code" placeholder="ȸ���ڵ�"><br>
        <button id = "register_process">ȸ������</button>
        <p>���� �α��� �� ���̵� �ִٸ� <a href = "${cpath}/memberlogin.do">����</a>�� �����ּ���.</p>
        
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
                        alert($("#" + str).attr("placeholder") + "�� �Է����ּ���.");
                        $("#" + str).focus();
                        return;
                    }
                }
                 $.ajax({
                    type : "post",
                    url : "${cpath}/register.do",
                    data : json,
                    success : function(){
                    	alert("���������� ȸ������ �Ǿ����ϴ�.");
                    },
                    error : function(error) {
                    	alert("���� �߻�"+ error);
                    }
                });
        })

        </script>
</body>
</html>

<%--                     success : function(data) {
                        switch (data.length) {
                        case 0:
                            alert("���������� ȸ������ �Ǿ����ϴ�.");
                            location.href = "${cpath}/memberLogin.do";
                            break;
                        case 1:
                            alert("���̵� �ߺ� �Ǿ����ϴ�.");
                            break;
                     default:
                            alert("�˼����� ������ �߻� �߽��ϴ�. [Error Code :" + Number(data) + "]");
                            break;
                        }
                    }, 
                    
                    if(${m.cpuid}.val() == null) {
                    		
                    		};
                    	else {
                    		alert("�̹� ��ϵ� ���̵��Դϴ�.")
                    		};,
                    --%>