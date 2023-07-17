<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<!-- 페이징 -->
<c:set var="cri" value="${pageMaker.cri }"/>

<body>
<div class="container col-10">
	
<div class="content-wrapper">
	<h3>주문관리</h3>
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width: 1100px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">주문관리</h3>
						<div class="input-group row" style="width: 90%; margin-left: 50%;">
						<form id="searchForm" method="post" action="/mymenu/search.do?mcode=${mcode }" style="display: contents;">
							<select class="form-control col-md-2" name="searchType" id="searchType" style="font-size: 0.8em;">
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
							<table style="font-size: 0.8em; display: table; width: 100%" >
								<tr>
									<th width="" style="text-align: center;">주문번호</th>
									<th width="" style="text-align: center;">상품코드</th>
									<th width="" style="text-align: center;">주문수량</th>
									<th width="" style="text-align: center;">주문일</th>
									<th width="" style="text-align: center;">배송방법</th>
									<th width="" style="text-align: center;">송장번호</th>
									<th width="" style="text-align: center;">배송시작일</th>
									<th width="" style="text-align: center;">배송종료일</th>
									<th width="" style="text-align: center;">진행상태</th>
									<th width="" style="text-align: center;">실패사유</th>
								</tr>
									<tr style="height: 20px;"></tr>
									<tr>
										<td id="read_${loop.index}" style="text-align: center; height:80%; font-weight:bold; font-size: 0.7em; color: ${note.readable == 'N' ? 'red' : 'blue' };">
										1
										</td>
										<td style="text-align: center;"><a id="aTag" href="#" onclick="OpenWindow('/mymenu/detail.do?n_no=${note.n_no }&send=N', '쪽지보기', 700, 1000, '${loop.index}')">2</a></td>
										<td style="text-align: center;">3</td>
										<td style="text-align: center;">4</td>
										<td style="text-align: center;">5</td>
										<td style="text-align: center;">6</td>
										<td style="text-align: center;">7</td>
										<td style="text-align: center;">8</td>
										<td style="text-align: center;">9</td>
										<td style="text-align: center;">10</td>
									</tr>
							</table>
							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination2.jsp" %>
							</div>
						</div>
					</div>
					</div>
					<div style="display: flex; align-items: end; justify-content: end;">
					<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('orderRegistForm.do', '주문등록', 700, 1000)"
					style="width: 100px; margin: 20px; align-self: center;">주문등록</button>
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

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<%@ include file="../include/footer_js.jsp" %>
