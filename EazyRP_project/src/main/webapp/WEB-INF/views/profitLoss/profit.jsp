<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">

<c:set var="cri" value="${pageMaker.cri }"/>
<div style="height: 40px"></div>
<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width: 1100px;">
				<div class="card card-outline card-info">
					<div class="card-header" style="border-bottom: none; padding-bottom: 0px;">
						<h2 class="card-title p-1">손익 발생 내역 조회</h2>
						<div class="input-group row">
						<form id="searchForm2" method="post" action="/profitLoss/profit.do?mcode=${mcode }" style="font-size:0.9em; margin-left: 33%;">
							손익 구분 <select class="form-control col-md-2" name="searchType1" id="searchType1" style="font-size: 0.8em; width: 10%; margin: 10px; display: inline;" >
								<option value="all" ${cri2.searchType1 eq 'all' ? 'selected' : '' }>전  체</option>
								<option value="l" ${cri2.searchType1 eq 'l' ? 'selected' : '' }>손해 내역</option>
								<option value="p" ${cri2.searchType1 eq 'p' ? 'selected' : '' }>이익 내역</option>
							</select>
							발생 날짜 <input type="month" value="${cri2.startDate }" id="startDate" name="startDate" style="margin: 10px; width:15%; display: inline; font-size: 0.9em;"class="form-control">
							 ~ <input type="month" value="${cri2.endDate }" id="endDate" name="endDate" style="margin: 10px; width:15%; display: inline; font-size: 0.9em;"class="form-control">
							<span class="input-group-append col-md-3" style=" padding: 0px; margin: 10px; display: inline;">
								<button class="btn btn-primary" type="button" id="searchBtn">
									<i class="fa fa-fw fa-search" style="font-size: 0.8em; padding: 0px;"></i>
								</button>
							</span>
						</form>
						</div>
					</div>
					<div class="card-body pad" style="padding-top: 0px;">
						<div>
							<table style="font-size: 0.5em;" class="table table-borderd text-center">
								<tr height="40px;" style="font-size: 12px; background-color: #dddddd; font-weight: bold;">
										<td colspan="2" style="">선택한 날짜 범위 : ${cri2.startDate } ~ ${cri2.endDate }</td>
										<td style="color: ${total > 0 ? 'blue' : 'red' };">총 손익 금액 : ${total }원</td>
										<td colspan="2" style="color: ${prevAmount > 0 ? 'blue' : 'red' };">전년 대비 : ${prevAmount }원</td>
									</tr>
								<tr height="40px;">
									<th width="20%" style="text-align: center;">발생 월</th>
									<th width="20%" style="text-align: center;">손익</th>
									<th width="20%" style="text-align: center;">전년 손익</th>
									<th width="20%" style="text-align: center;">전년 대비</th>
									<th width="20%" style="text-align: center;">손익 발생 정보</th>
								</tr>
								<c:forEach items="${amount}" var="amount" varStatus="var">
									<tr height="40px;">
										<td style="text-align: center;">${month.get(var.index) }</td>
										<td style="text-align: center;">${amount} 원</td>
										<td style="text-align: center;">${amount3.get(var.index) }원</td>
										<td style="text-align: center;">${b.get(var.index) }원</td>
										<td style="text-align: center;"><a id="aTag" href="#" onclick="OpenWindow('/profitLoss/openMonth.do?month=${month.get(var.index)}', '상세 조회', 900, 700)">상세조회</a></td>
									</tr>
								</c:forEach>
									
							</table>
							<div class="card-footer">
							</div>
						</div>
					</div>
					</div>
					<div style="display: flex; align-items: end; justify-content: end;">
				</div>
			</div>
			
		</div>
	</section>
	
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script>
		
	$('#searchBtn').on('click', function(){
		var startDateInput = $("#startDate").val();
	    var endDateInput = $("#endDate").val();

	    var startDate = new Date(startDateInput);
	    var endDate = new Date(endDateInput);

	    if (startDate > endDate) {
	    	alert('시작 날짜가 종료 날짜보다 이후입니다.');
	    	return;
	    }
		$('#searchForm2').submit();
	})
	
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight, index){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
	};
	
	function OpenWindow2(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
	};
	
	$('input[name="startDate"]').on('change', function(){
		
		$('input[name="endDate"]').val($('input[name="startDate"]').val());
	})
	
</script>
<%@ include file="../include/footer_js.jsp" %>
