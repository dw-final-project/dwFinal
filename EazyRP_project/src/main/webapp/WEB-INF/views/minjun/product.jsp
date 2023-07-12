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
		<div class="row-2">
			<div class="col-8">
				<div class="card-body">
					<div id='calendar'></div>
				</div>
			</div>
			
			 <!-- modal 추가 -->
	    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                    <div class="form-group">
	                        <label for="taskId" class="col-form-label">일정 내용</label>
	                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
	                        <label for="taskId" class="col-form-label">시작 날짜</label>
	                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
	                        <label for="taskId" class="col-form-label">종료 날짜</label>
	                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
	                        id="sprintSettingModalClose">취소</button>
	                </div>
	    
	            </div>
	        </div>
	    </div>
	[출처] [2021.05.26] FullCalendar - 일정 캘린더 구현|작성자 psy승짱

			
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
	
	 document.addEventListener('DOMContentLoaded', function () {
         var calendarEl = document.getElementById('calendar');
         var calendar = new FullCalendar.Calendar(calendarEl, {
             timeZone: 'UTC',
             initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
             events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                 {
                     title:'일정',
                     start:'2021-05-26 00:00:00',
                     end:'2021-05-27 24:00:00' 
                     // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
                 }
             ], headerToolbar: {
                 center: 'addEventButton' // headerToolbar에 버튼을 추가
             }, customButtons: {
                 addEventButton: { // 추가한 버튼 설정
                     text : "일정 추가",  // 버튼 내용
                     click : function(){ // 버튼 클릭 시 이벤트 추가
                         $("#calendarModal").modal("show"); // modal 나타내기

                         $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                             var content = $("#calendar_content").val();
                             var start_date = $("#calendar_start_date").val();
                             var end_date = $("#calendar_end_date").val();
                             
                             //내용 입력 여부 확인
                             if(content == null || content == ""){
                                 alert("내용을 입력하세요.");
                             }else if(start_date == "" || end_date ==""){
                                 alert("날짜를 입력하세요.");
                             }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                 alert("종료일이 시작일보다 먼저입니다.");
                             }else{ // 정상적인 입력 시
                                 var obj = {
                                     "title" : content,
                                     "start" : start_date,
                                     "end" : end_date
                                 }//전송할 객체 생성

                                 console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                             }
                         });
                     }
                 }
             },
             editable: true, // false로 변경 시 draggable 작동 x 
             displayEventTime: false // 시간 표시 x
         });
         calendar.render();
     });
</script>
 <style>
        #calendarBox{
            width: 70%;
            padding-left: 15%;
        }

</style>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<%@ include file="../include/footer_js.jsp" %>
