<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지보기</title>
</head>
<body>
	<div>제목 : ${note.title }</div>
	<div>보낸사람 : ${note.callerName }</div>
	<div>내용 : ${note.con }</div>
	<div>
		첨부파일 :
		${note.realFileName}
		${note.realFileName != null ? "<button id='downloadBtn'>다운로드</button>" : "없음"}
	</div>
	<c:if test="${send eq 'N'}">
	<button id="replyBtn">답장하기</button>
	<button id="deleteBtn">삭제</button>
	</c:if>
	<button id="cancelBtn">닫기</button>
<form action ="" method="post" id="submitForm">
	<input type="hidden" name="n_no" value="${note.n_no}">
	<input type="hidden" name="caller" value="${note.caller }">
	<input type="hidden" name="callerName" value="${note.callerName }">
	<input type="hidden" name="files" value="${note.files }">
</form>
</body>
</html>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
	$('#cancelBtn').on('click', function(){
		window.opener.location.reload(true);
		window.close();
	})
	$('#deleteBtn').on('click', function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			$('#submitForm').attr('action', '/mymenu/deleteNote.do');
			$('#submitForm').submit();
		}
	});
	$('#replyBtn').on('click', function(){
		$('#submitForm').attr('action', '/mymenu/replyNote.do');
		$('#submitForm').submit();
	});
	$('#downloadBtn').on('click', function(){
		if(confirm("다운로드하시겠습니까?")){
			$('#submitForm').attr('action', '/mymenu/download.do');
			$('#submitForm').submit();
		}
	});
</script>