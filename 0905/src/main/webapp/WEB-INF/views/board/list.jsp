<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

</head>

<body>

	<%@ include file="../includes/header.jsp"%>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Tables</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					Board list page
					<button id="regBtn" type="button" class="btn btn-xs pull-right">Register
						New Board</button>
				</div>

				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<c:forEach var="board" items="${list}">
							<tr>
								<td><c:out value="${board.bno}" /></td>
								<td><a class="move" href="<c:out value='${board.bno}' />"><c:out
											value="${board.title}" /></a></td>
								<td><c:out value="${board.writer}" /></td>
								<td><fmt:formatDate value="${board.regdate}"
										pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${board.updatedate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</table>

					<div class="row">
						<div class="col-lg-12">
							<form id="searchForm" action="/board/list" method="get">
								<select name="type">
									<option value=""
										<c:out value="${pageMarker.cri.type==null?'selected':'' }"/>>--</option>
									<option value="T"
										<c:out value="${pageMarker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
									<option value="C"
										<c:out value="${pageMarker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
									<option value="W"
										<c:out value="${pageMarker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
									<option value="TC"
										<c:out value="${pageMarker.cri.type eq 'TC'?'selected':'' }"/>>제목or내용</option>
									<option value="TW"
										<c:out value="${pageMarker.cri.type eq 'TW'?'selected':'' }"/>>제목or작성자</option>
									<option value="TCW"
										<c:out value="${pageMarker.cri.type eq 'TCW'?'selected':'' }"/>>제목or내용or작성자</option>
								</select> <input type="text" name="keyword"
									value="<c:out value='${pageMarker.cri.keyword }'/>" /> <input
									type="hidden" name="pageNum"
									value="<c:out value='${pageMarker.cri.pageNum }'/>" /> <input
									type="hidden" name="amount"
									value="<c:out value='${pageMarker.cri.amount }'/>" /> <input
									type="hidden" name="type"
									value="<c:out value='${pageMarker.cri.type }'/>">
								<button class="btn btn-default">Search</button>
							</form>
						</div>
					</div>

					<div class="pull-right">
						<ul class="pagination">
							<c:if test="${pageMarker.prev }">
								<li class="pagenate_button previous"><a
									href="${pageMarker.startPage-1 }">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMarker.startPage }"
								end="${pageMarker.endPage }">
								<li class="pagenate_button"
									${pageMarker.cri.pageNum==num?"active":"" }><a
									href="${num }">${num }</a></li>
							</c:forEach>

							<c:if test="${pageMarker.next }">
								<li class="pagenate_button next"><a
									href="${pageMarker.endPage+1 }">Next</a></li>
							</c:if>
						</ul>
					</div>


					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMarker.cri.pageNum }" /> <input type="hidden"
							name="amount" value="${pageMarker.cri.amount }" />
					</form>
					<!-- modal 추가 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dimniss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Modal title</h4>
								</div>
								<div class="modal-body">처리가 완료되었습니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save
										changes</button>
								</div>
							</div>
						</div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
		</div>
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								var result = '<c:out value="${result}"/>';
								checkModal(result);
								function checkModal(result) {
									if (result === '') {
										return;
									}
									if (parseInt(result) > 0) {
										$(".modal-body").html(
												"게시글 " + parseInt(result)
														+ " 번이 등록되었습니다.");
									}
									$("#myModal").modal("show");
								}
								$("#regBtn").on("click", function() {
									self.location = "/board/register";
								});
								var actionForm = $("#actionForm");
								$(".paginate_button a").on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm.find(
													"input[name='pageNum']")
													.val($(this).attr("href"));
											actionForm.submit();
										});
								$(".move")
										.on(
												"click",
												function(e) {
													e.preventDefault();
													actionForm
															.append("<input type='hidden' name='bno' value='"
																	+ $(this)
																			.attr(
																					"href")
																	+ "'/>");
													actionForm.attr("action",
															"/board/get");
													actionForm.submit();
												});
								var seachForm = $("#searchForm");
								$("#searchForm button").on(
										"click",
										function(e) {
											if (!searchForm.find(
													"option:selected").val()) {
												alert("검색종류를 선택하세요.");
												return false;
											}
											if (!searchForm.find(
													"input[name='keyword']")
													.val()) {
												alert("키워드를 입력하세요.");
												return false;
											}
											searchForm.find(
													"input[name='pageNum']")
													.val("1");
											e.preventDefault();
											searchForm.submit();
										});
							});
		</script>
		<%@ include file="../includes/footer.jsp"%>
</body>
</html>