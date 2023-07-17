<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cri" value="${pageMaker.cri }" />
<div style="height: 40px"></div>
<section class="content container-fluid">
	<div class="row justify-content-center">
		<div class="col-md-10" style="max-width: 1100px;">
			<div class="card card-outline card-info">
				<div class="card-header">
					<h3 class="card-title p-1">견 적 서</h3>
					<button type="button" class="btn btn-danger" id=""
						onclick="javascript:OpenWindow('estimate_regist.do','견적서 등록', 600 ,800);">등록</button>
					<div class="input-group row" style="width: 90%; margin-left: 50%;">
						<form id="searchForm" method="post"
							action="/mymenu/search.do?mcode=${mcode }"
							style="display: contents;">
							<select class="form-control col-md-2" name="searchType"
								id="searchType" style="font-size: 0.8em;">
								<option value="tcw" ${searchType eq 'tcw' ? 'selected' : '' }>전
									체</option>
								<option value="t" ${searchType eq 't' ? 'selected' : '' }>제
									목</option>
								<option value="w" ${searchType eq 'w' ? 'selected' : '' }>보낸사람</option>
								<option value="c" ${searchType eq 'c' ? 'selected' : '' }>업
									체</option>
							</select> <input class="form-control col-md-4" type="text" name="keyword"
								style="width: 60%; font-size: 0.8em" placeholder="검색어를 입력하세요."
								value="${keyword}"> <span
								class="input-group-append col-md-3" style="padding: 0px;">
								<button class="btn btn-primary" type="button" id="searchBtn">
									<i class="fa fa-fw fa-search"
										style="font-size: 0.8em; padding: 0px;"></i>
								</button>
							</span>
						</form>
					</div>
				</div>
				<div class="card-body pad">
					<div>
						<table style="font-size: 0.8em; display: table; width: 100%">
							<tr>
								<th style="text-align: center;">견적서코드</th>
								<th style="text-align: center;">등록일자</th>
								<th style="text-align: center;">거래처명</th>
								<th style="text-align: center;">담당자</th>
								<th style="text-align: center;">품목명</th>
								<th style="text-align: center;">견적금액합계</th>
								<th style="text-align: center;">진행상태</th>
								<th style="text-align: center;">첨부파일여부</th>
							</tr>
							<tr style="height: 20px;"></tr>
							<c:forEach items="${estimList }" var="estimate">
								<%-- 						<c:set var="est_no">${estimate.EST_NO }</c:set> --%>
								<tr style="font-size: 1em; text-align : center;">
									<td><a
										href="javascript:OpenWindow('estimateDetail.do?est_no=${estimate.EST_NO }','견적서 조회', 800 ,800);">${estimate.EST_NO }</a></td>
									<td><fmt:formatDate value="${estimate.REGDATE }"
											pattern="yyyy-MM-dd"></fmt:formatDate></td>
									<td>${estimate.C_NAME }</td>
									<td>${estimate.E_NAME }</td>
									<td>${estimate.P_AMOUNT_NAME }</td>
									<td>${estimate.AMOUNT }</td>
									<td>${estimate.PROGRESS == null ? "진행중" : "처리중" }</td>
									<td>${estimate.FILES != null ? "y" : "n"}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="card-footer">
							<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
						</div>
					</div>
				</div>
			</div>
			<div style="display: flex; align-items: end; justify-content: end;">
				<button type="button" class="btn btn-primary" id="registBtn"
					onclick="OpenWindow2('/mymenu/communication.do', '쪽지쓰기', 700, 1000)"
					style="width: 100px; margin: 20px; align-self: center;">쪽지
					쓰기</button>
			</div>
		</div>

	</div>
</section>

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>


<%@ include file="../include/footer_js.jsp"%>

<script>
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
	}
</script>


<!-- jQuery -->
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<%@ include file="../include/footer_js.jsp"%>
