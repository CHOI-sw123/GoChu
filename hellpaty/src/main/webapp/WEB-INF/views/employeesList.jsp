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
#member_side{
margin-top: 90px;
margin-left: 105px;

}
#btn {
	position: relative;
	
	
    bottom: 84px;
    left: 663px;
    width: 84px;
    height: 35px;
    background-color: rgb(0,0,0,0);
  

}
#keywordInput{
position: relative;
 bottom: 96px;
 left: 194px;
 width: 354px;
 border: 0px;
 outline: none;
}

ul{
   display:  flex;
   list-style: none;
   position: relative;
   bottom: 405px;
  

}
ul li {
	margin-left: 92px;
	align-content: center;
}
#bottom_menu{
 position: relative;
 bottom: 89px;
 display: flex;
}
#number img{
 padding-left: 7px;

}
#searchBtn{
position: relative;


    right: 309px;
    bottom: 83px;
    width: 123px;
    height: 35px;
    top: -87;

}
</style>

</head>
<body>

<div id="total_menu_bar">
		<div id="menu_bar">
			<img src="<spring:url value='/resources/image/menu_bar.png'/>">
		</div>
		<div id="menu_bar_sub">
			<img src="<spring:url value='/resources/image/login_side_bar.png'/>">
				<div id ="member_side">
		<img src="<spring:url value='/resources/image/Inmembership.png'/>"/>
		<img src="<spring:url value='/resources/image/center.png'/>">
			<input type="button">
			<img src="<spring:url value='/resources/image/bottom.png'/>">
			
			
			
				<div id="menu_total">
	<a href="${cpath}/main.do"><div ><img src="<spring:url value='/resources/image/Logo_sub.png'/>" style="margin-bottom: 165px; "></div></a>
	<a href="${cpath}/logout.do"><div id="logout"><img src="<spring:url value='/resources/image/logout.png'/>" style="margin-left: 13px; margin-top: 4px;"></div></a>
	</div></a>
	
	
	<div id ="three_menu" style="left: 35px;"/>
	<a href="${cpath}/elist.do"><div><img src="<spring:url value='/resources/image/first_side_menu.png'/>" style="margin-top: 10px;"></div></a>
	<a href="${cpath}/clist.do"><div><img src="<spring:url value='/resources/image/second_side_menu.png'/>"></div></a>
	<a href="${cpath}/result.do"><div><img style="bottom: 5px;" src="<spring:url value='/resources/image/three_side_menu.png'/>" style="margin-top: 10px;">
	</div>
			
				<div class="search">
					<select id="btn" name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>직무</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>성별</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${cri.keyword}" />

					<button id="searchBtn" type="button">검색</button>
				</div>
		<FORM name='frm' method='GET' action="${cpath}/elist.do">
			<!-- 			<ul>
				<li style="margin-left: 47px;">지원번호</li>
				<li >직무</li>
				<li style="margin-left: 109px;">이름</li>
				<li style="margin-left: 145px;">성별</li>
				<li style="margin-left: 120px;">회사코드</li>
			</ul> -->
			<c:forEach var="vo" items="${elist}">
							<ul>
				<li style="margin-left: 47px;">${vo.enumber}</li>
				<li >${vo.duty}</li>
				<li style="margin-left: 109px;">${vo.name}</li>
				<li style="margin-left: 145px;">${vo.sex}</li>
				<li style="margin-left: 120px;">${vo.code}</li>
			
			</ul>
			</c:forEach>
		</FORM>
		<div id="bottom_menu">
		<div>
			<td align="right"><input type="button" value="개별등록"
				onclick="einsertFn()" /></td>
			<td colspan="3" align="right">

				<form id="form2" name="form2" method="post"
					enctype="multipart/form-data">
					<img  src="<spring:url value='/resources/image/pice_upload.png'/>">
					<input type="file" id="fileInput" name="fileInput">
						<img  src="<spring:url value='/resources/image/file_choice.png'/>">
					<button type="button" onclick="doExcelUploadProcess()">엑셀업로드</button>
			</div>
				</form>

			
			<div style="margin-left: 160px;">
			<img  src="./image/ex_upload.png">
			<img  src="./image/ex_download.png">
			</div>
			<td colspan="5" align="right">
				<form name="form1" method="post">
					<input type="button" value="excel down" onClick="excelDown()" />
				</form>
				<div>
							<div id ="number" style="margin-left: 160px;">
			<img  src="<spring:url value='/resources/image/one.png'/>">
			<img  src="<spring:url value='/resources/image/teo.png'/>">
			<img  src="<spring:url value='/resources/image/three.png'/>">
			<img  src="<spring:url value='/resources/image/four.png'/>">
			<img  src="<spring:url value='/resources/image/five.png'/>">
			</div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="elist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

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
</body>
</html>