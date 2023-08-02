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
						<form id="searchForm2" method="post"
							action="/member/qna.do?mcode=${mcode }"
							style="display: contents;"></form>
					</div>
				</div>

				<div class="card-body pad">
					<div>
						<table class="table accordion text-center">
							<thead>
								<tr>
									<th scope="col" width="300px" style="text-align: center;">내
										용</th>
									<th scope="col" width="100px" style="text-align: center;">날
										짜</th>
									<th scope="col" width="100px" style="text-align: center;">답변여부</th>
								</tr>
							</thead>
							<c:forEach items="${qnaList}" var="qna">
								<tbody>
									<tr class="r2">
										<td style="text-align: center;">${qna.INQ_CON }</td>
										<td style="text-align: center;">${qna.REGDATE }</td>
										<td style="text-align: center;">${empty qna.ANS_CON ? 'N' : 'Y' }</td>
									</tr>

									<c:if test="${not empty qna.ANS_CON }">
										<tr class="r1">
											<td colspan="3">${qna.ANS_CON }</td>
										</tr>
									</c:if>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				 <div class="text">
                    <div class="container">
				<div class="re_form" style="display: none;">
                        <form method="post" name ="form" action="/member/qnaRegist">
	                        <input class="form-control" style="margin-bottom:10px;" name="inq_con" placeholder="내용입력">
	                        <input type="hidden" name="mcode" value="${mcode }">
                        </form>
                     <div style="float: right;">
	                    <button class="btn btn-primary" id="submit">등록</button>
                        <button  class="btn btn-primary" id="cancel">취소</button>
                    </div>
                  </div>
                  </div>
                  </div>
				<div class="card-footer">
					<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
				</div>
			</div>
			<div style="display: flex; align-items: end; justify-content: end;">
				<button type="button" class="btn btn-primary" id="registBtn" style="width: 100px; font-size: 0.8em; margin: 20px; align-self: center;">문의하기</button>
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

$('.r1').hide();

	$('tr').on('click', function(){
		if($(this).attr('class') == 'r2'){
			$(this).next().stop().slideDown();		
			$(this).attr('class', 'r3');
		} else if($(this).attr('class') == 'r3'){
			$(this).next().stop().slideUp();		
			$(this).attr('class', 'r2');
		}
	})

	$('#registBtn').on('click',function(){
  		$('.re_form').toggle();
    	$('#registBtn').toggle();
    })

	 $('#cancel').on('click', function(){
    	$('.re_form').toggle();
        $('#registBtn').toggle();
    })

	$('#submit').on('click', function(){
    	$('form[name="form"]').submit();
    })

</script>
<%@ include file="../include/footer_js.jsp"%>
