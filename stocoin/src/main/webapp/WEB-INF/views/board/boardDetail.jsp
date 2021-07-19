<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/stocoin/resources/css/board.css">
<c:set var="id" value='${sessionScope.id}'></c:set>
<script type="text/javascript">
	$(function() {
		// reply list load
		$('#replyLoad').load("/stocoin/exclude2/boardReplyList/bno/${board.bno}");
		
		// reply insert
		$('#insertReply').on('click', function() {
			var sendData = $('#frm').serialize(); // form속 data 담기
			$.post('/stocoin/board/boardReplyWrite', sendData, function(data) {
				alert("댓글이 작성되었습니다.");
				$('#replyLoad').html(data);
				$('#frm textarea').val("");
			})
		})
	})

	// session check
	function sessionChk() {
		if (${empty id}) {
			var con = confirm("로그인이 필요합니다.");
			if (con) {
				var curUrl = window.location.pathname;
				$.post("/stocoin/login2", "curUrl="+curUrl, function(data) {});
				location.href="https://kauth.kakao.com/oauth/authorize?client_id=8d7498ce8ee97c514f96feb042750e1e&redirect_uri=http://localhost:8080/stocoin/login&response_type=code";
			}
		}
	}
	
	// board delete
	function boardDel() {
		var con = confirm('정말 삭제 하시겠습니까?');
		
		if (con) {
			location.href='/stocoin/board/boardDelete/bno/${board.bno}'
		}
	}
</script>
</head>
<body>
	<div class="container col-8 boardDetail">
		<h2 class="title" align="center">뉴스 게시글 상세</h2>
		<p>${board.content }</p>
		<div class="input_box right">
			<button class="btn btn-outline-primary col-2" onclick="location.href='/stocoin/board/boardList'">목록</button>
			<button class="btn btn-outline-primary col-2" onclick="location.href='/stocoin/board/boardUpdate/bno/${board.bno}'">임시 수정 버튼</button>
			<button class="btn btn-outline-primary col-2" onclick="boardDel()">임시 삭제 버튼</button>
		</div>
		
		<section class="reply">
			<h5 class="sub_title">댓글 등록</h5>
			<form action="" method="post" name="frm" id="frm">
				<input type="hidden" name="bno" value="${board.bno }">
				<textarea name="content" placeholder="댓글을 작성해주세요." required onclick="sessionChk()"></textarea>
				<div class="input_box">
					<input type="button" value="확인" class="btn btn-primary col-4" id="insertReply">
				</div>
			</form>
			
			<!-- 댓글 리스트 -->
			<h5 class="sub_title">댓글 목록</h5>
			<div id="replyLoad"></div>
		</section>
	</div>
</body>
</html>