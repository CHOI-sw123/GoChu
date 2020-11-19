<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
top: 60%; 
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
<title>Insert title here</title>
</head>
<body>
<a href = "${cpath}/result.do">결과메인으로</a></br>
    <a href = "${cpath}/resultDuty.do">직무별</a>
    <a href = "${cpath}/resultCandidate.do">지원자별</a>
        <a href = "${cpath}/resultDetails.do">세부정보</a>
        
               
        	<div id="total_menu_bar">
		<div id="menu_bar">
		
		<span style="position: absolute;top: 214px;left: 35px;">최성우</span>
			<img src="<spring:url value='/resources/image/menu_bar.png'/>">
		</div>
		<img style="height: 945px;" src="<spring:url value='/resources/image/bunseock_side.png'/>">
		<div id="member_side">
			<img src="<spring:url value='/resources/image/bun_second.png'/>" /> 
			
			
			<div style="margin-left: 46px;">
             <p style="position: absolute;position: absolute;left: 790px;top: 231px;">지원자 : 최성우</p>

			<img  src="<spring:url value='/resources/image/case.png'/>">
			에 해당되는 분석결과 입니다.
			
			</div>

				<ul class="grapn">
				<li>
				
				<div>
					<span style=" height: 10%; ">
					<p >10%</p>
					</span>
					
				</div>
				<p>데이터10</p>
				</li>
				<li>
				
				<div>
					<span style=" height: 20%; ">
					<p >20%</p>
					</span>
					
				</div>
				<p>데이터20</p>
				</li>
				<li>
				
				<div>
					<span style=" height: 30%; "><p >30%</p></span>
				</div>
				<p>데이터30</p>
				</li>
				<li>
				
				<div>
					<span style=" height: 40%; "><p >40%</p></span>
				</div>
				<p>데이터40</p>
				</li>
				<li>
				
				<div>
					<span style=" height: 50%; "><p >50%</p></span>
				</div>
				<p>데이터50</p>
				</li>
				<li>
				
				<div>
					<span style=" height: 60%; "><p >60%</p></span>
				</div>
				<p>데이터60</p>
				</li>
				<li>
				
				<div>
					<span style=" height: 70%; "><p >70%</p></span>
				</div>
				<p>데이터70</p>
				</li>
				<li>
				
				<div>
					<span style=" height: 80%; "><p >80%</p></span>
				</div>
				<p>데이터80</p>
				</li>
				<li>
				
				<div>
					<span style=" height: 90%; "><p >90%</p></span>
				</div>
				<p>데이터90</p>
				</li>
				
				
				</ul>

		</div>

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
</html>