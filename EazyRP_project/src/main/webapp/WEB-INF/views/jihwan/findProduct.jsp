<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 찾기</title>
</head>
<body>
<div class="card-body pad">
	<div>
	<div class="input-group row" style="width: 100%; margin: 0px 0px 20px 0px; justify-content: center;">
		<form id="searchForm" method="post" action="/jihwan/findProduct.do" style="display: contents;">
			<select class="form-control" name="searchType" id="searchType" style="font-size: 0.8em; width: 30%;">
				<option value="cw" ${searchType eq 'cw' ? 'selected' : '' }>전  체</option>
				<option value="w" ${searchType eq 'w' ? 'selected' : '' }>이  름</option>
				<option value="c" ${searchType eq 'c' ? 'selected' : '' }>업  체</option>
			</select>
			<input class="form-control" type="text" name="keyword" style="width: 50%; font-size: 0.8em" placeholder="검색어를 입력하세요." value="${keyword}">
			<button class="btn btn-primary" type="submit" id="searchBtn">
				<i class="fa fa-fw fa-search" style="font-size: 0.8em; padding: 0px;"></i>
			</button>
		</form>
	</div>
	<div>	
		<table id="tab" style="font-size: 0.8em;" class="table table-borderd text-center">
			<tr>
				<th width="80px" style="text-align: center;">제품이름</th>
				<th width="160px" style="text-align: center;">업체명</th>
			</tr>
			<c:forEach items="${product}" var="pro">
				<tr>
					<td style="text-align: center;" class="pr_name">${pro.pr_name}</td>
					<td style="text-align: center;" class="c_name">${pro.c_name}</td>
					<input type="hidden" class="cost" value="${pro.pr_exprice }">
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
		
		$('#tab').on('click', 'tr', function() {
			let productName = $(this).find('.pr_name').text();
			let companyName = $(this).find('.c_name').text();
			let price = $(this).find('.cost').val();
			let parentEl = $("#" + parentInputId, opener.document);
			console.log(parentEl.parents('tr').find('input#cost'))
			parentEl.val(productName);
			$('#c_name', opener.document).val(companyName);
			parentEl.parents('tr').find('input#cost').val(price);
			window.close();
		});

		$('#searchForm').on('submit', function(e) {
			e.preventDefault(); 

			let searchType = $('#searchType').val();
			let keyword = $('input[name="keyword"]').val();
			let c_name = $('.c_name').val();
			let pr_name = $('.pr_name').val();
			let url = '/erp4/findProduct.do';
			let data = {
				searchType: searchType,
				keyword: keyword,
				c_name : c_name,
				pr_name : pr_name,
			};

			$.ajax({
				type: 'POST',
				url: url,
				data: data,
				success: function(response) {
					$('#tab').html(response); 
					console.log(response);
				},
				error: function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	});
</script>
