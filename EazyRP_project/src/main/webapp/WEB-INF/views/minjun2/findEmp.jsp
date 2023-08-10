<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 리스트</title>
<style>
	.trHover:hover{
		background-color: #dfdfdf;
		transition-propety: background-color;
		transition-duration: 1s;
	}
</style>
</head>
<body>
<div class="card-body pad">
	<div>
	<div class="input-group row" style="width: 100%; margin: 0px 0px 20px 0px; justify-content: center;">
		<form id="searchForm" method="post" action="/management/findEmp.do" style="display: contents;">
			<select class="form-control" name="searchType" id="searchType" style="font-size: 0.8em; width: 30%;">
				<option value="cw" ${searchType eq 'cw' ? 'selected' : '' }>전  체</option>
				<option value="w" ${searchType eq 'w' ? 'selected' : '' }>사원 코드</option>
				<option value="c" ${searchType eq 'c' ? 'selected' : '' }>사원 이름</option>
			</select>
			<input class="form-control" type="text" name="keyword" style="width: 50%; font-size: 0.8em" placeholder="검색어를 입력하세요." value="${keyword}">
			<button class="btn btn-primary" type="button" id="searchBtn">
				<i class="fa fa-fw fa-search" style="font-size: 0.8em; padding: 0px;"></i>
			</button>
		</form>
	</div>
	<div>	
		<table id="tab" style="font-size: 0.8em;" class="table table-borderd text-center">
			<tr>
				<th width="50px" style="text-align: center;">사원 코드</th>
				<th width="50px" style="text-align: center;">사원 이름</th>
				<th width="50px" style="text-align: center;">직급</th>
				<th width="50px" style="text-align: center;">부서명</th>
			</tr>
			<tr>
				<td style="text-align: center;" class="emp_no">0</td>
				<td style="text-align: center;" class="e_name">없음</td>
				<td style="text-align: center;" class="e_rank">없음</td>
				<td style="text-align: center;" class="dname">없음</td>
			</tr>
			<c:forEach items="${emp}" var="emp">
				<tr>
					<td style="text-align: center;" class="emp_no">${emp.emp_no}</td>
					<td style="text-align: center;" class="e_name">${emp.e_name}</td>
					<td style="text-align: center;" class="e_rank">${emp.e_rank}</td>
					<td style="text-align: center;" class="dname">${emp.dname}</td>
					<td style="display: none;" class="e_sal">${emp.e_sal}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" value="" id="cnt">
	</div>
</div>
</div>
</body>
</html>

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		let parentInputId = opener.$("#cnt").val();
		
		$('tr').on('click', function(){
				let parentE1 = $('#' + parentInputId, opener.document);
				parentE1.parents('tr').find('input[name="e_name"]').val($(this).find('.e_name').text());
				parentE1.parents('tr').find('input[name="dname"]').val($(this).find('.dname').text());
				parentE1.parents('tr').find('input[name="e_sal"]').val($(this).find('.e_sal').text());
				
				parentE1.parents('tr').next('tr').find('input[name="emp_no"]').val($(this).find('.emp_no').text());
				parentE1.parents('tr').next('tr').find('input[name="e_rank"]').val($(this).find('.e_rank').text());
				
				
				
				window.close();
			});
	
		$('#searchBtn').on('click', function(){
			$('#searchForm').submit();
		});
	});
</script>
