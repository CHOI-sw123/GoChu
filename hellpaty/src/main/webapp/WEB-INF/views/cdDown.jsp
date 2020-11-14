<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="utf-8"%>
<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "inline; filename=cdBatch_registration.xls");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엑셀 다운로드</title>
</head>
<body>
<table border="1">
<thead>
<tr>
<th>이름</th>
<th>성별</th>
<th>지원일</th>
<th>회사코드</th>
</tr>
</thead>

</table>
</body>
</html>