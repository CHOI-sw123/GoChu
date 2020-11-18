<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	max-height: 100%;
	max-width: 100%;
	margin: 0px;
}

#top_Logo {
	height: 10rem;
	width: 20rem;
}

#top_Logo  img {
	height: 7rem;
	width: 12rem;
}

#center_Logo {
	height: 10rem;
	position: absolute;
	top: 7rem;
	left: 36%;
}

#center_Logo img {
	height: 10rem;
	top: 8rem;
	width: 30rem;
	height: 13rem;
	width: 601px;
	height: 312px;
	z-index: 1;
}

#bottom_menu {
	height: 33rem;
	position: relative;
	top: 14.5rem;
	display: flex;
	align-content: center;
	left: 16%;
}

.menu_ber {
	height: 100%;
	width: 18%;
	margin-left: 5rem;
}

.menu_ber img {
	width: 23rem;
}
</style>
</head>
<body>
	<div id="top_Logo">
		<img src="<spring:url value='/resources/image/Main_Logo.png'/>"/>
	</div>
	
	<div id="center_Logo">
		<img src="<spring:url value='/resources/image/Center_Logo.png'/>"/>
	</div>
	
	<div id="bottom_menu">

		<div class=menu_ber>
			<a href="${cpath}/membership.do"><img src="<spring:url value='/resources/image/right_menu.png'/>"/></a>
		</div>
		<div class=menu_ber>
			<a href="${cpath}/memberlogin.do"><img style="padding-top: 8rem;" src="<spring:url value='/resources/image/Center_menu.png'/>"/></a>
		</div>
		<div class=menu_ber>
			<a href="${cpath}/result.do"><img src="<spring:url value='/resources/image/left_menu.png'/>"/></a>
		</div>
</body>
</html>
<%-- 	</div>
		<form name="form1" method="post">
			<input type="button" value="현직자" onClick="employeeslogin()" />
		</form>
		<form name="form2" method="post">
			<input type="button" value="지원자" onClick="candidateslogin()" />
		</form>
		<form name="form3" method="post">
			<input type="button" value="분석하기" onClick="resultlogin()" />
		</form>
		<form name="form4" method="post">
			<input type="button" value="회원가입" onClick="membership()" />
		</form>
		<form name="form5" method="post">
			<input type="button" value="로그인" onClick="memberlogin()" />
		</form></td>
		</tr>
		<!-- 세션 스코프를 통해 m으로 선언된 변수명에 m_id를 찾아서 출력 -->
        ${m.cpuid}님 안녕하세요. <br>
        <a href = "${cpath}/logout.do">로그아웃</a>
		</table> --%>