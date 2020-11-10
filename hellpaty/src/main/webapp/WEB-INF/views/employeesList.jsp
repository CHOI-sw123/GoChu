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
	function einsertFn() {
		location.href = "${cpath}/einsertForm.do";
	}
	$(function() {
		$('#searchBtn').click(function() {
							self.location = "${cpath}/elist.do"
									+ '${PageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($(
											'#keywordInput')
											.val());
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
		<FORM name='frm' method='GET' action="${cpath}/elist.do">
			<tr>
				<td colspan="5" align="right">
					<div class="search">
						<select name="searchType">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="e"
								<c:out value="${scri.searchType eq 'e' ? 'selected' : ''}"/>>사원번호</option>
							<option value="d"
								<c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>부서명</option>
							<option value="n"
								<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
							<option value="s"
								<c:out value="${scri.searchType eq 's' ? 'selected' : ''}"/>>성별</option>
							<option value="et"
								<c:out value="${scri.searchType eq 'et' ? 'selected' : ''}"/>>입사일</option>
						</select> <input type="text" name="keyword" id="keywordInput"
							value="${scri.keyword}" />

						<button id="searchBtn" type="submit">검색</button>
					</div>
				</td>
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
			<tr>
				<td colspan="5" align="right"><input type="button"
					value="현직자추가" onclick="einsertFn()" /></td>
			</tr>
	</table>
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="elist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a href="elist.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="elist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
	</FORM>
</body>
</html>