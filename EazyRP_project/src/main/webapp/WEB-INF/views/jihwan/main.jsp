<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 페이징 -->
<c:set var="cri" value="${pageMaker.cri }"/>
<body>
<form>

<div class="content-wrapper">
		<h1>견적서 관리 페이지</h1>
		<section class="row">
			<div class="col-1"></div>
			<div class="card col-10" style="margin-top:3em;">
				<div class="card-header with-border">
					<button type="button" class="btn btn-danger" id="" onclick="javascript:OpenWindow('estimate_regist.do','견적서 등록', 600 ,800);">등록</button>
					<div class="card-tools">
						<div class="input-group">
							<select class="custom-select form-control col-md-4" name="searchType" id="searchType" style="apa">
								<option value="nnc" ${cri.searchType eq 'nnc' ? 'selected' : '' }>전 체</option>
								<option value="number" ${cri.searchType eq 'number' ? 'selected' : '' }>글번호</option>
								<option value="code" ${cri.searchType eq 'code' ? 'selected' : '' }>공정코드</option>
								<option value="title" ${cri.searchType eq 'title' ? 'selected' : '' }>공정명</option>
							</select>
							<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }">
							<span class="input-group-append">
								<button class="btn btn-primary" type="button" onclick="searchList_go(1);">
									<i>검색</i>
								</button>
							</span>
						</div>
					</div>
				</div>

			<div class="card-body">
				<table class="table table-borderd text-center">
					<tr style="font-size:0.75em;">
						<th>견적서코드</th>
						<th>등록일자</th>
						<th>거래처명</th>
						<th>담당자</th>
						<th>품목명</th>
						<th>견적금액합계</th>
						<th>진행상태</th>
						<th>첨부파일여부</th>
					</tr>
<%-- 					<c:if test="${empty estimList }"> --%>
<!-- 						<tr> -->
<!-- 							<td colspan="5"> -->
<!-- 								<strong>해당 게시글이 없습니다.</strong> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<%-- 					</c:if> --%>
					<script>
						console.log('${estimList}')
					</script>
					<c:forEach items="${estimList }" var="estimate">		
<%-- 						<c:set var="est_no">${estimate.EST_NO }</c:set> --%>
						<tr style="font-size: 0.85em;">
							<td><a href="javascript:OpenWindow('estimateDetail.do?est_no=${estimate.EST_NO }','견적서 조회', 800 ,800);">${estimate.EST_NO }</a></td>
							<td>
							<fmt:formatDate value="${estimate.REGDATE }" pattern="yyyy-MM-dd"></fmt:formatDate>
							</td>
							<td>${estimate.C_NAME }</td>
							<td>${estimate.E_NAME }</td>
							<td>${estimate.P_AMOUNT_NAME }</td>
							<td>${estimate.AMOUNT }</td>
							<td>${estimate.PROGRESS }</td>
							<td>${estimate.FILES != null ? "y" : "n"}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<div class="card-footer">
			<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
			
		</div>
	</section>
</div>
</div>
</form>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<%@ include file="../include/footer_js.jsp" %>
