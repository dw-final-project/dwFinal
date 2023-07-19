<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 페이징 -->
<c:set var="cri" value="${pageMaker.cri }"/>

<body>
	
	<div class="content-wrapper">
		<h1>공정 관리 페이지</h1>
		<section class="row">
			<div class="col-1"></div>
			<div class="card col-10" style="margin-top:3em;">
				<div class="card-header with-border">
					<button type="button" class="btn btn-success" id="" onclick="OpenWindow('registForm.do', '공정등록', 800, 700);">등록</button>
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
						<tr style="font-size:0.95em;">
							<th>글번호</th>
							<th>생산공정코드</th>
							<th>생산공정명</th>
							<th>순번</th>
							<th>작업코드등록</th>
						</tr>
						<c:if test="${empty processList }">
							<tr>
								<td colspan="5">
									<strong>해당 게시글이 없습니다.</strong>
								</td>
							</tr>
						</c:if>
						<%-- <c:forEach items="${processList }" var="process">		
							<tr style="font-size: 0.85em;">
								<td>${process.pc_no }</td>
								<td>
									<a href="javascript:OpenWindow('detail.do?pc_code=${process.pc_code}', '공정상세보기', 800, 700);">${process.pc_code}</a>
								</td>								
								<td>${process.pc_name}</td>
								<td>${process.pc_order}</td>
								<td><span class="badge bg-red" onclick="">등록</span></td>
							</tr>
						</c:forEach> --%>
					</table>
				</div>
				<!-- 페이징 -->
				<div class="card-footer">
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
				</div>
				
				<!-- 캘린더 이동 페이지 -->
				<button type="button" class="btn btn-danger" id="calendarBtn" onclick="OpenWindow('calendar.do', '일정관리', 800, 700);">일정 관리 페이지</button>
			
			</div>
		</section>
	</div>
	
	
</body>
</html>

<script>
	
	// 팝업창 띄우기
	// 새로운 Window 창을 Open 할 경우 사용되는 함수 (arg : 주소, 창 타이틀, 넓이, 길이)
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
	}
	
	// 팝업창 닫기
	function CloseWindow(){
		self.opener = self;
    // 	if (window.opener) window.opener.location.reload(true);
		window.close();
	}
	
	
	
</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<%@ include file="../include/footer_js.jsp" %>
