<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">

<div style="min-height: 800px;">
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width: 950px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">직원 상세보기</h3>
					</div>
					<div class="card-body pad">
						<form role="form" method="post" action="modifyOrder.do" name="registForm">
							<div class="form-group col-sm-12 row">
								<label for="emp_no" class="col-sm-2">사원번호</label>
								<input type="text" id="emp_no" name="emp_no" class="form-control col-sm-3" value="${emp.EMP_NO }" placeholder="사원번호.">
								<input type="hidden" id="" name="" value="">
								<div class="col-sm-1"></div>
								<label for="e_name" class="col-sm-2">사원명</label>
								<input type="text" id="e_name" name="e_name" class="form-control col-sm-4" value="${emp.E_NAME }" placeholder="사원명">
								<input type="hidden" id="" name="" value="">
							</div>
							<div class="form-group col-sm-12 row " >
								<label for="c_name" class="col-sm-2">업체명</label>
								<input type="text" id="c_name" name="c_name" class="form-control col-sm-3 c_name" value="${emp.C_NAME }" placeholder="업체명 ">
								<input type="hidden" id="c_no" name="c_no" value="${emp.C_NO }">								
								<div class="col-sm-1"></div>
								<label for="e_rank" class="col-sm-2">직급</label>
<%-- 								<input type="text" id="e_rank" name="e_rank" class="form-control col-sm-4" value="${emp.E_RANK }" placeholder="직급"> --%>
								<select name="e_rank" id="e_rank" class="form-select col-sm-4">
									<option value="대표이사" ${emp.E_RANK eq "대표이사" ? 'selected' : "" }>대표이사</option>
									<option value="이사" ${emp.E_RANK eq "이사" ? 'selected' : "" }>이사</option>
									<option value="전무" ${emp.E_RANK eq "전무" ? 'selected' : "" }>전무</option>
									<option value="상무" ${emp.E_RANK eq "상무" ? 'selected' : "" }>상무</option>
									<option value="부장" ${emp.E_RANK eq "부장" ? 'selected' : "" }>부장</option>
									<option value="차장" ${emp.E_RANK eq "차장" ? 'selected' : "" }>차장</option>
									<option value="과장" ${emp.E_RANK eq "과장" ? 'selected' : "" }>과장</option>
									<option value="대리" ${emp.E_RANK eq "대리" ? 'selected' : "" }>대리</option>
									<option value="주임" ${emp.E_RANK eq "주임" ? 'selected' : "" }>주임</option>
									<option value="사원" ${emp.E_RANK eq "사원" ? 'selected' : "" }>사원</option>
									<option value="인턴" ${emp.E_RANK eq "인턴" ? 'selected' : "" }>인턴</option>
								</select>
							</div>
							<div class="form-group col-sm-12 row">
								<label for="dname" class="col-sm-2">부서명</label>
								<input type="text" id="dname" name="dname" class="form-control col-sm-3 dname" value="${emp.DNAME }" placeholder="부서명">
								<input type="hidden" id="dept_no" name="dept_no" value="${emp.DEPT_NO }">
								<div class="col-sm-1"></div>
							</div>
							<div class="form-group col-sm-12 row">
								<label for="e_email" class="col-sm-2">이메일</label>
								<input type="text" id="e_email" name="e_email" class="form-control col-sm-3" value="${emp.E_EMAIL}" placeholder="이메일">
								<div class="col-sm-1"></div>
								<label for="e_sal" class="col-sm-2">봉급</label>
								<input type="text" id="e_sal" name="e_sal" class="form-control col-sm-4" value="${emp.E_SAL }" placeholder="봉급">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="e_bank" class="col-sm-2">은행</label>
								<input type="text" id="e_bank" name="e_bank" class="form-control col-sm-3" value="${emp.E_BANK }" placeholder="은행">
								<div class="col-sm-1"></div>
								<label for="e_account" class="col-sm-2">계좌번호</label>
								<input type="text" id="e_account" name="e_account" class="form-control col-sm-4" value="${emp.E_ACCOUNT }" placeholder="계좌번호">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="e_hd" class="col-sm-2">입사일</label>
								<c:set var="e_hd">
									<fmt:formatDate value="${emp.E_HD}" pattern="yyyy-MM-dd"></fmt:formatDate>
								</c:set>
								<input type="date" id="e_hd" name="e_hd" class="form-control col-sm-3" value="${e_hd }" placeholder="입사일">
								<div class="col-sm-1"></div>
								<label for="e_dd" class="col-sm-2">퇴사일</label>
								<c:set var="e_dd">
									<fmt:formatDate value="${emp.E_DD }" pattern="yyyy-MM-dd"></fmt:formatDate>
								</c:set>
								<input type="date" id="e_dd" name="e_dd" class="form-control col-sm-4" value="${e_dd }" placeholder="퇴사일">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="e_tenure" class="col-sm-2">재직구분</label>
								<select name="e_tenure" class="form-select col-sm-3">
									<option value="YES" ${emp.E_RANK eq "YES" ? 'selected' : "" }>YES</option>
									<option value="NO" ${emp.E_RANK eq "NO" ? 'selected' : "" }>NO</option>
								</select>
							</div>
						</form>
					</div>
					<div class="card-footer card-tools">
						<button type="button" class="btn btn-primary" id="modifyBtn" >수 정</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" id="cancelBtn">취 소</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
	window.onload = function(){

		let form = $('form[role="form"]');

		// 수정버튼 클릭
		$('#modifyBtn').on('click', function() {

			form.submit();
		});
		
		// 취소버튼 클릭
		$('#cancelBtn').on('click', function() {
			window.opener.location.reload(true);
			window.close();						// 윈도우 창을 닫는다.
		});
		

		function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
			winleft = (screen.width - WinWidth) / 2;
			wintop = (screen.height - WinHeight) / 2;
			var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
									+ "height=" + WinHeight + ",top="+ wintop + ",left="
									+ winleft + ",resizable=yes,status=yes");
			win.focus();
			return win;
		};

		$(document).on('click', '.c_name', function(){
			
			let openWin = OpenWindow("/management/findCompany.do", "업체명 찾기", 500, 500);
			
		});
		
		$(document).on('click', '.dname', function(){
			
			let openWin = OpenWindow("/management/findDept.do", "부서명 찾기", 500, 500);
			
		});
	}
</script>

<script src="<%= request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>