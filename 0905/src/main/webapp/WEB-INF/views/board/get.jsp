<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<script type="text/javascript" src="/resources/js/reply.js"></script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Read</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Read</div>
				<div class="panel-body">

					<div class="form=group">

						<label>Bno</label><input class="form-control" name="bno"
							value="<c:out value="${board.bno }"/>" readonly="readonly">
					</div>
					<div class="form-group">
						<label>Title</label><input class="form-control" name="title"
							value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" cols="20" name="content"
							readonly="readonly"><c:out value="${board.content }" /></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label><input class="form-control" name="writer"
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>
					<button data-oper="modify" class="btn btn-default"
						onclick="location.href='/board/modify?bno=${board.bno }'">Modify</button>
					<button data-oper="list" class="btn btn-info"
						onclick="location.href='/board/list'">List</button>

					<form id="operForm" action="/board/modify" method="get">
						<input type="hidden" value="<c:out value='${board.bno }'/>"
							name="bno" id="bno" /> <input type="hidden" name="pageNum"
							value="<c:out value='${cri.pageNum }'/>" /> <input type="hidden"
							name="amount" value="<c:out value='${cri.amount }' />" /> <input
							type="hidden" name="keyword"
							value="<c:out value='${cri.keyword }'/>" /> <input type="hidden"
							name="type" value="<c:out value='${cri.type }' />" />
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- reply row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- panel-heading -->
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>Reply
				</div>
				<!-- panel-heading -->
				<!-- panel-body -->
				<div class="panel-body">
					<ul class="chat">
						<!-- start replytext -->
						<li class="left clearfix" data-rno="5">
							<div>
								<div class="header">
									<strong class="primary-font">user00</strong> <small
										class="pull-right text-muted">20190925</small>
								</div>
								<p>Good job!!</p>
							</div>
						</li>
					</ul>
				</div>
				<!-- panel-body -->
			</div>
		</div>
	</div>
	<!-- reply row -->
	
	

	<script type="text/javascript">
		console.log(replyService);
		console.log("----------");
		console.log("js test");

		var bnoValue = "<c:out value='${board.bno}'/>";
		/*replyService.add({
			replytext : "JS Test",
			replyer : "tester",
			bno : bnoValue
		}, function(result) {
			alert("result:" + result);
		});*/
		replyService.getList({
			bno : bnoValue,
			page : page||1
		}, function(list) {
			for (var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list[i]);
			}
		});
		replyService.remove(12, function(count) {
			console.log("개수확인" + count);
			if (count == "success") {
				alert("REMOVE");
			}
		}, function(err) {
			alert("ERROR");
		});

		replyService.update({
			rno : 5,
			bno : bnoValue,
			replytext : "text0925"
		}, function(result) {
			alert("수정완료");
		});

		replyService.get(7, function(data) {
			console.log(data);
		})
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/board/modify").submit();
			});
			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list").submit();
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			var bnoValue = "<c:out value='${board.bno}'/>";
			var replyUL = $(".chat");
			showList(1);
			function showList(page) {
				replyService.getList({
					bno : bnoValue,
					page : page || 1
				}, function(list) {
					var str = "";
					if (list == null || list.length == 0) {
						replyUL.html("");
						return;
					}
					for (var i = 0, len = list.length || 0; i < len; i++) {
						str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
						str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
						str += " <small class='pull-right text-muted'>"+replyService.displayTime(list[i].regdate)+"</small></div>";
						//str += " <small class='pull-right text-muted'>"+list[i].regdate+"</small></div>";
						str += " <p>"+list[i].replytext+"</p></div></li>";
						console.log(list[i]);
					}
					replyUL.html(str);
				});
			}
		});
	</script>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>