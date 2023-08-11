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
<title>A/S 등록</title>

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
	<h2>A/S 등록</h2>
	<!-- card footer End -->
	<form role="form" method="post" action="/asmanage/registForm.do" enctype="multipart/form-data">
		<table>
			<tr>
				<td width="40%" align="center"><b>담당자</b></td>
				<td>
					<input type="hidden" name="emp_no" id="receiver" value="${empno }"> 
					<input type="text" style="width: 100%;" value="${c_name } / ${ename }" id="name" name="name" 
							readonly onclick="OpenWindow('/mymenu/findPeople.do', '사람찾기', 400, 600)">
				</td>
			</tr>
			<tr>
				<td width="40%" align="center"><b>A/S 코드</b></td>
				<td>
					<input type="hidden" name="as_no" id="as_no" class="as_no" value=""> 
					<div style="display: flex;">
						<input type="text" style="width: 78%;" value="" id="as_no" name="as_no" readonly>
					</div>
				</td>
			</tr>
			
			<tr>
				<td width="40%" align="center"><b>A/S 비용</b></td>
				<td>
					<input type="hidden" name="asprice" id="asprice" class="asprice" value=""> 
					<div style="display: flex;">
						<input type="text" style="width: 78%;" value="" id="asprice" name="asprice">
					</div>
				</td>
			</tr>
			<tr>
            <td width="40%" align="center">
            	<b>진행 상황</b>
            </td>
            <td>
            	<select name="progress" id="fc-select">
				    <option value="0">대기중</option>
				    <option value="1">진행중</option>
				    <option value="2">완료</option>
				</select>
			</td>
        </tr>
		</table>
		<table>
			<tbody id="prInput">
			<tr>
				<td class="form-group col-sm-12 row">
					<label for="sys_regdate" class="col-sm-3">요청 날짜</label>	
					<input type="date" id="sys_regdate" name="sys_regdate" class="form-control col-sm-9 mch6" value="" placeholder="요청날짜를 입력하세요.">
				</td>
				<td class="form-group col-sm-12 row">
					<label for="compldate" class="col-sm-3">완료 날짜</label>
					<input type="date" id="compldate" name="compldate" class="form-control col-sm-9 mch7" value="" placeholder="완료일을 입력하세요.">
				</td>
			</tr>
			</tbody>
		</table>
		<input type="button" id="submitBtn" class="btn btn-primary" style="text-align: center;" value="등록">
		<input type="button" class="btn btn-warning" id="closeBtn" value="취 소">
	</form>
</body>

<script>

	let cnt = 1;
	
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
	

	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width="
				+ WinWidth + ", " + "height=" + WinHeight + ",top=" + wintop
				+ ",left=" + winleft + ",resizable=yes,status=yes");
		win.focus();
		return win;
	};
	
	// 취소버튼 클릭
	$('input#closeBtn').on('click', function() {
		window.close();							// 윈도우 창을 닫는다.
	});
	
	// 작업지시서 상세보기 버튼 클릭 이벤트
	$(document).on('click', '#woDetailOpenBtn', function() {
		let wo_number = $('input[type="hidden"]#wo_no').val();
		if (wo_number == "") {
			alert('작업지시서를 선택해주세요.');
		} else {
			let openWin = OpenWindow("/erp4/selectWorkOrderDetail.do?wo_no=" + wo_number, "작업지시서 상세보기", 600, 800);
		}
	})

	$(document).on('click', '#submitBtn', function() {
		
		let form = $('form[role="form"]');
	    let emp_no = $('input[name="emp_no"]').val();
	    let valid = true;
	
	    if (emp_no === "") {
	        alert("담당자를 선택하세요.");
	        valid = false;
	    } else {
	        $('#prInput tr').each(function(index, row) {
	            let pr_name = $(row).find('.pr_names').val();
	            let fac_name = $(row).find('.fac_names').val();
	            let wh_name = $(row).find('.wh_names').val();
	            let outprice = $(row).find('.outprice').val();
	            let quantity = $(row).find('.quantity').val();
	            let total_outprice = $(row).find('input[name="total_outprice"]').val();
	
	            if (pr_name === "" || fac_name === "" || wh_name === "" ||
	                outprice === "" || quantity === "" || total_outprice === "") {
	                alert("빈칸을 모두 입력하세요.");
	                valid = false;
	                return false; // Loop 종료
	            }
	        });
	    }
	
	    if (valid) {
	        form.submit();
	    }
	});
	
</script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

</html>
