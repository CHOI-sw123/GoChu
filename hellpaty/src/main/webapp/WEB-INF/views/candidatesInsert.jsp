<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �������</title>
<style type="text/css">
body {
	font-size: 12px;
	font-family: sans-serif;
}
</style>
</head>
<body>
	<h2>-������ �������-</h2>
	<form action="${cpath}/cinsert.do" method="POST">
		<table border="0">
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>����</td>
				<td>����<input name="sex" type="radio" value="��">
					����<input name="sex" type="radio" value="��"></td>
			</tr>
			<tr>
				<td>ȸ���ڵ�</td>
				<td><input type="text" name="code"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="���">
				<input type="reset" value="���"></td>
			</tr>
		</table>
	</form>
</body>
<%
  String radioValue=request.getParameter("sex");
%>

</html>