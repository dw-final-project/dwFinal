<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>

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
<form>
<div class="container col-10" style="margin-left: 30px;">
	<!-- sidebar -->   
    <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style=" float:left ; width: 20%; height: 100%; display: inline;">
      <div class="d-flex align-items-center pb-3 mb-3 text-decoration-none border-bottom">
        <span class="fs-5 fw-semibold"> 견적서 </span>
      </div>
      <ul class="list-unstyled ps-0">
        <li class="mb-1">
          <a href = "javascript:OpenWindow('estimate.do','견적서 등록', 600 ,800);" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="" data-bs-target="" aria-expanded="true">
           견적서 등록
          </a>
        </li>
        <li class="mb-1">
          <a href = "#" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
            견적서 변경/삭제
          </a>
        </li>
        <li class="mb-1">
          <a href="/erp3/estimateSelect.do" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="" data-bs-target="" aria-expanded="false">
            견적서 조회
          </a>
        </li>
      </ul>
        <div class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
           <span class="fs-5 fw-semibold"> 주문서 </span>
        </div>
        <ul class="list-unstyledv ps-0">
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
             주문서 등록
            </a>
          </li>
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
            주문서 변경/삭제
            </a>
          </li>
            <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
            주문서 조회
            </a>
          </li>
        </ul> 
        <div class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
           <span class="fs-5 fw-semibold"> 판매 </span>
        </div>
            <ul class="list-unstyledv ps-0">
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              판매 등록
            </a>
          </li>
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
             판매 변경/삭제
            </a>
          </li>
            <li class="mb-1" style="list-style: none;">
            <a href="/erp3/s_Sheet.do" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="" data-bs-target="" aria-expanded="false">
             판매 조회
            </a>
          </li>
        </ul>
        <div class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
           <span class="fs-5 fw-semibold"> 출하지시서 </span>
        </div>
            <ul class="list-unstyledv ps-0">
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              출하 지시서 등록
            </a>
          </li>
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              출하 지시서 변경/삭제
            </a>
          </li>
            <li class="mb-1" style="list-style: none;">
            <a href="/erp3/siSelect.do" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="" data-bs-target="" aria-expanded="false">
              출하 지시서 조회
            </a>
          </li>
          <li class="mb-1" style="list-style: none;">
            <a class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              출하 현황
            </a>
          </li>
        </ul> 
         
        </div>
	
<div class="content-wrapper">
	<%-- <jsp:include page="../content_header.jsp">
		<jsp:param value="게시판리스트" name="subject"/>
		<jsp:param value="목록" name="item"/>
	</jsp:include> --%>
	
	<section class="row">
		<div class="col-1"></div>
		<div class="card col-13" style="margin-top:3em;">
			<div class="card-header with-border">
				<button type="button" class="btn btn-danger" id="" onclick="javascript:OpenWindow('estimate.do','견적서 등록', 600 ,800);">등록</button>
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
					<tr style="font-size:0.75em;">
						<th>견적서코드</th>
						<th>등록일자</th>
						<th>사원번호</th>
						<th>외화코드</th>
						<th>견적금액</th>
						<th>진행상태</th>
						<th>사용구분</th>
						<th>창고 제품</th>
						<th>수량</th>
						<th>수정자</th>
						<th>수정일</th>
						<th>최초등록자</th>
						<th>첨부파일</th>
					</tr>
					<c:if test="${empty estimList }">
						<tr>
							<td colspan="5">
								<strong>해당 게시글이 없습니다.</strong>
							</td>
						</tr>
					</c:if>
					<c:forEach items="${estimList }" var="estimate">		
						<tr style="font-size: 0.85em;">
							<td><a href="javascript:OpenWindow('estimateSelect.do?est_no=${estimate.est_no }','견적서 조회', 800 ,800);">${estimate.est_no }</a></td>
							<td>
							<fmt:formatDate value="${estimate.sys_regdate }" pattern="yyyy-MM-dd"></fmt:formatDate>
							</td>
							<td>${estimate.emp_no }</td>
							<td>${estimate.fc_no }</td>
							<td>${estimate.amount }</td>
							<td>${estimate.progress }</td>
							<td>${estimate.enabled }</td>
							<td>${estimate.wh_no }</td>
							<td>${estimate.quantity }</td>
							<td>${estimate.sys_up }</td>
							<td>
							<fmt:formatDate value="${estimate.sys_updatedate }" pattern="yyyy-MM-dd"></fmt:formatDate>
							</td>
							<td>${estimate.sys_reg }</td>
							<td>${estimate.files }</td>
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

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<%@ include file="../include/footer_js.jsp" %>
