<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<!-- 페이징 -->
<c:set var="cri" value="${pageMaker.cri }"/>

<style> /* 소라 사이드바 스타일 */
    html, body{
      width: 100%;
      height: 100%;
    }
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }

    .b-example-divider {
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .05);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .p-2 {
      color: whitesmoke;
    }

    .nav d-flex {
      justify-content: space-evenly;
    }
    
    .container {
    	
    }
</style>

<body>
<div class="container col-10">
	
<div class="content-wrapper">
	<%-- <jsp:include page="../content_header.jsp">
		<jsp:param value="게시판리스트" name="subject"/>
		<jsp:param value="목록" name="item"/>
	</jsp:include> --%>
	<h3>주문관리</h3>
	<section class="row">
		<div class="col-1"></div>
		<div class="card col-10" style="margin-top:3em;">
			<div class="card-header with-border">
				<button type="button" class="btn btn-danger" id="" onclick="OpenWindow('orderRegistForm.do', '글등록', 800, 900);">등록</button>
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
						<th>주문번호</th>
						<th>상품코드</th>
						<th>주문수량</th>
						<th>주문일</th>
						<th>배송방법</th>
						<th>송장번호</th>
						<th>배송시작일</th>
						<th>배송종료일</th>
						<th>진행상태</th>
						<th>실패사유</th>
					</tr>
					<c:if test="${empty boardList }">
						<tr>
							<td colspan="12">
								<strong>주문이 없습니다.</strong>
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
