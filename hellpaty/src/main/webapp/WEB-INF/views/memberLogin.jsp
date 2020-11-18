<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
	margin: 0px;
	height: 680px;
}

#menu_bar img {
	margin : 0px;
	padding: 0px;
	height: 59rem;
	width: 300px;
	margin-left: -20px;
}

#total_menu_bar {
	height: 60rem;
	width: 70rem;
	display: flex;
}

#menu_bar_sub img {
	margin: 0px;
	padding: 0px;
	height: 59rem;
	width: 180%;
}

#menu_total{
position: relative;
bottom: 955px;
margin-bottom: 0%;
left: 45px;
height: 500px;
width: 214px;

}
#three_menu{
position: relative;
bottom: 1119px;
left: 51;
width: 214px;
}

</style>

<body>

	<div id="total_menu_bar">
		<div id="menu_bar">
			<img src="<spring:url value='/resources/image/menu_bar.png'/>">
		</div>
		<div id="menu_bar_sub">
			<img src="<spring:url value='/resources/image/login_side_bar.png'/>">
		</div>
	</div>
	
	<div id="menu_total">
	<a href="${cpath}/main.do"><div ><img src="<spring:url value='/resources/image/Logo_sub.png'/>" style="margin-bottom: 165px; "></div></a>
	<a href="##"><div id="logout"><img src="<spring:url value='/resources/image/logout.png'/>" style="margin-left: 13px; margin-top: 4px;"></div></a>
	</div></a>
	
	<div id ="three_menu" style="left: 35px;"/>
	<a href="./memberList.jsp"><div><img src="<spring:url value='/resources/image/first_side_menu.png'/>" style="margin-top: 10px;"></div></a>
	<a href="##"><div><img src="<spring:url value='/resources/image/second_side_menu.png'/>"></div></a>
	<a href="##"><div><img style="bottom: 5px;" src="<spring:url value='/resources/image/three_side_menu.png'/>"style="margin-top: 10px;">
	</div>


 <h3>## 로그인 페이지 ##</h3>
        <input type = "text" id = "cpuid" placeholder="아이디"><br>
        <input type = "password" id = "cpupw" placeholder="비밀번호"><br>
        <button id = "login_process">로그인</button>
        
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
        <script>
        $(document).ready(function(){
            //login_process의 id를 가지는것을 클릭하게 된다면 함수 실행
            $("#login_process").click(function(){
                //json 객체를 생성
                var json = {
                    //m_id의 이름을 가지고 m_id의 id를 가지는 태그의 벨류값을 가져옴 아래도 동일
                    cpuid : $("#cpuid").val(),
                    cpupw : $("#cpupw").val()
                };
                //json을 포이치문 돌림
                for(var str in json){
                    //json[m_id or m_pw]를 돌릴때 길이가 0이면 아래 출력
                    if(json[str].length == 0){
                        //str은 json에 변수명을 가지고 #은 아이디 찾는것 attr은 에트류뷰트의 
                        //placeholder를 찾는것
                        alert($("#" + str).attr("placeholder") + "를 입력해주세요.");
                        //포커스를 올려줌
                        $("#" + str).focus();
                        return;
                    }
                }
                //비동기 통신 선언 (아작스)
                 $.ajax({
                    type : "post", //post로 요청
                    url : "${cpath}/login.do", //login url로 요청
                    data : json, // json데이터를 전성
                    success : function(data) { //성공 하면
                        switch (Number(data)) { //위치문
                        case 0: // 0 일때
                            alert("아이디 또는 비밀번호가 일치하지 않습니다."); //경고 출력
                            break;
                        case 1: // 1 일떄
                            location.href = "${cpath}/main.do"; //로그인 성공시 index페이지 이동
 
                        default:
                            break;
                        }
                    },
                    error : function(error) { //404 500등 오류 발생시 
                        alert("오류 발생"+ error);
                    }
                });
            });
        });
        </script>
</body>
</html>