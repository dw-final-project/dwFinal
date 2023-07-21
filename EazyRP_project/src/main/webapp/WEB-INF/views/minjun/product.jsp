<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <!-- fullcalendar -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

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
	<section class="row-1">
		<div class="col-1"></div>
		<div class="card col-10" style="margin-top:3em;">
			<div class="card-header with-border">
				<button type="button" class="btn btn-danger" id="" onclick="OpenWindow('productRegistForm.do', '글등록', 800, 900);">등록</button>
				<div class="card-tools" style="width: 350px;">
					<div class="input-group row">
						<select class="form-control col-md-4" name="searchType" id="searchType">
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected' : '' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected' : '' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected' : '' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected' : '' }>내용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected' : '' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected' : '' }>작성자+내용</option>
						</select>
						<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }">
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="searchList_go();">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<table class="table table-borderd text-center">
					<tr style="font-size:0.95em;">
						<th>상품코드</th>
						<th>쇼핑몰명</th>
						<th>제품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>판매상태</th>
						<th>판매시작일</th>
						<th>판매종료일</th>
					</tr>
					<c:if test="${empty boardList }">
						<tr>
							<td colspan="12">
								<strong>상품이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<c:forEach items="${boardList }" var="board">		
						<tr style="font-size: 0.85em;">
							<td>${board.bno }</td>
							<td style="text-align:left;">
								<a href="javascript:OpenWindow('detail.do?bno=${board.bno }', '게시글상세보기', 800, 700);">
									<span class="col-sm-12">
										${board.title }
										<c:if test="${board.replycnt ne 0 }">				<!-- eq : = , ne : != -->
											<span class="nav-item">
												&nbsp;&nbsp;
												<i class="fa fa-comment"></i>
												<span class="badge badge-warning navbar-badge">${board.replycnt }</span>
											</span>
										</c:if> 			
									</span>
								</a> 
							</td>
							<td>${board.writer }</td>
							<td>
								<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"></fmt:formatDate>
							</td>
							<td><span class="badge bg-red">${board.viewcnt }</span></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="card-footer">
				페이지처리 위치
<%-- 			<%@ include file="/WEB-INF/views/common/pagination.jsp" %> --%>
			</div>
		</div>
		<div class="row ">
			<div class="col-8">
				<div style="display: flex; align-items: end; justify-content: end;">
					<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow2('/mymenu/communication.do', '쪽지쓰기', 700, 1000)"
					style="width: 100px; margin: 20px; align-self: center;">쪽지 쓰기</button>
				</div>
			</div>
			
		</div>
		<div class="row ">
			<div class="col-md-10" style="max-width: 1100px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">받은 쪽지함</h3>
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
							<table style="font-size: 0.8em;">
								<tr>
									<th width="50px" style="text-align: center;"></th>
									<th width="350px" style="text-align: center;">제목</th>
									<th width="150px" style="text-align: center;">보낸 사람</th>
									<th width="220px" style="text-align: center;">업체명</th>
									<th width="120px" style="text-align: center;">첨부파일 여부</th>
									<th width="300px" style="text-align: center;">보낸 시간</th>
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
									</tr>
							</table>
							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination2.jsp" %>
							</div>
						</div>
					</div>
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
