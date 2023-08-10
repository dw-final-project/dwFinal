<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css"
	rel="stylesheet">
 <style>
        table {
            text-align: center;
            font-size: 80%;
            align-content: center;
        }
        th,
        td {
            border: 1px solid #ccc;
           
        }
        th {
            background-color: #f2f2f2;
            vertical-align: middle;
            color: blue;
        }
        td {
            vertical-align: middle;
            padding: 0px;
        }
        input {
       		width:100%; 
        	border: none; 
        	text-align: center; 
        	vertical-align: middle;
        }
<!--     </style> -->
<div style="min-height: 100%;">
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12" style="max-width: 1500px;">
				<div class="card card-outline card-info">
					<div class="card-body pad">
						<form role="form" method="post" action="registWork.do" name="registForm" enctype="multipart/form-data">
							<div class="card-header">
								<h2 class="card-title" >2023-08 급여</h2>
							</div>
							<table class="table">
								<thead>
									<tr>
										<th style="width: 6%">성명</th>
										<th style="width: 8%">부서명</th>
										<th style="width: 7%">기본급</th>
									<c:forEach items="${extrapayList }" begin="0" end="2" var="exp" varStatus="loop">
										<th style="width: 8%">
											<input type="text"  id="ep_name" name="ep_name" value="${exp.EP_NAME }" style="color: blue; font-weight:bold;" readonly>
											<input type="hidden" id="ep_no" name="ep_no" value="${exp.EP_NO }">
											<input type="hidden" id="calc" name="calc" value="${exp.CALC }">
										</th>
									</c:forEach>
										<th rowspan="2" style="vertical-align: middle; ">지급총액</th>
									<c:forEach items="${deductionList }" begin="0" end="2" var="ded" varStatus="loop">
										<th style="width: 8%">
											<input type="text"  id="ded_name" name="ded_name" value="${ded.DED_NAME }" style="color: blue; font-weight:bold;" readonly>
											<input type="hidden" id="ded_no" name="ded_no" value="${ded.DED_NO }">
											<input type="hidden" id="calc" name="calc" value="${ded.CALC }">
										</th>
									</c:forEach>
										<th rowspan="2" style="vertical-align: middle;">공제총액</th>
										<th rowspan="2" style="vertical-align: middle; ">실지급액</th>
									</tr>
									<tr>
										<th style="width: 6%">사원번호</th>
										<th style="width: 8%">직위/직급명</th>
										<th ></th>
									<c:forEach items="${extrapayList }" begin="3" end="5" var="exp" varStatus="loop">
										<th style="width: 7%">
											<input type="text"  id="ep_name" name="ep_name" value="${exp.EP_NAME }" style="color: blue;  font-weight:bold;" readonly>
											<input type="hidden" id="ep_no" name="ep_no" value="${exp.EP_NO }">
											<input type="hidden" id="calc" name="calc" value="${exp.CALC }">
										</th>
									</c:forEach>
									<c:forEach items="${deductionList }" begin="3" end="5" var="ded" varStatus="loop">
										<th style="width: 8%">
											<input type="text"  id="ded_name" name="ded_name" value="${ded.DED_NAME }" style="color: blue; font-weight:bold;" readonly>
											<input type="hidden" id="ded_no" name="ded_no" value="${ded.DED_NO }">
											<input type="hidden" id="calc" name="calc" value="${ded.CALC }">
										</th>
									</c:forEach>
										<th ></th>
									</tr>
								</thead>
								<tbody>
								<input type="hidden" value="" id="cnt">
									<tr>
										<td><input type="text" id="e_name0" name="e_name" value="직원" style="" readonly></td>
										<td><input type="text"  id="dname0" name="dname" value="부서" style="" readonly></td>
										<td ><input type="text"  id="e_sal0" name="e_sal" value="기본급" style="" readonly></td>
										<td></td>
										<td></td>
										<td></td>
										<td rowspan="2" style="vertical-align: middle;"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td><input type="text"  id="emp_no0" name="emp_no" value="사원번호" style="" readonly></td>
										<td><input type="text"  id="e_rank0" name="e_rank" value="직급" style="" readonly></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
								<tfoot>
									<tr class="total">
										<td colspan="2" align="center">총합계</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tfoot>
							</table>
								<button type="button" id="addPutBtn" class="btn btn-primary">직원 추가</button>
						</form>
					</div>
					<div class="card-footer card-tools">
						<button type="button" class="btn btn-primary" id="modifyBtn">등 록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger" id="deleteBtn">삭 제</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" id="cancelBtn">취 소</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
	window.onload = function() {
		
		
		
		let form = $('form[role="form"]');

		// 수정버튼 클릭
		$('#modifyBtn').on('click', function() {

			if ($('.work1').val() == "") {
				alert("빈 항목이 있습니다.");
				return;
			}
			if ($('.work2').val() == "") {
				alert("빈 항목이 있습니다.");
				return;
			}
			if ($('.work3').val() == "") {
				alert("빈 항목이 있습니다.");
				return;
			}
			if ($('.work4').val() == "") {
				alert("빈 항목이 있습니다.");
				return;
			}

			form.submit();
		});

		// 취소버튼 클릭
		$('#cancelBtn').on('click', function() {
			window.opener.location.reload(true);
			window.close(); // 윈도우 창을 닫는다.
		});

		// 삭제버튼 클릭
		$('#deleteBtn').on('click', function() {
			if (confirm("정말 삭제하시겠습니까?")) {

				form.attr({
					'action' : 'deleteWork.do',
					'method' : 'post'
				});

				form.submit();
			}
			;
		});

		function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
			winleft = (screen.width - WinWidth) / 2;
			wintop = (screen.height - WinHeight) / 2;
			var win = window
					.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth
							+ ", " + "height=" + WinHeight + ",top=" + wintop
							+ ",left=" + winleft + ",resizable=yes,status=yes");
			win.focus();
			return win;
		}
		;
		
		let cnt = 0;
		
		// 사원 추가 버튼
		$('#addPutBtn').on('click', function(){
				
				cnt++;
			
				$('tbody').append(
				'<tr>'
				+	'<td><input type="text" id="e_name' + cnt + '" name="e_name" value="직원" style="" readonly></td>'
				+	'<td><input type="text"  id="dname' + cnt + '" name="dname" value="부서" style="" readonly></td>'
				+	'<td><input type="text"  id="e_sal' + cnt + '" name="e_sal" value="기본급" style="" readonly></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td rowspan="2"></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+'</tr>'
				+'<tr>'
				+	'<td><input type="text"  id="emp_no' + cnt + '" name="emp_no" value="사원번호" style="" readonly></td>'
				+	'<td><input type="text"  id="e_rank' + cnt + '" name="e_rank" value="직급" style="" readonly></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+	'<td></td>'
				+'</tr>'
				);
			});
		
		// 사원찾기 
		$(document).on('click', 'input[name=e_name]', function(){
			
			let c_no = $('#c_no').val();
			let idVal = $(this).attr("id");
			$('#cnt').val(idVal);
			let openWin = OpenWindow("/management/findEmp.do?c_no=" + c_no, "사원 찾기", 500, 500);
		});
	}
</script>

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>