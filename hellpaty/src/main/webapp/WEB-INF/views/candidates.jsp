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
	function insertFn() {
		location.href = "${cpath}/insertForm.do";
	}
</script>

</head>
<body>
	<h2>- Spring MVC 회원리스트보기 -</h2>
	<table>
		<tr bgcolor="gray">
			<td>번호</td>
			<td>이름</td>
			<td>아이디</td>
			<td>이메일</td>
			<td>전화번호</td>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.num}</td>
				<td><a href="${cpath}/content.do?num=${vo.num}">${vo.name}</a></td>
				<td>${vo.id}</td>
				<td>${vo.email}</td>
				<td>${vo.phone}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="right"><input type="button" value="회원가입"
				onclick="insertFn()" /></td>
		</tr>
	</table>
</body>
</html>