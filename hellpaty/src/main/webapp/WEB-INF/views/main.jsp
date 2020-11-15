<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function employeeslogin() {
		//javascript session get
		var f = document.form1;
		if("${m.cpuid}"==""){
		f.action = "${cpath}/memberlogin.do";
		f.submit();
		}
		else{
			f.action = "${cpath}/elist.do";
			f.submit();
		}
	}
	
	function candidateslogin() {
		var f = document.form2;
		if("${m.cpuid}"==""){
			f.action = "${cpath}/memberlogin.do";
			f.submit();
			}
		else{
		f.action = "${cpath}/clist.do";
		f.submit();
		}
	}
	
	function resultlogin() {
		var f = document.form3;
		if("${m.cpuid}"==""){
			f.action = "${cpath}/memberlogin.do";
			f.submit();
			}
			else{
		f.action = "${cpath}/result.do";
		f.submit();
		}
	}
	function membership() {
		var f = document.form4;
		f.action = "${cpath}/membership.do";
		f.submit();
	}
	
	function memberlogin() {
		var f = document.form5;
		f.action = "${cpath}/memberlogin.do";
		f.submit();
	}

</script>

</head>
<body>
	<table>
	<tr>
		<form name="form1" method="post">
			<input type="button" value="현직자" onClick="employeeslogin()" />
		</form>
		<form name="form2" method="post">
			<input type="button" value="지원자" onClick="candidateslogin()" />
		</form>
		<form name="form3" method="post">
			<input type="button" value="분석하기" onClick="resultlogin()" />
		</form>
		</tr>
		<tr>
		<td><form name="form4" method="post">
			<input type="button" value="회원가입" onClick="membership()" />
		</form></td>
		<td><form name="form5" method="post">
			<input type="button" value="로그인" onClick="memberlogin()" />
		</form></td>
		</tr>
		<!-- 세션 스코프를 통해 m으로 선언된 변수명에 m_id를 찾아서 출력 -->
        ${m.cpuid}님 안녕하세요. <br>
        <a href = "${cpath}/logout.do">로그아웃</a>
		</table>
</body>
</html>