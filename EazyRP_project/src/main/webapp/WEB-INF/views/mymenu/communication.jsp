<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<%@ include file="../include/sidebar.jsp" %>
<div style="height: 100px"></div>
<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width: 600px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">쪽지쓰기</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn">보내기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn">취 소</button>
						</div>
					</div>
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group">
								<label for="title">제 목</label>
								<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력하세요.">
							</div>
							<div class="form-group">
								<label for="writer">받는사람</label>
								<input type="text" id="receiver" name="receiver" class="form-control" readonly onclick="OpenWindow('/mymenu/findPeople.do', '사람찾기', 800, 600)">
								<input type="hidden" id="r_dept" name="r_dept">
								<input type="hidden" id="r_company" name="r_company">
								<input type="hidden" id="caller" name="caller">
								<input type="hidden" id="c_dept" name="c_dept">
								<input type="hidden" id="c_company" name="c_company">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="textarea" name="con" id="con" rows="10" 
									placeholder="내용을 작성하세요." style="display: block; width:100%;"></textarea>
							</div>
							<div class="form-group">
								<label for="file">첨부파일</label>
								<input type="file" name="file">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
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