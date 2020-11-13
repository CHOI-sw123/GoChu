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
				url : "${cpath}/excelUp.do",
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
			f.action = "/epDown.do";
			f.submit();
		}

		$(function(){
	        $('#searchBtn').click(function() {
	          self.location = "elist.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });   
		
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
	<h2>- 현직자 리스트보기 -</h2>

	<table style="text-align: center;">
		<tr>
			<td colspan="5" align="right">
			  <div class="search">
			    <select name="searchType">
			      <option value="n"<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
			      <option value="t"<c:out value="${cri.searchType eq 't' ? 'selected' : ''}"/>>부서명</option>
			      <option value="c"<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
			      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>성별</option>
			      <option value="tc"<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>>입사일</option>
			    </select>

  		  <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
  </div>
			</td>
		</tr>
		<FORM name='frm' method='GET' action="${cpath}/elist.do">
		<tr>
			<td colspan="5" align="right"></td>
		</tr>

		<tr bgcolor="gray">
			<td>사원번호</td>
			<td>부서명</td>
			<td>이름</td>
			<td>성별</td>
			<td>입사일</td>
		</tr>
		<c:forEach var="vo" items="${elist}">
			<tr>
				<td>${vo.enumber}</td>
				<td>${vo.dept_name}</td>
				<td><a href="${cpath}/econtent.do?enumber=${vo.enumber}">${vo.name}</a></td>
				<td>${vo.sex}</td>
				<td>${vo.entry_date}</td>
			</tr>
		</c:forEach>
		</FORM>
		<tr>
			<td align="right"><input type="button" value="개별등록"
				onclick="einsertFn()" /></td>
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
					<input type="button" value="excel down" onClick="excelDown()" />
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="5">
			<div>
				  <ul>
				    <c:if test="${pageMaker.prev}">
				    	<li><a href="elist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="elist.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li><a href="elist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>