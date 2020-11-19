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
<script type="text/javascript">
	function doExcelUploadProcess() {
		var f = new FormData(document.getElementById('form2'));
		$.ajax({
			url : "${cpath}/epExcelUp.do",
			data : f,
			processData : false,
			contentType : false,
			type : "POST",
			success : function(data) {
				console.log(data);
				//document.getElementById('result').innerHTML = JSON.stringify(data);
				alert("업로드성공");
				location.href = "${cpath}/elist.do";
			}
		})
	}
	function einsertFn() {
		location.href = "${cpath}/einsertForm.do";
	}
	function excelDown() {
		var f = document.form1;
		f.action = "${cpath}/epDown.do";
		f.submit();
	}

	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "elist.do" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
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
	
</script>

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
	bottom: 1010px;
	margin: 0;
	left:5px;
	height: 500px;
	width: 214px;
}

#three_menu {
	position: relative;
	bottom: 1119px;
	left: 51;
	width: 214px;
}
#member_side{
margin-top: 90px;
margin-left: 105px;

}
#btn {
	position: relative;
	
    bottom: 84px;
    left: 145px;
    width: 100px;
    height: 20px;
    background-color: rgb(0,0,0,0);
  
}

#keywordInput{
position: relative;
 bottom: 34px;
 left: 140px;
 width: 350px;
 height: 33px;
 border: 0px;
 outline: none;
}

ul{
   display:  flex;
   list-style: none;
   position: relative;
   bottom: 400px;

}

ul li {
	align-content: center;
}
span {
display: inline-block;
width: 70px;
text-align: center
}

#bottom_menu{
 position: relative;
 bottom: 160px;
 left: 10px;
 display: flex;
}

#number img{
 padding-left: 7px;
}

#searchBtn{
position: relative;
    right: -550px;
    bottom: 70px;
    width: 100px;
    height: 35px;
    top: -87;

}

#searchType{
width : 120px;
height : 35px;
border:none;
border-radius:0;
}

#paging{
bottom: 250px;
left: 300px;
}

#cpuid{
left: 100px;
}
</style>

</head>
<body>

<div id="total_menu_bar">

		<div id="menu_bar">
			<img src="<spring:url value='/resources/image/menu_bar.png'/>">
	</div>	
				<div id ="member_side">
		<img src="<spring:url value='/resources/image/Inmembership.png'/>"/><br/>
	
		<img src="<spring:url value='/resources/image/center.png'/>">
			<div id="btn">
					<select id="searchType" name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>직무</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>성별</option>
					</select>		
					<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" />
						<a id="searchBtn" type="button">..... </a>
				</div>
			<!-- <input type="button"> -->
		<FORM name='frm' method='GET' action="${cpath}/elist.do">
			<img src="<spring:url value='/resources/image/employees.png'/>">
			<!-- 			<ul>
				<li style="margin-left: 47px;">지원번호</li>
				<li >직무</li>
				<li style="margin-left: 109px;">이름</li>
				<li style="margin-left: 145px;">성별</li>
				<li style="margin-left: 120px;">회사코드</li>
			</ul> -->
			<c:forEach var="vo" items="${elist}">
			<ul height="10px">
				<li><span style="width:150px">${vo.enumber}</span></li>
				<li><span style="width:150px">${vo.duty}</span></li>
				<li><span style="width:150px">${vo.name}</span></li>
				<li><span style="width:200px">${vo.sex}</span></li>
				<li><span style="width:150px">${vo.code}</span></li>
			</ul>
			</c:forEach>
		</form>
		<div id="bottom_menu">
		<div><form id="form2" name="form2" method="post" enctype="multipart/form-data">
			<a type="button" onclick="einsertFn()">
			<img  src="<spring:url value='/resources/image/pice_upload.png'/>"></a>
				
					<input type="file" id="fileInput" name="fileInput" style='display: none;'>
						<img  src="<spring:url value='/resources/image/file_choice.png'/>" onclick='document.all.fileInput.click();'></input>
					<a type="button" onclick="doExcelUploadProcess()"><img  src="<spring:url value='/resources/image/ex_upload.png'/>"></a>
			</form>
			<form name="form1" method="post">
					<a id="exceldown" type="button" value="excel down" onClick="excelDown()">
					<img src="<spring:url value='/resources/image/ex_download.png'/>"></a>
				</form>
			</div>
				
				</div>
					<ul id="paging">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="elist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>
			<!-- 	<div id ="number" style="margin-left: 160px;">
		<img  src="<spring:url value='/resources/image/one.png'/>">
			<img  src="<spring:url value='/resources/image/teo.png'/>">
			<img  src="<spring:url value='/resources/image/three.png'/>">
			<img  src="<spring:url value='/resources/image/four.png'/>">
			<img  src="<spring:url value='/resources/image/five.png'/>">
		</div> -->
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="elist.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="elist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
			</div>	
			
				</div>

				<div id="menu_total">
	<a href="${cpath}/main.do"><div ><img src="<spring:url value='/resources/image/Logo_sub.png'/>" style="margin-bottom: 165px; "></div></a>
	<p id="cpuid">${m.cpuid}</p>
	<a href="${cpath}/logout.do"><div id="logout" style="left:45px;  position: fixed; bottom:645px;"><img src="<spring:url value='/resources/image/logout.png'/>" style="margin-left: 13px; margin-top: 2px;"></div></a>
	</div>
	
	<div id ="three_menu" style="left: 35px;"/>
	<a href="${cpath}/elist.do"><div><img src="<spring:url value='/resources/image/first_side_menu.png'/>" style="margin-top: 10px;"></div></a>
	<a href="${cpath}/clist.do"><div><img src="<spring:url value='/resources/image/second_side_menu.png'/>"></div></a>
	<a href="${cpath}/result.do"><div><img style="bottom: 5px;" src="<spring:url value='/resources/image/three_side_menu.png'/>" style="margin-top: 10px;"></a>
				
</body>
</html>