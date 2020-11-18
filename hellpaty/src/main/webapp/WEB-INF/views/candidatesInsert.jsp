<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현직자 개별등록</title>
<style type="text/css">
body {
	font-size: 12px;
	font-family: sans-serif;
}
</style>
</head>
<body>
	<h2>-현직자 개별등록-</h2>
	<form action="${cpath}/cinsert.do" method="POST">
		<table border="0">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>남자<input name="sex" type="radio" value="남">
					여자<input name="sex" type="radio" value="여"></td>
			</tr>
			<tr>
				<td>회사코드</td>
				<td><input type="text" name="code"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="등록">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
<%
  String radioValue=request.getParameter("sex");
%>

</html>