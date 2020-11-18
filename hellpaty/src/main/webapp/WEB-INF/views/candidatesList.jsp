<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			url : "${cpath}/cdExcelUp.do",
			data : f,
			processData : false,
			contentType : false,
			type : "POST",
			success : function(data) {
				console.log(data);
				//document.getElementById('result').innerHTML = JSON.stringify(data);
				alert("업로드성공");
				location.href = "${cpath}/clist.do";
			}
		})
	}

	function cinsertFn() {
		location.href = "${cpath}/cinsertForm.do";
	}

	function cdExcelDown() {
		var f = document.form1;
		f.action = "${cpath}/cdDown.do";
		f.submit();
	}

	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "clist.do" + '${pageMaker.makeQuery(1)}'
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
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>

</head>
<body>
	<form name="form100" method="post">
		<input type="button" value="로고" onClick="mainlogin()" />
	</form>
		<!-- 세션 스코프를 통해 m으로 선언된 변수명에 m_id를 찾아서 출력 -->
        ${m.cpuid}님 안녕하세요. <br>
        <a href = "${cpath}/logout.do">로그아웃</a>

	<h2>- 지원자 리스트보기 -</h2>

	<table style="text-align: center;">
		<form name="form10" method="post">
			<input type="button" value="현직자" onClick="employeeslogin()" />
		</form>
		<form name="form20" method="post">
			<input type="button" value="지원자" onClick="candidateslogin()" />
		</form>
		<form name="form30" method="post">
			<input type="button" value="분석하기" onClick="resultlogin()" />
		</form>
		<tr>
			<td colspan="5" align="right">
				<div class="search">
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>이름</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>성별</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${cri.keyword}" />

					<button id="searchBtn" type="button">검색</button>
				</div>
			</td>
		</tr>
		<FORM name='frm' method='GET' action="${cpath}/clist.do">
			<tr>
				<td colspan="5" align="right"></td>
			</tr>

			<tr bgcolor="gray">
				<td>지원번호</td>
				<td>이름</td>
				<td>성별</td>
			</tr>
			<c:forEach var="vo" items="${clist}">
				<tr>
					<td>${vo.cnumber}</td>
					<td>${vo.name}</td>
					<td>${vo.sex}</td>
				</tr>
			</c:forEach>
		</FORM>
		<tr>
			<td align="right"><input type="button" value="개별등록"
				onclick="cinsertFn()" /></td>
			<td colspan="3" align="right">

				<form id="form2" name="form2" method="post"
					enctype="multipart/form-data">
					<input type="file" id="fileInput" name="fileInput">
					<button type="button" onclick="doExcelUploadProcess()">엑셀업로드
						작업</button>
				</form>
		</tr>

		<tr>
			<td colspan="5" align="right">
				<form name="form1" method="post">
					<input type="button" value="excel down" onClick="cdExcelDown()" />
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="clist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="clist.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="clist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>