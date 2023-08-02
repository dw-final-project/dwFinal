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
						<h2 class="card-title p-1">문의사항</h2>
						<div class="input-group row" style="width: 90%; margin-left: 50%;">
						<form id="searchForm2" method="post" action="/member/qna.do?mcode=${mcode }" style="display: contents;">
							</form>
						</div>
					</div>
					
					<div class="card-body pad">
					<div>
							<table class="table accordion text-center">
								<thead>
									<tr>
										<th scope="col" width="300px" style="text-align: center;">내 용</th>
										<th scope="col" width="100px" style="text-align: center;">날 짜</th>
										<th scope="col" width="100px" style="text-align: center;">답변여부</th>
									</tr>
								</thead>
								<c:forEach items="${qnaList}" var="qna">
									<tbody>
										<tr id ="r2" data-bs-toggle="collapse" data-bs-target="#r1">
											<td style="text-align: center;">${qna.INQ_TITLE }</td>
											<td style="text-align: center;">${qna.REGDATE }</td>
											<td style="text-align: center;">${empty qna.ANS_CON ? 'N' : 'Y' }</td>
										</tr>
										<tr class="collapse accordion-collapse" style="position: absolute; z-index : 1; display: contents;" id="r1"
											data-bs-parent=".table">
											<td colspan="3" >${qna.ANS_CON }</td>
										</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
							</div>
						</div>
						<div style="display: flex; align-items: end; justify-content: end;">
								<button type="button" class="btn btn-primary" id="registBtn" action="/common/inqurty.do"
								style="width: 100px; font-size: 0.8em; margin: 20px; align-self: center;">문의 하기</button>
						</div>
					</div>
				</div>

	</section>
	
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
	
<script>
	

</script>
<%@ include file="../include/footer_js.jsp"%>
