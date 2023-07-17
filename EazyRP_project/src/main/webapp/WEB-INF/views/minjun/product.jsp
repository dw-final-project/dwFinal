<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <!-- fullcalendar -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>

<!-- 페이징 -->
<c:set var="cri" value="${pageMaker.cri }"/>

<body>
<div class="container col-10">
	
<div class="content-wrapper">
	<%-- <jsp:include page="../content_header.jsp">
		<jsp:param value="게시판리스트" name="subject"/>
		<jsp:param value="목록" name="item"/>
	</jsp:include> --%>
	<h3>상품관리</h3>
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width: 1100px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">상품관리</h3>
						<div class="input-group row" style="width: 90%; margin-left: 50%;">
						<form id="searchForm" method="post" action="/minjun/productSearch.do?mcode=${mcode }" style="display: contents;">
							<select class="custom-select form-control col-md-3" name="searchType" id="searchType" style="">
								<option value="nnc" ${cri.searchType eq 'nnc' ? 'selected' : '' }>전 체</option>
								<option value="number" ${cri.searchType eq 'number' ? 'selected' : '' }>상품코드</option>
								<option value="code" ${cri.searchType eq 'code' ? 'selected' : '' }>쇼핑몰명</option>
								<option value="title" ${cri.searchType eq 'title' ? 'selected' : '' }>제품명</option>
							</select>
							<input class="form-control col-md-3" type="text" name="keyword" style="width: 60%; font-size: 0.8em" placeholder="검색어를 입력하세요." value="${keyword}">
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
							<table class="table table-bordered text-center" style="font-size: 0.8em; display: table; width: 100%;" >
								<tr>
									<th width="" style="text-align: center;">상품코드</th>
									<th width="" style="text-align: center;">쇼핑몰명</th>
									<th width="" style="text-align: center;">제품명</th>
									<th width="" style="text-align: center;">수량</th>
									<th width="" style="text-align: center;">입고 단가</th>
									<th width="" style="text-align: center;">출고 단가</th>
									<th width="" style="text-align: center;">판매상태</th>
									<th width="" style="text-align: center;">판매시작일</th>
									<th width="" style="text-align: center;">판매종료일</th>
								</tr>
							<c:if test="${empty productList }">
								<tr style="height: 20px;">
									<td colspan="5">
										<strong>해당 게시글이 없습니다.</strong>
									</td>
								</tr>
							</c:if>
							<c:forEach items="${productList }" var="product">
									<tr>
										<td style="text-align: center;">${product.pr_no }</td>
										<td style="text-align: center;">쇼핑몰명</td>
										<td style="text-align: center;">${product.pr_name }</td>
										<td style="text-align: center;">${product.quantity }</td>
										<td style="text-align: center;">${product.pr_inprice }</td>
										<td style="text-align: center;">${product.pr_exprice }</td>
										<td style="text-align: center;">판매시작일</td>
										<td style="text-align: center;">판매종료일</td>
									</tr>
								</c:forEach>
							</table>
							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination2.jsp" %>
							</div>
						</div>
					</div>
					</div>
					<div style="display: flex; align-items: end; justify-content: end;">
					<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('productRegistForm.do', '상품등록', 700, 1000)"
					style="width: 100px; margin: 20px; align-self: center;">상품등록</button>
				</div>
			</div>
			
		</div>
	</section>
</div>
</div>
</body>
</html>

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
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<%@ include file="../include/footer_js.jsp" %>
