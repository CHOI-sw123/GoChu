<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href = "${cpath}/result.do">결과메인으로</a></br>
    <a href = "${cpath}/resultDuty.do">직무별</a>
    <a href = "${cpath}/resultCandidate.do">지원자별</a>
        <a href = "${cpath}/resultDetails.do">세부정보</a>
</body>
</html>