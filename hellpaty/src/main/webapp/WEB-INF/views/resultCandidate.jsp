<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "no.1"); map.put("y", request.getAttribute("csw")); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "no.2"); map.put("y", request.getAttribute("phs")); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "no.3"); map.put("y", request.getAttribute("khj")); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "no.4"); map.put("y", request.getAttribute("jjw")); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "no.5"); map.put("y", request.getAttribute("a")); list.add(map);

 
String dataPoints = gsonObj.toJson(list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0px;
	height: 680px;
}

#menu_bar img {
	margin: 0px;
	padding: 0px;
	height: 59rem;
	width: 300px;
	margin-left: -20px;
}

#total_menu_bar {
	height: 60rem;
	width: 280px;;
	display: flex;
}

#menu_bar_sub img {
	margin: 0px;
	padding: 0px;
	height: 59rem;
	width: 180%;
}

#menu_total {
	position: relative;
	bottom: 955px;
	margin-bottom: 0%;
	left: 45px;
	height: 500px;
	width: 214px;
}

#three_menu {
	position: relative;
	bottom: 1119px;
	left: 51;
	width: 214px;
}

#member_side {
	margin-top: 90px;
	margin-left: 105px;
}

input {
	position: relative;
	bottom: 84px;
	left: 663px;
	width: 84px;
	height: 35px;
	background-color: rgb(0, 0, 0, 0);
}

ul {
	display: flex;
	list-style: none;
	position: relative;
	bottom: 405px;
}

ul li {
	margin-left: 92px;
	align-content: center;
}

#bottom_menu {
	position: relative;
	bottom: 89px;
	display: flex;
}

#number img {
	padding-left: 7px;
}

.grapn{
position: absolute; 
left: 50%; 
top: 50%; 
transform : translate(-50%, -50%);

    left: 1150px;
    bottom: 0px;


}
.grapn li div {
position: relative; 
width:  50px; 
height: 400px; 

border-radius: 4px 4px 0 0;
margin:  0 auto;

}


.grapn li div span{

position:  absolute;
 left: 0px; 
 right:0px; 
 bottom: 0; 

 background-color: #5e86ff; 
border-radius: 4px 4px 0 0;
}
.grapn li{
	margin-left: 40px;

}
span p{

    padding-left: 9px;
    margin-top: 0px;


}
</style>
</head>
<body>
<a href = "${cpath}/result.do">결과메인으로</a></br>
    <a href = "${cpath}/resultDuty.do">직무별</a>
    <a href = "${cpath}/resultCandidate.do">지원자별</a>
    <a href = "${cpath}/resultDetails.do">세부정보</a>
    	<div id="total_menu_bar">
		<div id="menu_bar">
		
		<span style="position: absolute;top: 214px;left: 35px;">${m.cpuid}</span>
			<img src="<spring:url value='/resources/image/menu_bar.png'/>">
		</div>
		<div id="menu_bar_sub">
		

		</div>
		<img style="height: 945px;" src="<spring:url value='/resources/image/bunseock_side.png'/>">
		<div id="member_side">
			<div id="chartContainer" style="height: 500px; width: 800ps; padding-top: 200px"></div>

	</div>


	<div id="menu_total">
		<a href="./Main.jsp"><div>
				<img src="<spring:url value='/resources/image/Logo_sub.png'/>" style="margin-bottom: 165px;">
			</div></a> <a href="##"><div id="logout">
				<img src="<spring:url value='/resources/image/logout.png'/>"
					style="margin-left: 13px; margin-top: 4px;">
			</div></a>
	</div>
	</a>


	<div id="three_menu" style="left: 35px;" />
	<a href="./memberList.jsp"><div>
			<img src="<spring:url value='/resources/image/first_side_menu.png'/>" style="margin-top: 10px;">
		</div></a>
	<a href="./Inmembership.jsp"><div>
			<img src="<spring:url value='/resources/image/second_side_menu.png'/>">
		</div></a>
	<a href="./bunseock.jsp"><div>
			<img style="bottom: 5px;" src="<spring:url value='/resources/image/three_side_menu.png'/>"
				style="margin-top: 10px;">
		</div>
</body>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title: {
		text: "Deposit Money Banks' Assets to GDP (percent), 2015"
	},
	axisY: {
		suffix: "%",
		includeZero: true
	},
	axisX: {
		title: "Countries"
	},
	data: [{
		type: "column",
		yValueFormatString: "#,##0\"%\"",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>
</html>
