<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<section class="content container-fluid">
		<div class="row justify-content-center" style="margin: 5em;">
			<div class="col">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">생산입고 등록</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn">등록</button>
							&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn">닫기</button>
						</div>
					</div>
					<div class="card-body pad">
						<form role="form" method="post" action="/mymenu/noteRegist.do" name="registForm" enctype="multipart/form-data">

						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">General</h3>
								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse" title="Collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body">
								<div class="form-group">
									<label for="inputName">Project Name</label> <input type="text"
										id="inputName" class="form-control" value="AdminLTE">
								</div>
								<div class="form-group">
									<label for="inputDescription">Project Description</label>
									<textarea id="inputDescription" class="form-control" rows="4">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terr.</textarea>
								</div>
								<div class="form-group">
									<label for="inputStatus">Status</label> <select
										id="inputStatus" class="form-control custom-select">
										<option disabled="">Select one</option>
										<option>On Hold</option>
										<option>Canceled</option>
										<option selected="">Success</option>
									</select>
								</div>
								<div class="form-group">
									<label for="inputClientCompany">Client Company</label> <input
										type="text" id="inputClientCompany" class="form-control"
										value="Deveint Inc">
								</div>
								<div class="form-group">
									<label for="inputProjectLeader">Project Leader</label> <input
										type="text" id="inputProjectLeader" class="form-control"
										value="Tony Chicken">
								</div>
							</div>

						</div>









						<div class="card card-info">
							<div class="card-header">
								<h3 class="card-title">Files</h3>
								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse" title="Collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body p-0" style="display: block;">
								<table class="table">
									<thead>
										<tr>
											<th>File Name</th>
											<th>File Size</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Functional-requirements.docx</td>
											<td>49.8005 kb</td>
											<td class="text-right py-0 align-middle">
												<div class="btn-group btn-group-sm">
													<a href="#" class="btn btn-info"><i class="fas fa-eye"></i></a>
													<a href="#" class="btn btn-danger"><i
														class="fas fa-trash"></i></a>
												</div>
											</td>
										</tr>
										<tr>
											<td>UAT.pdf</td>
											<td>28.4883 kb</td>
											<td class="text-right py-0 align-middle">
												<div class="btn-group btn-group-sm">
													<a href="#" class="btn btn-info"><i class="fas fa-eye"></i></a>
													<a href="#" class="btn btn-danger"><i
														class="fas fa-trash"></i></a>
												</div>
											</td>
										</tr>
										<tr>
											<td>Email-from-flatbal.mln</td>
											<td>57.9003 kb</td>
											<td class="text-right py-0 align-middle">
												<div class="btn-group btn-group-sm">
													<a href="#" class="btn btn-info"><i class="fas fa-eye"></i></a>
													<a href="#" class="btn btn-danger"><i
														class="fas fa-trash"></i></a>
												</div>
											</td>
										</tr>
										<tr>
											<td>Logo.png</td>
											<td>50.5190 kb</td>
											<td class="text-right py-0 align-middle">
												<div class="btn-group btn-group-sm">
													<a href="#" class="btn btn-info"><i class="fas fa-eye"></i></a>
													<a href="#" class="btn btn-danger"><i
														class="fas fa-trash"></i></a>
												</div>
											</td>
										</tr>
										<tr>
											<td>Contract-10_12_2014.docx</td>
											<td>44.9715 kb</td>
											<td class="text-right py-0 align-middle">
												<div class="btn-group btn-group-sm">
													<a href="#" class="btn btn-info"><i class="fas fa-eye"></i></a>
													<a href="#" class="btn btn-danger"><i
														class="fas fa-trash"></i></a>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>






						<div class="form-group">
								<label for="title">제 목</label>
								<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력하세요.">
							</div>
							<div class="form-group">
								<input type="hidden" name="reply" value="0">
								<input type="hidden" name="writer" id="writer">
								<input type="hidden" name="receiver" id="receiver">
								<label for="writer">받는 업체</label>
								<input type="text" style="background-color: white;" id="name" name="name" class="form-control" readonly onclick="OpenWindow('/mymenu/findPeople.do', '사람찾기', 400, 600)">
							</div>
							<div class="form-group">
								<label for="file">첨부파일</label>
								<input type="file" id="file" name="file"> 
								<input type="hidden" id="fileName" name="fileName" value="">
							</div>
							
							<table class="table table-sm table-hover">
								<thead>
									<tr>
										<th scope="col">제품코드</th>
										<th scope="col">제품명</th>
										<th scope="col">수량</th>
										<th scope="col">외주비 단가</th>
										<th scope="col">외주비 합계</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1,001</td>
										<td>random</td>
										<td>data</td>
										<td>placeholder</td>
										<td>text</td>
									</tr>
									<tr>
										<td>1,002</td>
										<td>placeholder</td>
										<td>irrelevant</td>
										<td>visual</td>
										<td>layout</td>
									</tr>
									<tr>
										<td>1,003</td>
										<td>data</td>
										<td>rich</td>
										<td>dashboard</td>
										<td>tabular</td>
									</tr>
									<tr>
										<td>1,003</td>
										<td>information</td>
										<td>placeholder</td>
										<td>illustrative</td>
										<td>data</td>
									</tr>
									<tr>
										<td>1,004</td>
										<td>text</td>
										<td>random</td>
										<td>layout</td>
										<td>dashboard</td>
									</tr>
									<tr>
										<td>1,005</td>
										<td>dashboard</td>
										<td>irrelevant</td>
										<td>text</td>
										<td>placeholder</td>
									</tr>
									<tr>
										<td>1,006</td>
										<td>dashboard</td>
										<td>illustrative</td>
										<td>rich</td>
										<td>data</td>
									</tr>
									<tr>
										<td>1,007</td>
										<td>placeholder</td>
										<td>tabular</td>
										<td>information</td>
										<td>irrelevant</td>
									</tr>
									<tr>
										<td>1,008</td>
										<td>random</td>
										<td>data</td>
										<td>placeholder</td>
										<td>text</td>
									</tr>
									<tr>
										<td>1,009</td>
										<td>placeholder</td>
										<td>irrelevant</td>
										<td>visual</td>
										<td>layout</td>
									</tr>
									<tr>
										<td>1,010</td>
										<td>data</td>
										<td>rich</td>
										<td>dashboard</td>
										<td>tabular</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<script>
	$('#file').on('change', function() {
		$('#fileName').val($('#file').val());
	})
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width="
				+ WinWidth + ", " + "height=" + WinHeight + ",top=" + wintop
				+ ",left=" + winleft + ",resizable=yes,status=yes");
		win.focus();
	};

	$('#registBtn').on('click', function() {
		$('form[name="registForm"]').submit();
	})

	$('#cancelBtn').on('click', function() {
		window.opener.location.reload(true);
		window.close();
	})
</script>

<%@ include file="../../include/footer_js.jsp" %>