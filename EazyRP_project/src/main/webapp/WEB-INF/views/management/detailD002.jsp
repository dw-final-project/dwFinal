<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">

<style>
	tr{
		font-size: 0.7em;
	}
	
</style>
<div class="data-wrapper" style="justify-content: center; display: flex;">
<div style="width: 90%; margin-top: 20px;">
<table border="1px solid" style="float: right; margin-bottom: 10px;">
	<tr height="30px">
		<td width="300px" colspan="3" style="text-align: center;">결재 라인</td>
	</tr>
	<tr height="100px">
		<td width="100px">
		<c:if test="${draft.pl_progress eq '1' || draft.pl_progress eq '2' || draft.pl_progress eq '3' || draft.pl_progress eq '2fail' || draft.pl_progress eq '3fail'}">
		<img src="<%=request.getContextPath() %>/resources/stamp/no13.jpg" style="width: 100px; height:100px; border-radius: 30px;">
		</c:if>
		<c:if test="${draft.pl_progress eq '1fail'}">
		<img src="<%=request.getContextPath() %>/resources/stamp/fail2.png" style="width: 100px; height:100px; border-radius: 30px;">
		</c:if>
		</td>
		<td width="100px">
		<c:if test="${draft.pl_progress eq '2' || draft.pl_progress eq '3' || draft.pl_progress eq '3fail'}">
		<img src="<%=request.getContextPath() %>/resources/stamp/no14.png" style="width: 100px; height:100px; border-radius: 30px;">
		</c:if>
		<c:if test="${draft.pl_progress eq '2fail'}">
		<img src="<%=request.getContextPath() %>/resources/stamp/fail2.png" style="width: 100px; height:100px; border-radius: 30px;">
		</c:if>
		</td>
		<td width="100px">
		<c:if test="${draft.pl_progress eq '3'}">
		<img src="<%=request.getContextPath() %>/resources/stamp/no15.png" style="width: 100px; height:100px; border-radius: 30px;">
		</c:if>
		<c:if test="${draft.pl_progress eq '3fail'}">
		<img src="<%=request.getContextPath() %>/resources/stamp/fail2.png" style="width: 100px; height:100px; border-radius: 30px;">
		</c:if>
		</td>
	</tr>
	<tr height="30px">
		<td width="100px" style="text-align: center;">${pl.e_name1 }</td>
		<td width="100px" style="text-align: center;">${pl.e_name2 }</td>
		<td width="100px" style="text-align: center;">${pl.e_name3 }</td>
	</tr>
	<tr height="30px">
		<td width="100px" style="text-align: center;">${rank.get(2) }</td>
		<td width="100px" style="text-align: center;">${rank.get(1) }</td>
		<td width="100px" style="text-align: center;">${rank.get(0) }</td>
	</tr>
</table>

