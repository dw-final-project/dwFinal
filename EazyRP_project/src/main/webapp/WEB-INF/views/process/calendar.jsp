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
	
	<!-- 비어 있는 modal 추가 -->
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
                        <label for="taskId" class="col-form-label" id="">일정 내용</label>
                        <input type="text" class="form-control" id="title" value="" name="calendar_content">
                        <label for="taskId" class="col-form-label" id="">시작 시간</label>
                        <input type="time" class="form-control" id="startTime" name="calendar_start_date">
                        <label for="taskId" class="col-form-label" id="">종료 시간</label>
                        <input type="time" class="form-control" id="endTime" name="calendar_end_date">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeCalendar">취소</button>
                </div>
    
            </div>
        </div>
    </div>
    
	<!-- 값이 있는 modal 추가 -->
    <div class="modal fade" id="calendarDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
	                        <label for="taskId" class="col-form-label" id="">일정 내용</label>
	                        <input type="text" class="form-control" id="modifyTitle" value="" name="calendar_content">
	                        <label for="taskId" class="col-form-label" id="">시작 시간</label>
	                        <input type="time" class="form-control" id="modifyStartTime" value="" name="calendar_start_date">
	                        <label for="taskId" class="col-form-label" id="">종료 시간</label>
	                        <input type="time" class="form-control" id="modifyEndTime" value="" name="calendar_end_date">
	                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="modifyCalendar">수정</button>
                    <button type="button" class="btn btn-danger" id="removeCalendar">삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeModifyCalendar">취소</button>
                </div>
            </div>
        </div>
    </div>

<script>

	

  document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			locale : 'ko', // 한국어 설정
// 			initialDate: '', // 초기 로딩 날짜.
			
			// 헤더
			headerToolbar : {
				  left: 'prev,next today',
			      center: 'title',
			      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	            },
	            
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
			
			eventClick:function(info) {
				alert(info.event.title);
				let calendar_start = info.event.start.toISOString().slice(11, 16);
			  	let calendar_end = info.event.end.toISOString().slice(11, 16);
			  	$('#modifyEndTime')
				alert(calendar_start);
				$('#modifyTitle').attr('value', info.event.title);
				$('#modifyStartTime').attr('value', calendar_start);
				$('#modifyEndTime').attr('value', calendar_end);
	            $("#calendarDetailModal").modal("show");
	            return false;
            },
			
			// 날짜 클릭
            dateClick: function() {
            
            },
			selectable : true,
			droppable : true,
			editable : true,
			
			// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용
			// 클릭 & 드래그로 일정 추가
			select: function(arg) { 
				
                $("#calendarModal").modal("show");
                
                $("#addCalendar").on("click", function () {
					var title = $('#title').val();
					var startTime = $('#startTime').val();
					var endTime = $('#endTime').val();
					
						var endDate = new Date(arg.endStr);
						var startDate = new Date(arg.startStr);
				        endDate.setDate(endDate.getDate() - 1); // 일자를 1일 뒤로 당김
				        console.log(startTime);
				      //내용 입력 여부 확인
                        if(title == null || title == ""){
                            alert("내용을 입력하세요.");
                        }else if(startTime == "" || endTime ==""){
                            alert("시간을 입력하세요.");
                        }else if(String(endDate) == String(startDate) && parseInt(endTime) - parseInt(startTime) < 0){ // date 타입으로 변경 후 확인
                        	alert("종료 시간이 시작 시간보다 빠릅니다.\n시간을 올바르게 설정해주세요.");
                        }else{ // 정상적인 입력 시
						
                        	$.ajax({
								  url: "/erp4/add",
								  type: "POST",
								  data : { 
									 	calendar_title: title,	// 키값 : 벨류값
									  	calendar_start: arg.startStr + startTime ,	// 키값 : 벨류값
									  	calendar_end: endDate.toISOString().slice(0, 10) + " " + endTime,	// 키값 : 벨류값
								  },
								  traditional: true,
								  async: false, //동기
								  success : function(data){
									  alert("일정이 등록되었습니다.");
									  $("#calendarModal").modal("hide");
									  location.reload();
								  },
								  error : function(request,status,error){
									alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
									console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
								  }
							});
		
							calendar.addEvent({
								title: title,
								start: startTime,
								end: endTime,
								allDay: arg.allDay
							})
							
                        };
				}),
				
				$("#closeCalendar").on("click", function() {
					 $("#calendarModal").modal("hide");
				})
				,
				
				calendar.unselect();
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
