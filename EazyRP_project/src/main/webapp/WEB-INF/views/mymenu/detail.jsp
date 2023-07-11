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
	<button>답장하기</button>
	<button>삭제</button>
	<button>닫기</button>
</body>
</html>