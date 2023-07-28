<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>생산입고</title>

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


<body>
	<h2>생산입고 등록</h2>
	<!-- card footer End -->
	<form role="form" method="post" action="/erp4/wh/regist.do" enctype="multipart/form-data">
		<table>
			<tr>
				<td width="40%" align="center"><b>담당자</b></td>
				<td>
					<input type="hidden" name="emp_no" id="receiver" value="${empno }"> 
					<input type="text" style="width: 100%;" value="${ename }" id="name" name="name" 
							readonly onclick="OpenWindow('/mymenu/findPeople.do', '사람찾기', 400, 600)">
				</td>
			</tr>
			<tr>
				<td align="center"><b>작업지시서</b></td>
				<td>
					<input type="file" style="width: 100%;" name="files" value="">
					<input type="hidden" id="fileName" name="fileName" value="">
				</td>
			</tr>
		</table>
		<button type="button" id="addPutBtn">추가</button>
		<table>
			<thead>
				<tr>
					<th align="center">품목</th>
					<th align="center">생산 공장</th>
					<th align="center">입고 창고</th>
					<th align="center">외주비 단가</th>
					<th align="center">수량</th>
					<th align="center">외주비 합계</th>
					<th align="center">삭제</th>
				</tr>
			</thead>
			<tbody id="prInput">
				<input type="hidden" value="" id="cnt">
				<tr>
					<td>
						<input type="text" id="0" class="pr_names" name="pr_name" style="width: 100%;" value=""><input type="hidden" name="pr_no">
					</td>
					<td>
						<input type="text" id="0" class="fac_names" style="width: 100%;" value="">
					</td>
					<td>
						<input type="text" id="0" class="wh_names" style="width: 100%;" value="">
					</td>
					<td>
						<input type="text" id="outPrice" class="outPrice" name="outPrice" style="width: 100%;" value="">
					</td>
					<td>
						<input type="text" id="quantity" class="quantity" name="quantity" style="width: 100%;" value="">
					</td>
					<td>
						<input type="text" id="amount2" name="amount2" style="width: 100%;" value="">
					</td>
					<td style="text-align: center;">
						<button type="button" id="cancelBtn">삭제</button>
					</td>
				</tr>
			</tbody>
			<tr class="total">
				<td colspan="5" align="center">
					총계
				</td>
				<td colspan="2" align="center">
					<input type="text" style="width: 100%;" id="totalAmount2" value="">
				</td>
			</tr>
		</table>
		<input type="submit" id="submitBtn" class="btn btn-primary" style="text-align: center;" value="생성">
	</form>
</body>

<script>
	let cnt = 1;
	// 파일 추가 버튼
	$('#addPutBtn').on('click', function() {
		
		cnt++;
		
		$('#prInput').append(
			'<tr>'
				+ '<td><input type="text" id="' + cnt + '" class="pr_names" name="" style="width: 100%;" value=""><input type="hidden" name=""></td>'
				+ '<td><input type="text" id="' + cnt + '" class="fac_names" name="fac_name" style="width: 100%;" value=""><input type="hidden" name=""></td>'
				+ '<td><input type="text" id="' + cnt + '" class="wh_names" name="wh_name" style="width: 100%;" value=""><input type="hidden" name=""></td>'
				+ '<td><input type="text" id="outPrice' + cnt + '" class="outPrice" name="outPrice" style="width: 100%;" value=""><input type="hidden" name=""></td>'
				+ '<td><input type="text" id="quantity' + cnt + '" class="quantity" name="quantity" style="width: 100%;" value=""></td>'
				+ '<td><input type="text" id="amount" name="amount2" style="width: 100%;" value=""></td>'
				+ '<td style="text-align : center;"><button type="button" id="cancelBtn">삭제</button></td>'
			+ '</tr>'
		);
	
	});
	
	// 제품코드 td 클릭 이벤트
	$(document).on('click', '.pr_names', function() {
		let idVal = $(this).attr('id');
		$('#cnt').val(idVal);
		let openWin = OpenWindow("/erp4/findProduct.do", "제품 찾기", 800, 600);
	});

	// 제품 삭제 버튼
	$('#prInput').on('click', '#cancelBtn', function() {
		$(this).parent('td').parent('tr').remove();
	});

	// 공장 클릭시 목록 열기 이벤트
	$(document).on('click', '.fac_names', function() {
		let whVal = $(this).attr('id');
		$('#cnt').val(whVal);
		let openWin = OpenWindow("/erp4/findFactory.do", "공장 찾기", 800, 600);
	})

	// 창고코드 이벤트
	$(document).on('click', '.wh_names', function() {
		let whVal = $(this).attr('id');
		$('#cnt').val(whVal);
		let openWin = OpenWindow("/erp4/findWareHouse.do", "창고 찾기", 800, 600);
	})


	// 가격 * 수량 = 합계
	$(document).on('keyup', '.quantity', function() {
		let quantity = $(this).parents("tr").find(".outPrice").val()
		let unitPrice = $(this).val();

		let totalPrice = unitPrice * quantity;
		
		$(this).parent().next().children().val(totalPrice);
	})
	
	// 총합계
	$(document).on('change, keyup', '#prInput', function(){
		let sum = Number(0);
		let inputAmount = $('input[name="amount2"]').get();
		for(let i = 0; i < inputAmount.length; i++){
			sum += Number($('input[name="amount2"]').eq(i).val());
		}
		
		$('#totalAmount2').val(sum);
	})

	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width="
				+ WinWidth + ", " + "height=" + WinHeight + ",top=" + wintop
				+ ",left=" + winleft + ",resizable=yes,status=yes");
		win.focus();
		return win;
	};
	
</script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

</html>
