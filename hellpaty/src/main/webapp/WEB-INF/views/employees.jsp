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
	<h2>- 현직자리스트보기 -</h2>
	<table>
		<tr bgcolor="gray">
			<td>사원번호</td>
			<td>부서명</td>
			<td>이름</td>
			<td>성별</td>
			<td>입사일</td>
		</tr>
		<c:forEach var="vo" items="${elist}">
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