<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="utf-8"%>
<%

response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "inline; filename=epBatch_registration.xls");

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
<th>직무</th>
<th>이름</th>
<th>성별</th>
<th>입사일</th>
<th>필체이미지경로</th>
<th>유형1</th>
<th>유형2</th>
<th>유형3</th>
<th>유형4</th>
<th>유형5</th>
<th>유형6</th>
<th>유형7</th>
<th>유형8</th>
<th>유형9</th>
<th>회사코드</th>
<th>성향ID</th>
</tr>
</thead>

</table>
</body>
</html>