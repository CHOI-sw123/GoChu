<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function employeeslogin() {
	var f = document.form10;
	f.action = "${cpath}/elist.do";
	f.submit();
}

function candidateslogin() {
	var f = document.form20;
	f.action = "${cpath}/clist.do";
	f.submit();
}
function resultlogin() {
	var f = document.form30;
	f.action = "${cpath}/result.do";
	f.submit();
}
function mainlogin() {
	var f = document.form100;
	f.action = "${cpath}/main.do";
	f.submit();
}

</script>


</head>

<body>
<form name="form100" method="post">
		<input type="button" value="로고" onClick="mainlogin()" />
	</form>
<!-- 세션 스코프를 통해 m으로 선언된 변수명에 m_id를 찾아서 출력 -->
        ${m.cpuid}님 안녕하세요. <br>
        <a href = "${cpath}/logout.do">로그아웃</a>
<h1>분석하기</h1>
<table>
		<form name="form10" method="post">
			<input type="button" value="현직자" onClick="employeeslogin()" />
		</form>
		<form name="form20" method="post">
			<input type="button" value="지원자" onClick="candidateslogin()" />
		</form>
		<form name="form30" method="post">
			<input type="button" value="분석하기" onClick="resultlogin()" />
		</form>
			<p>${m.cpuid}님 환영 합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</table>
</body>
</html>