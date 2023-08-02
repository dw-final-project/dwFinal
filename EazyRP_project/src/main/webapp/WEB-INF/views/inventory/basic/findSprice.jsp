<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특별단가 찾기</title>
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
		<form method="post" id="searchForm" action="/erp4/findSprice.do" style="display: contents;">
			<select class="form-control" name="searchType" id="searchType" style="font-size: 0.8em; width: 30%;">
				<option value="all" ${searchType eq 'all' ? 'selected' : '' }>전  체</option>
				<option value="n" ${searchType eq 'n' ? 'selected' : '' }>특별단가명</option>
				<option value="i" ${searchType eq 'i' ? 'selected' : '' }>특별입고단가</option>
				<option value="e" ${searchType eq 'e' ? 'selected' : '' }>특별출고단가</option>
			</select>
			<input class="form-control" type="text" name="keyword" style="width: 50%; font-size: 0.8em" placeholder="검색어를 입력하세요." value="${keyword}">
				<button class="btn btn-primary" type="button" id="searchBtn">
					<i class="fa fa-fw fa-search" style="font-size: 0.8em; padding: 0px;"></i>
				</button>
		</form>
		</div>
	<div>	
		<table style="font-size: 0.8em;" class="table table-borderd text-center">
			<tr>
				<th width="100px" style="text-align: center;">특별단가 코드</th>
				<th width="100px" style="text-align: center;">특별단가 명</th>
				<th width="100px" style="text-align: center;">특별입고단가</th>
				<th width="100px" style="text-align: center;">특별출고단가</th>
			</tr>
				<c:forEach items="${spriceList }" var="sprice">
				<tr class="trHover">
					<td style="text-align: center;" id="sp_no">${sprice.SP_NO }</td>
					<td style="text-align: center;" id="sp_name">${sprice.SP_NAME }<input type="hidden" id="wh_no" value="${sprice.SP_NO }"></td>
					<td style="text-align: center;" id="sp_in">${sprice.SP_IN }</td>
					<td style="text-align: center;" id="sp_ex">${sprice.SP_EX }</td>
				</tr>
				</c:forEach>
		</table>
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
	
		
	$('tr').on('click', function(){
			$('#sp_name', opener.document).val($(this).find('#sp_name').text());
			$('#sp_no', opener.document).val($(this).find('#sp_no').val());
			window.close();
		})
	
		$('#searchBtn').on('click', function(){
			$('#searchForm').submit();
		})
	});
</script>
