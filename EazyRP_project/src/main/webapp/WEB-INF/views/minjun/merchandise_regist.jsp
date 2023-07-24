<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">

<div style="height: 50px"></div>
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width: 600px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">상품 등록</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn">취 소</button>
						</div>
					</div>
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group col-sm-12 row">
								<label for="pc_no" class="col-sm-3">상품 코드</label>
								<input type="text" id="pc_no" name="pc_no" class="form-control col-sm-9" placeholder="상품코드는 자동등록 됩니다." readonly>
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-3">쇼핑몰 코드</label>
								<input type="text" id="shname" name="s_name" class="form-control col-sm-9 s_name" value="" placeholder="쇼핑몰코드를 입력하세요.">
								<input type="hidden" id="s_no_receiver" name="s_name" value="">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-3">제품 이름</label>
								<input type="text" id="name" name="pr_name" class="form-control col-sm-9 pr_no" value="" placeholder="제품이름을 입력하세요.">
								<input type="hidden" id="pr_no_receiver" name="pr_no" value="">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-3">수량</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-9" value="" placeholder="수량을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-3">가격</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-9" value="" placeholder="가격을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-3">판매상태</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-9" value="" placeholder="판매상태를 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-3">판매시작일</label>
								<input type="date" id="pc_name" name="pc_name" class="form-control col-sm-9" value="" placeholder="판매시작일을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-3">판매종료일</label>
								<input type="date" id="pc_name" name="pc_name" class="form-control col-sm-9" value="" placeholder="판매종료일을 입력하세요.">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

<script>
	window.onload = function(){
		/* SmartEditor_summernote($('#content')); */
		
		// 등록버튼 클릭
		$('#registBtn').on('click', function() {
			let form = $('form[role="form"]');
			
			if($('#pc_no').val() == "") {
				alert("제목을 입력하시게..");
				return;
			}
			
			if($('#pc_order').length > 1000){
				alert("글자수가 100자를 초과할 수 없습니다.");
				return;
			}
			
			form.submit();
		});
		
		// 취소버튼 클릭
		$('#cancelBtn').on('click', function() {
			window.opener.location.reload(true);
			window.close();
		});
	
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
		return win;
	};


	$(document).on('click', '.pr_no', function(){
		
		let openWin = OpenWindow("/erp5/findProduct2.do", "제품 찾기", 800, 600);
		
	});
	
	$(document).on('click', '.s_name', function(){
		
		let openWin = OpenWindow("/erp5/findShop.do", "쇼핑몰 찾기", 800, 600);
		
	});
}
</script>

<script src="<%= request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>