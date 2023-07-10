<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사람찾기</title>
</head>
<body>
	<div>	
		<form method="post" action="/mymenu/findPeople.do">
			<input type="text" name="name" placeholder="이름을 입력하세요.">
			<input type="text" name="c_name" placeholder="업체명을 입력하세요.">
			<input type="submit" value="검색하기">
		</form>
	</div>
	<div>
		<c:forEach items="${emp }" var="emp">
			<ul>
				<li id="name">${emp.e_name }</li>
				<li id="emp_no">${emp.emp_no }</li>
			</ul>
		</c:forEach>
	</div>
</body>
</html>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
	$('ul').on('click', function(){
		$('#name', opener.document).val($(this).find('#name').text());
		$('#receiver', opener.document).val($(this).find("#emp_no").text());
		window.close();
	})

</script>