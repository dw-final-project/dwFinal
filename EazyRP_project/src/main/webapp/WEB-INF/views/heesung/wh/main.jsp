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
						<h2 class="card-title p-1">생산입고 목록</h2>
						<div class="input-group row" style="width: 90%; margin-left: 50%;">
						<form id="searchForm" method="post" action="/erp4/wh.do?mcode=${mcode }" style="display: contents;">
							<select class="form-control col-md-2 custom-select" name="searchType" id="searchType" style="font-size: 0.8em;">
								<option value="tcw" ${searchType eq 'tcw' ? 'selected' : '' }>전  체</option>
								<option value="t" ${searchType eq 't' ? 'selected' : '' }>제  목</option>
								<option value="w" ${searchType eq 'w' ? 'selected' : '' }>보낸사람</option>
								<option value="c" ${searchType eq 'c' ? 'selected' : '' }>업  체</option>
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
									<th width="20%" style="text-align: center;">등록일자</th>
									<th width="20%" style="text-align: center;">생산입고코드</th>
									<th width="20%" style="text-align: center;">제품명</th>
									<th width="20%" style="text-align: center;">작업지시서</th>
									<th width="20%" style="text-align: center;">상태</th>
								</tr>
									<c:forEach items="${whList}" var="wh" varStatus="loop">
									<tr>
										<td style="text-align: center;"><fmt:formatDate value="${wh.sys_regdate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
										<td style="text-align: center;">
											<a id="whDetailBtn" href="#" onclick="detailOpenWindow('erp4/wh/detail.do'), '생산입고 상세정보', 700, 1000)">
												${wh.wh_no}
											</a>
										</td>
										<td style="text-align: center;">${wh.pr_name}</td>
										<td style="text-align: center;">아직안됨ㅋ</td>
										<td style="text-align: center;">${wh.progress == '0' ? '대기중' : (wh.progress == '1' ? '진행중' : '완료')}</td>
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
					<button type="button" class="btn btn-primary" id="registBtn" onclick="registOpenWindow('/erp4/wh/registForm.do', '생산입고 등록', 700, 1000)"
					style="width: 100px; margin: 20px; align-self: center;">등록</button>
				</div>
			</div>
		</div>
	</section>
	
	
<script>
		
	$('#searchBtn').on('click', function(){
		$('#searchForm').submit();
	})
	
	function detailOpenWindow(UrlStr, WinTitle, WinWidth, WinHeight, index){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
	};
	
	function registOpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
	};
	
</script>

<%@ include file="../../include/footer_js.jsp" %>
