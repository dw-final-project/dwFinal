<%-- <%@ include file="../include/header.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- main -->

<body>

	<div class="text-center" style="display: flex; margin-top: 1em; max-height: 70%">

		<div class="" style="width: 40%;">
			<div class="card mb-6 rounded-3 shadow-sm border">
				<div class="card-header py-3">
					<h5 class="my-0 fw-normal">캘린더</h5>
				</div>
				<div class="card-body">
					<div>
						<%@ include file="calendar.jsp"%>
					</div>
				</div>
			</div>
		</div>

		<div class="col">
			<div class="card mb-3 rounded-3 shadow-sm border" style="height: 75%;" >
				<div class="card-header py-3">
					<h5 class="my-0 fw-normal">굴다리</h5>
				</div>
				<div class="card-body">
					<p>내용2</p>
				</div>
			</div>
		</div>

		<div class="col">
			<div class="card mb-3 rounded-3 shadow-sm border" style="height: 75%;" >
				<div class="card-header py-3">
					<h5 class="my-0 fw-normal">전자 결재</h5>
				</div>
				<div class="card-body">
					<table class="table table-striped table-sm text-center" style="font-size: 0.8em;">
						<thead>
							<tr>
								<th class="p-2 mb-2 align-middle scope=">
								<font style="vertical-align: inherit; vertical-align: inherit; color: black;">결재서류명</font>
								</th>
								<th class="p-2 mb-2 align-middle scope="><font
									style="vertical-align: inherit; vertical-align: inherit; color: black;">기안자</font>
								</th>
								<th class="p-2 mb-2 align-middle scope="><font
									style="vertical-align: inherit; vertical-align: inherit; color: black;">구분</font>
								</th>
								<th class="p-2 mb-2 align-middle scope="><font
									style="vertical-align: inherit; vertical-align: inherit; color: black;">진행상태</font>
								</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${draft }" var="draft">
							<tr>
								<td><font style="vertical-align: inherit;"> 
								<font style="vertical-align: inherit;"><a href="#" onclick="OpenWindow('/management/detail.do?dr_no=${draft.dr_no }&send=N', '기안문 조회', 700, 1000)">${draft.title }</a>
								</font>
								</font>
								</td>
								<td><font style="vertical-align: inherit;"> <font
										style="vertical-align: inherit;">${draft.e_name }</font>
								</font></td>
								<td><font style="vertical-align: inherit;"> <font
										style="vertical-align: inherit;">${draft.gb }</font>
								</font></td>
								<td>
									<font style="vertical-align: inherit;"> 
										<font style="vertical-align: inherit;">
											<c:if test="${draft.pl_progress eq '0'}">
												결재 대기중
											</c:if>
											<c:if test="${draft.pl_progress eq '1' || draft.pl_progress eq '2'}">
												결재 진행중(${draft.pl_progress})
											</c:if>
											<c:if test="${draft.pl_progress eq '3'}">
												결재 완료
											</c:if>
											<c:if test="${draft.pl_progress eq '1fail' || draft.pl_progress eq '2fail' || draft.pl_progress eq '3fail'}">
												반려
											</c:if>
										</font>
									</font>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<hr>
				</div>
			</div>
		</div>
		
		
		
	</div>
		<div class="" style="width:59%; height:20%; right: 10px; bottom: 10%; position: absolute; z-index: 2">
			<div class="card rounded-3 shadow-sm border" style="height: 110%;">
				<div class="card-header">
					<h5 class="my-0 fw-normal" style="font-size: 1em">오더관리진행단계</h5>
				</div>
				<div class="card-body">
					<div>
						asedlkfnwelkr<br>
						asdfkhasdf
					</div>
				</div>
			</div>
		</div>

</body>

</html>
<!-- jQuery -->
<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
							+ "height=" + WinHeight + ",top="+ wintop + ",left="
							+ winleft + ",resizable=yes,status=yes");
	win.focus();
};
</script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<%@ include file="../include/footer_js.jsp"%>
