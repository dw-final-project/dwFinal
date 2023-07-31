<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cri" value="${pageMaker.cri }"/>
<div style="height: 40px"></div>
<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width: 1100px;">
				<div class="card card-outline card-info">
					<div class="card-header" style="border-bottom: none;">
						<h2 class="card-title p-1">제품 발주</h2>
						<div class="input-group row" style="width: 90%; margin-left: 50%;">
						<form id="searchForm2" method="post" action="/product/productOrder.do?mcode=${mcode }" style="display: contents;">
							<select class="form-control col-md-2" name="searchType" id="searchType" style="font-size: 0.8em;">
								<option value="tcw" ${searchType eq 'pcw' ? 'selected' : '' }>전  체</option>
								<option value="t" ${searchType eq 'p' ? 'selected' : '' }>요청제품</option>
								<option value="w" ${searchType eq 'w' ? 'selected' : '' }>요청한사람</option>
								<option value="c" ${searchType eq 'c' ? 'selected' : '' }>요청업체</option>
							</select>
							<input class="form-control col-md-4" type="text" name="keyword" style="width: 60%; font-size: 0.8em" placeholder="검색어를 입력하세요." value="${keyword}">
							<span class="input-group-append col-md-3" style=" padding: 0px;">
								<button class="btn btn-primary" type="button" id="searchBtn">
									<i class="fa fa-fw fa-search" style="font-size: 0.8em; padding: 0px;"></i>
								</button>
							</span>
						</form>
						</div>
					</div>
					<div class="card-body pad">
						<div>
							<table style="font-size: 0.8em;" class="table table-borderd text-center">
								<tr>
									<th width="20%" style="text-align: center;">요청한 제품</th>
									<th width="20%" style="text-align: center;">요청 날짜</th>
									<th width="20%" style="text-align: center;">요청한 사람</th>
									<th width="20%" style="text-align: center;">진행상황</th>
									<th width="20%" style="text-align: center;">발주보고서 조회</th>
								</tr>
									<c:forEach items="${list}" var="order" varStatus="loop">
									<tr>
										<td style="text-align: center;"><a id="aTag" href="#" onclick="OpenWindow('/product/orderDetail.do?o_no=${order.o_no }', '발주 내역', 700, 700)">${order.o_name }</a></td>
										<td style="text-align: center;">${order.sys_regdate }</td>
										<td style="text-align: center;">${order.sys_reg }</td>
										<td style="text-align: center;">${order.progress }</td>
										<td style="text-align: center;"><a id="aTag" href="#" onclick="OpenWindow('/management/detail.do?dr_no=${order.dr_no}', '기안문', 700, 700)">${order.title }</a></td>
									</tr>
									</c:forEach>
							</table>
							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
							</div>
						</div>
					</div>
					</div>
					<div style="display: flex; align-items: end; justify-content: end;">
					<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow2('/product/orderRegist.do', '발주 요청', 700, 700)"
					style="width: 100px; margin: 20px; align-self: center;">발주 요청</button>
				</div>
			</div>
			
		</div>
	</section>
	
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	
<script>
		
	$('#searchBtn').on('click', function(){
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

	
</script>
<%@ include file="../include/footer_js.jsp" %>
