 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
	input {
		border: none;
		text-size: 100%;
	}
	
	html {
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 0.7em;
	}
	
	body {
		font-family: Arial, sans-serif;
		margin: 5em;
		align-items: center;
		justify-content: center;
	}
	
	h2 {
		color: #333;
		text-align: center;
		margin-bottom: 30px;
	}
	
	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	
	th, td {
		padding: 1em;
		border: 1px solid #ccc;
	}
	
	th {
		background-color: #f2f2f2;
		text-align: center;
	}
	
	td {
		vertical-align: middle;
	}
	
	.total, .files {
		font-weight: bold;
	}
	
	.note {
		font-style: italic;
	}
</style>
</head>
	

<body style="width: 400px;">
    <h2>상세보기</h2>
	<div class="card-footer">
		<button type="submit" id="modifyBtn" class="btn btn-warning">수정</button>
		<button type="button" id="removeBtn" class="btn btn-danger">삭제</button>
		<button type="button" id="closeBtn" class="btn btn-primary">닫기</button>
	</div>
	<!-- card footer End -->
<form role="form" method="post" enctype="multipart/form-data">

		<input type="hidden" name="as_no" value="${as.AS_NO }">
		<table>
	        <tr>
	            <td width="40%" align="center"><b>코드번호</b></td>
	            <td width="100%"><input type="text" style="width: 100%;" value="${as.AS_NO }" disabled></td>
	        </tr>
	        <tr>
	            <td width="40%" align="center"><b>담당자</b></td>
	            <td width="100%">
		        	<input type="hidden" id="receiver" name="emp_no" value="${as.EMP_NO }">
	            	<input type="text" style="width: 100%;" value="${as.C_NAME } / ${as.E_NAME }" id="name" name="name" readonly onclick="OpenWindow('/mymenu/findPeople.do', '사람찾기', 400, 600)">
	            </td>
	        </tr>
	        <tr>
	        	<td width="40%" align="center"><b>등록일</b></td>
	        	<td width="100%">
					<input type="text" id="sys_regdate" name="sys_regdate" class="form-control mch7" value="<fmt:formatDate value="${as.SYS_REGDATE }" pattern="yyyy-MM-dd"></fmt:formatDate>" disabled>
	        	</td>
	        </tr>
	        <tr>
				<td width="40%" align="center"><b>수리예정일</b></td>
				<td width="100%">
					<input type="date" id="repairdate" name="repairdate" class="form-control col-sm-9 mch6" value="<fmt:formatDate value="${as.REPAIRDATE}" pattern="yyyy-MM-dd"></fmt:formatDate>" placeholder="요청날짜를 입력하세요.">
				</td>
			</tr>
			<tr>
				<td width="40%" align="center"><b>완료일</b></td>
				<td width="100%">	
					<input type="date" id="compldate" name="compldate" class="form-control col-sm-9 mch7" value="<fmt:formatDate value="${as.COMPLDATE}" pattern="yyyy-MM-dd"></fmt:formatDate>" placeholder="완료일을 입력하세요.">
				</td>
			</tr>
	        <tr>
	            <td width="40%" align="center">
	            	<b>상태</b>
	            </td>
	            <td>
	            	<select name="progress" id="progress_select">
					    <option>선택</option>
					    <option value="0" ${as.PROGRESS eq '0' ? 'selected' : '' }>대기중</option>
					    <option value="1" ${as.PROGRESS eq '1' ? 'selected' : '' }>진행중</option>
					    <option value="2" ${as.PROGRESS eq '2' ? 'selected' : '' }>완료</option>
					</select>
				</td>
	        </tr>
	        <tr>
				<td width="40%" align="center"><b>AS비용</b></td>
				<td width="100%">	
					<input type="text" id="asprice" name="asprice" style="width: 100%;" value="${as.ASPRICE }">
				</td>
			</tr>
	    </table>
 	<table>
 		<tr>
	        	<td width="40%" align="center"><b>A/S 내용</b></td>
	        	<td width="100%">
					<textarea row="5" cols="50" name="content">${as.CONTENT}</textarea>
	        	</td>
	        </tr>
 	</table>
</form>
</body>

<script>
window.onload = function(){
	
	let formObj = $('form[role="form"]');

	$('button#modifyBtn').on('click', function(){
		formObj.attr({
			'action' : 'modify.do',
			'method' : 'post'
		});
		formObj.submit();
	});
	
	
	$('button#removeBtn').on('click', function(){
		if(confirm("정말 삭제하시겠습니까?")){
			formObj.attr({
				'action' : 'remove',
				'method' : 'post' 
			});
			formObj.submit();
		};
	});
	
	$('button#closeBtn').on('click', function(){
		window.close();
	});
	
}

</script>

<script>
let rownumList = $('.rownum');
let cnt = rownumList.length; 
console.log(cnt);
let dtail_no = $('#dtail_no').val();


function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
							+ "height=" + WinHeight + ",top="+ wintop + ",left="
							+ winleft + ",resizable=yes,status=yes");
	
	win.focus();
	return win;
};

	
</script>

</html>
