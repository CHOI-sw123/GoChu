<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function elistFn() {
		location.href = "${cpath}/elist.do";
	}
	function edeleteFn(enumber){
		location.href = "${cpath}/edelete.do?enumber="+enumber;
	}
</script>


</head>
<body>
	- 현직자 정보 상세보기(View) -
	<form action='${cpath}/eupdate.do' method='post'>
		<table border="1">
			<input type='hidden' name='enumber' value="${vo.enumber}" />
			<tr>
				<td>번호</td>
				<td>${vo.enumber}</td>
			</tr>
			<tr>
				<td>직무</td>
				<td><input type='text' name='dept_name' value='${vo.duty}' /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${vo.sex}</td>
			</tr>
			<tr>
				<td>회사코드</td>
				<td>${vo.code}'</td>
				</tr>
			<tr>
				<td align='center' colspan='2'>
				<input type="submit" value='수정'/> 
				<input type='button' value='삭제' onclick="edeleteFn(${vo.enumber})"/> 
				<input type='button' value='취소'  onclick="elistFn()"/> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>