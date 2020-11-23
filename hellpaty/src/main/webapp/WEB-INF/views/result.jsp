<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
<style type="text/css">

        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */
        }
        
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
 
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
        
</style>

</head>

<body>

	<div id="total_menu_bar">
		<div id="menu_bar">
		<span style="position: absolute;top: 214px;left: 10px;">${m.cpuid}</span>
			<img src="<spring:url value='/resources/image/menu_bar.png'/>">
		</div>
		<img style="height: 945px;" src="<spring:url value='/resources/image/bunseock_side.png'/>">
		<div id="member_side">
			<img src="<spring:url value='/resources/image/boonseock.png'/>" /> 
		
			<img src="<spring:url value='/resources/image/check_upload.png'/>">
				
				<div style="width: 200px;position: relative;left: 821px;bottom: 282px;">
              <a href="${cpath}/resultCandidate.do"><div><img  src="<spring:url value='/resources/image/members.png'/>"/></div></a>
               <a href="${cpath}/resultDuty.do"><div><img  src="<spring:url value='/resources/image/inmembers.png'/>"/></div></a>
           </div>
           
			<p style="width: 800px; margin-left: 125px; position: relative; bottom: 96px;">
				<a class="btn"><img src="<spring:url value='/resources/image/gruop_load.png'/>"></a> 
				<a href="##"><img style="margin-left: 208px;" src="<spring:url value='/resources/image/solo_load.png'/>"></a>
			</p>
		</div>
	</div>

	<div id="menu_total">
		<a href="${cpath}/main.do"><div>
				<img src="<spring:url value='/resources/image/Logo_sub.png'/>" style="margin-bottom: 165px;">
			</div></a> <a href="${cpath}/logout.do"><div id="logout">
				<img src="<spring:url value='/resources/image/logout.png'/>"
					style="margin-left: 13px; margin-top: 4px;">
			</div></a>
	</div>
	</a>

	<div id="three_menu" style="left: 35px;" />
	<a href="${cpath}/clist.do"><div>
			<img src="<spring:url value='/resources/image/first_side_menu.png'/>" style="margin-top: 10px;">
		</div></a>
	<a href="${cpath}/elist.do"><div>
			<img src="<spring:url value='/resources/image/second_side_menu.png'/>">
		</div></a>
	<a href="${cpath}/result.do"><div>
			<img style="bottom: 5px;" src="<spring:url value='/resources/image/three_side_menu.png'/>"
				style="margin-top: 10px;"></a>
		</div>

<!-- --------------------------------------------------------------------------------------- -->
		
    <!-- 두 번째 Modal을 여는 클래스 -->
     
    <!-- 두 번째 Modal -->
    <div class="modal">

      <!-- 두 번째 Modal의 내용 -->
      <div class="modal-content">
      <input type="text"/><input type="button" value="검색"/>
        <span class="close">&times;</span>
        <form id="frmReq" action="http://localhost:9000/" method="POST">
	        <c:forEach var="vo" items="${rlist}">
	       	 <p><input type="checkbox" name="rlist" value="${vo.handwriting_c}" />${vo.name}</p>
	        </c:forEach>
	        <input id="btn" type="submit" name="btn" value="등록"/>
		</form>
      </div>
    </div>

</body>

<script type="text/javascript">
// script 는 /body 아래쪽에 위치하는것이 좋음(실제 아래로 내리니까 실행됨..ㄷㄷ)
function employeeslogin() {
	//javascript session get
	var f = document.form10;
	if("${m.cpuid}"==""){
	f.action = "${cpath}/memberlogin.do";
	f.submit();
	}
	else{
		f.action = "${cpath}/elist.do";
		f.submit();
	}
}
function candidateslogin() {
	var f = document.form20;
	if("${m.cpuid}"==""){
		f.action = "${cpath}/memberlogin.do";
		f.submit();
		}
	else{
	f.action = "${cpath}/clist.do";
	f.submit();
	}
}

function resultlogin() {
	var f = document.form30;
	if("${m.cpuid}"==""){
		f.action = "${cpath}/memberlogin.do";
		f.submit();
		}
		else{
	f.action = "${cpath}/result.do";
	f.submit();
	}
}
function mainlogin() {
	var f = document.form100;
	f.action = "${cpath}/main.do";
	f.submit();
}

//Modal을 가져옵니다.
var modals = document.getElementsByClassName("modal");
// Modal을 띄우는 클래스 이름을 가져옵니다.
var btns = document.getElementsByClassName("btn");
// Modal을 닫는 close 클래스를 가져옵니다.
var spanes = document.getElementsByClassName("close");
var funcs = [];
 
// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
function Modal(num) {
  return function() {
    // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
    btns[num].onclick =  function() {
        modals[num].style.display = "block";
        console.log(num);
    };
 
    // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
    spanes[num].onclick = function() {
        modals[num].style.display = "none";
    };
  };
}
 
// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
for(var i = 0; i < btns.length; i++) {
  funcs[i] = Modal(i);
}
 
// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
for(var j = 0; j < btns.length; j++) {
  funcs[j]();
}
 
// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
window.onclick = function(event) {
  if (event.target.className == "modal") {
      event.target.style.display = "none";
  }
};


</script>
</html>