<table border="1px solid" style="justify-data: center; align-data: center; width: 100%;">
	<tr height="30px">
		<td width="800px" colspan="6" style="text-align: center;">${data.get(0) }</td>
	</tr>
	<tr height="30px">
		<td colspan="6" style="text-align: center;">${data.get(6) }</td>
	</tr>
	<tr height="30px">
		<td width="100px" style="text-align: center;">${data.get(12) }</td>
		<td width="100px" style="text-align: center;">${data.get(13) }</td>
		<td width="100px" style="text-align: center;">${data.get(14) }</td>
		<td width="100px" style="text-align: center;">${data.get(15) }</td>
		<td width="100px" style="text-align: center;">${data.get(16) }</td>
		<td width="300px" style="text-align: center;">${data.get(17) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(18) }</td>
		<td colspan="5" style="text-align: center;">${data.get(19) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(24) }</td>
		<td colspan="5" style="text-align: center;">${data.get(25) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(30) }</td>
		<td colspan="5" style="text-align: center;">${data.get(31) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(36) }</td>
		<td colspan="5" style="text-align: center;">${data.get(37) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(42) }</td>
		<td colspan="5" style="text-align: center;">${data.get(43) }</td>
	</tr>
	<tr height="30px">
		<td rowspan="10" style="text-align: center;">${data.get(48) }</td>
		<td style="text-align: center;">${data.get(49) }</td>
		<td style="text-align: center;">${data.get(50) }</td>
		<td style="text-align: center;">${data.get(51) }</td>
		<td colspan="2" style="text-align: center;">${data.get(52) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(55) }</td>
		<td style="text-align: center;">${data.get(56) }</td>
		<td style="text-align: center;">${data.get(57) }</td>
		<td rowspan="2" style="text-align: center;">${data.get(58) }</td>
		<td style="text-align: center;">${data.get(59) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(61) }</td>
		<td style="text-align: center;">${data.get(62) }</td>
		<td style="text-align: center;">${data.get(63) }</td>
		<td style="text-align: center;">${data.get(65) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(67) }</td>
		<td style="text-align: center;">${data.get(68) }</td>
		<td style="text-align: center;">${data.get(69) }</td>
		<td rowspan="2" style="text-align: center;">${data.get(70) }</td>
		<td style="text-align: center;">${data.get(71) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(73) }</td>
		<td style="text-align: center;">${data.get(74) }</td>
		<td style="text-align: center;">${data.get(75) }</td>
		<td style="text-align: center;">${data.get(77) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(79) }</td>
		<td style="text-align: center;">${data.get(80) }</td>
		<td style="text-align: center;">${data.get(81) }</td>
		<td rowspan="2" style="text-align: center;">${data.get(82) }</td>
		<td style="text-align: center;">${data.get(83) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(85) }</td>
		<td style="text-align: center;">${data.get(86) }</td>
		<td style="text-align: center;">${data.get(87) }</td>
		<td style="text-align: center;">${data.get(89) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(91) }</td>
		<td style="text-align: center;">${data.get(92) }</td>
		<td style="text-align: center;">${data.get(93) }</td>
		<td rowspan="2" style="text-align: center;">${data.get(94) }</td>
		<td style="text-align: center;">${data.get(95) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(97) }</td>
		<td style="text-align: center;">${data.get(98) }</td>
		<td style="text-align: center;">${data.get(99) }</td>
		<td style="text-align: center;">${data.get(101) }</td>
	</tr>
	<tr height="30px">
		<td style="text-align: center;">${data.get(103) }</td>
		<td style="text-align: center;">${data.get(104) }</td>
		<td style="text-align: center;">${data.get(105) }</td>
		<td style="text-align: center;">${data.get(106) }</td>
		<td style="text-align: center;">${data.get(107) }</td>
	</tr>
	<tr height="300px">
		<td colspan="6">${data.get(108) }</td>
	</tr>
</table>
</div>
</div>

<div style="width: 100%;">
	<section class="content container-fluid">
		<div class="row">	<!-- row Start -->
			<div class="col-md-12">
				<div class="card card-outline card-info" style="margin-top: 20px">
					<div class="card-body">	<!-- card body Start -->
						<div class="form-group col-sm-12">
							<label for="title">결재서류명</label>
							<input type="text" class="form-control" id="title" value="${draft.title }" readonly style="background-color: white;">
						</div>
						<div class="row" style="align-items: center; justify-content: space-evenly;">
						</div>
						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div style="background-color: white; border: 1px solid #afafaf; border-radius: 5px; min-height: 100px;">
								<div id="content">${draft.con }</div>
							</div>

						</div>
						<div class="form-group col-sm-12">
						</div>
					</div>	<!-- card body End -->
					<div class="card-footer">
						<button type="button" id="cancelBtn" class="btn btn-warning">닫기</button>
						<button type="button" id="payBtn" class="btn btn-primary" style="float: right; margin-left: 10px; ${avail eq 'N' || draft.pl_progress eq '3' ? 'background-color: gray; border: none;"disabled' : '"'}>결재</button>
						<c:if test="${fail eq 'N' }">
						<button type="button" id="failBtn" class="btn btn-danger" style="float: right; ${avail eq 'N' || draft.pl_progress eq '3' ? 'background-color: gray; border: none;"disabled' : '"'}>반려</button>
						</c:if>
						<c:if test="${fail eq 'Y' }">
						<button type="button" id="modifyBtn" class="btn btn-danger" style="float: right; ${emp_no eq draft.emp_no ? 'background-color: gray; border: none;"disabled' : '"'}>수정</button>
						</c:if>
					</div>	<!-- card footer End -->
				</div>
			</div>
		</div>	<!-- row End -->
	</section>

</div>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
	$('#cancelBtn').on('click', function(){
		window.opener.location.reload(true);
		window.close();
	})
	$('#payBtn').on('click', function(){
		if(confirm("결재를 진행하시겠습니까?")){
			location.href="/management/payForm.do?dr_no=${draft.dr_no}&pl_progress=${draft.pl_progress}";
		}
	})
	$('#failBtn').on('click', function(){
		if(confirm("반려를 진행하시겠습니까?")){
			OpenWindow("/management/failComment.do?dr_no=${draft.dr_no}&pl_progress=${draft.pl_progress}",
					"반려사유", 500, 500);
		}
	})
	$('#modifyBtn').on('click', function(){
		window.opener.location.reload(true);
		window.close();
	})
	
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
	};
</script>