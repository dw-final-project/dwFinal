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

<!-- <div class="container col-10">
	sidebar   
    <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style=" float:left ; width: 20%; height: 100%; display: inline;">
      <div class="d-flex align-items-center pb-3 mb-3 text-decoration-none border-bottom">
        <span class="fs-5 fw-semibold"> 개인정보 </span>
      </div>
      <ul class="list-unstyled ps-0">
        <li class="mb-1">
          <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
            개인정보 조회 및 수정
          </a>
        </li>
        <li class="mb-1">
          <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
            회원탈퇴
          </a>
        </li>
      </ul>
        <div class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
           <span class="fs-5 fw-semibold"> 관리자 문의 </span>
        </div>
        <ul class="list-unstyledv ps-0">
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              관리자 문의하기
            </a>
          </li>
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              문의 답변 확인
            </a>
          </li>
        </ul>     
        </div> -->
	
	<div class="content-wrapper">
<%-- 			<jsp:include page="../content_header.jsp"> --%>
<%-- 				<jsp:param value="게시판리스트" name="subject"/> --%>
<%-- 				<jsp:param value="목록" name="item"/> --%>
<%-- 			</jsp:include> --%>
		
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
									<i class="fa-search">검색</i>
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
						<c:forEach items="${processList }" var="process">		
							<tr style="font-size: 0.85em;">
								<td>${process.pc_no }</td>
								<td>
									<a href="javascript:OpenWindow('detail.do?pc_code=${process.pc_code}', '공정상세보기', 800, 700);">${process.pc_code}</a>
								</td>								
								<td>${process.pc_name}</td>
								<td>${process.pc_order}</td>
								<td><span class="badge bg-red" onclick="">등록</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 페이징 -->
				<div class="card-footer">
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
				</div>
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
