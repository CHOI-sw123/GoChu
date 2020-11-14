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
		var f = document.form1;
		f.action = "${cpath}/elist.do";
		f.submit();
	}
	
	function candidateslogin() {
		var f1 = document.form2;
		f1.action = "${cpath}/clist.do";
		f1.submit();
	}
	
	function resultlogin() {
		var f1 = document.form3;
		f1.action = "${cpath}/result.do";
		f1.submit();
	}
	function membership() {
		var f1 = document.form4;
		f1.action = "${cpath}/membership.do";
		f1.submit();
	}
	
	function memberlogin() {
		var f1 = document.form5;
		f1.action = "${cpath}/memberlogin.do";
		f1.submit();
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