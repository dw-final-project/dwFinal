<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@	page import="java.util.List"%>
<%@	page import="kr.or.dw.vo.CalendarVO"%>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

<!DOCTYPE html>
<html>
	<head>
		<!-- jquery CDN -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- fullcalendar CDN -->
		<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
		<!-- fullcalendar 언어 CDN -->
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
		  
		<style>
		  /* body 스타일 */
		  html, body {
		    overflow: hidden;
		    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		    font-size: 14px;
		  }
		  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
		  .fc-header-toolbar {
		    padding-top: 1em;
		    padding-left: 1em;
		    padding-right: 1em;
		  }
		</style>
	</head>

<body style="padding:30px;">
	<!-- calendar 태그 -->
	<div class="calendarBox" id='calendar-container'>
		<div id='calendar'></div>
	</div>
	
	<!-- modal -->
    <!-- <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                    <button type="button" class="btn btn-warning" id="addCalendar">
                    	추가
                    </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="calendarModalClose">
						취소
					</button>
                </div>
            </div>
        </div>
    </div> -->

<script>
  document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			locale : 'ko', // 한국어 설정
			initialDate: '2023-07-14', // 초기 로딩 날짜.
			
			// 헤더
			headerToolbar : {
				  left: 'prev,next today',
			      center: 'title',
			      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	            },
			// 날짜 클릭
            dateClick: function() {
                $("#calendarModal").modal("show");
            },
			selectable : true,
			droppable : true,
			editable : true,
			
			// 일정 표시
			events : [ 
	    	    <%List<CalendarVO> calendarList = (List<CalendarVO>) request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
		            <%for (CalendarVO vo : calendarList) {%>
			            {
		            	title : '<%=vo.getCalendar_title()%>',
		                start : '<%=vo.getCalendar_start()%>',
		                end : '<%=vo.getCalendar_end()%>',
		                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
			            },
					<%}
				}%>
			],
			
			// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용
			// 클릭 & 드래그로 일정 추가
			select: function(arg) { 
				
				var title = prompt('내용을 입력해주세요.');
			
				if (title) {
					console.log(title);
					console.log(arg.start);
					console.log(arg.end);
					console.log(arg.allDay);
					$.ajax({
						  url: "/erp4/add",
						  type: "POST",
						  data : { 
							 	calendar_title: title,	// 키값 : 벨류값
							  	calendar_start: arg.startStr,	// 키값 : 벨류값
							  	calendar_end: arg.endStr,	// 키값 : 벨류값
						  },
						  traditional: true,
						  async: false, //동기
						  success : function(data){
							  alert("일정이 등록되었습니다.")
						  },
						  error : function(request,status,error){
							alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
							console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
						  }
					});

					calendar.addEvent({
						title: title,
						start: arg.startStr,
						end: arg.endStr,
						allDay: arg.allDay
					})
				}
				calendar.unselect()
			},
			
		});
		calendar.render();
	});
</script>

<!-- 풀캘린더  -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
