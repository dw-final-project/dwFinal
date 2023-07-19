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
		<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

		<!-- jquery CDN -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- moment CDN -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
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
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label" id="">일정 내용</label>
                        <input type="text" class="form-control" id="title" value="" name="calendar_title">
                        <label for="taskId" class="col-form-label" id="">시작 시간</label>
                        <input type="time" class="form-control" id="startTime" value="" name="calendar_start">
                        <label for="taskId" class="col-form-label" id="">종료 시간</label>
                        <input type="time" class="form-control" id="endTime" value="" name="calendar_end">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">등록</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeCalendar">닫기</button>
                </div>
    
            </div>
        </div>
    </div>
    
	<!-- modal 디테일 및 수정, 삭제 -->
    <div class="modal fade" id="calendarDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                </div>
                <div class="modal-body">
	                    <div class="form-group">
	                        <label for="taskId" class="col-form-label" id="">일정 내용</label>
	                        <input type="text" class="form-control" id="modifyTitle" value="" name="calendar_title">
	                        <label for="taskId" class="col-form-label" id="">시작 시간</label>
	                        <input type="time" class="form-control" id="modifyStartTime" value="" name="calendar_start">
	                        <label for="taskId" class="col-form-label" id="">종료 시간</label>
	                        <input type="time" class="form-control" id="modifyEndTime" value="" name="calendar_end">
	                        <input type="hidden" name="calendar_no" id="calendar_no">
	                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="modifyCalendarBtn">수정</button>
                    <button type="button" class="btn btn-danger" id="removeCalendarBtn">삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeModifyCalendar">닫기</button>
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
// 			height: '700px', // calendar 높이 설정
	        expandRows: true, // 화면에 맞게 높이 재설정
	        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
	        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
	        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			
			// 헤더
			headerToolbar : {
				  left: 'prev,next today',
			      center: 'title',
			      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	            },
	            
			// 일정 표시
			events: [
				<c:forEach var="vo" items="${calendarList}">
					{
					  title: '${vo.getCalendar_title()}',
					  start: '${vo.getCalendar_start()}',
					  end: '${vo.getCalendar_end()}',
					  cal_no: '${vo.getCalendar_no()}',
					  color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
					},
				</c:forEach>
			],
			
			// 일정 드롭다운 이벤트
			eventDrop: function (info) {
				
				console.log("123");
				
				// 시작 시간 변환
				var startTimeInput = document.getElementById('modifyStartTime');
				var startTimeValue = info.event.start;
				var startTimeFormatted = formatTime(startTimeValue);
				startTimeInput.value = startTimeFormatted;

				// 종료 시간 변환
				var endTimeInput = document.getElementById('modifyEndTime');
				var endTimeValue = info.event.end;
				var endTimeFormatted = formatTime(endTimeValue);
				endTimeInput.value = endTimeFormatted;

				// 시간 포맷 변환 함수
				function formatTime(time) {
// 				  var date = new Date(time);
				  var hours = time.getHours().toString().padStart(2, '0');
				  var minutes = time.getMinutes().toString().padStart(2, '0');
				  var formattedTime = hours + ':' + minutes;
				  return formattedTime;
				}
				
				// 한국 표준시간으로 변환하는 함수
				function convertKST(date){
					// 1. 현재 시간(Locale)
					const curr = new Date();
					console.log("현재시간(Locale) : " + curr + '<br>');

					// 2. UTC 시간 계산
// 					const utc = curr.getTime() + (curr.getTimezoneOffset() * 60 * 1000);
					const utc = date.getTime();

					// 3. UTC to KST (UTC + 9시간)
					const KR_TIME_DIFF = 9 * 60 * 60 * 1000;
					const kr_curr = new Date(utc - (KR_TIME_DIFF));

					console.log("한국시간 : " + kr_curr);
					return kr_curr;
				}
				
				function convertYMD(date){
					let year = date.getFullYear();
					let month = ('0' + (date.getMonth() + 1)).slice(-2);
					let day = ('0' + date.getDate()).slice(-2);
					let dateStr = year + '-' + month  + '-' + day;
					return dateStr;
				}
				
// 				// 날짜  형변환
// 				let calendar_start = new Date(info.event.start.getTime() );
// 				let calendar_end = new Date(info.event.end.getTime() );
				
// 				let calendar_start_hour = ("0" + calendar_start.getHours()).slice(-2);
// 				let calendar_start_minute = ("0" + calendar_start.getMinutes()).slice(-2);
// 				let calendar_end_hour = ("0" + calendar_end.getHours()).slice(-2);
// 				let calendar_end_minute = ("0" + calendar_end.getMinutes()).slice(-2);
// 				console.log(info)
// 				calendar_start = calendar_start_hour + ":" + calendar_start_minute;
// 				calendar_end = calendar_end_hour + ":" + calendar_end_minute;
// 				console.log(new Date().setTime(info.event._instance.range.start));
// 				let modStartTime = info.event._instance.range.start;
// 				let modEndTime = info.event._instance.range.end;
// 				console.log('modStartTime : ' + modStartTime);
// 				console.log('modEndTime : ' + modEndTime);
// 				console.log('modStartHour : ' + modStartTime.getHours() + ':' + modStartTime.getMinutes());
// 				console.log('modEndHour : ' + modEndTime.getHours() + ':' + modEndTime.getMinutes());
// 				modStartTime = convertKST(modStartTime);
// 				let startYMD = convertYMD(modStartTime);
// 				modEndTime = convertKST(modEndTime);
// 				let endYMD = convertYMD(modEndTime);
// 				console.log(startYMD + " " + formatTime(modStartTime));
// 				console.log(endYMD + " " + formatTime(modEndTime));
	            // 이전에 등록한 일정의 정보를 이벤트를 클릭했을때 나타나는 해당 모달로 불러온다
				$('#modifyTitle').attr('value', info.event.title);
				$('#modifyStartTime').attr('value', info.event.start);
				$('#modifyEndTime').attr('value', info.event.end);
	            console.log(info.event.title);
	            console.log(info.event.start);
	            console.log(info.event.end);
				
				var title = $('#modifyTitle').val();
				var startTime = $('#modifyStartTime').val();
				var endTime = $('#modifyEndTime').val();

				var endDate = new Date(info.endStr);
				var startDate = new Date(info.startStr);
		        endDate.setDate(endDate.getDate() - 1); // 일자를 1일 뒤로 당김
		        
        		let stdFormat = info.event._instance.range.start.toISOString().slice(0, 10) + " " + startTime;
                let endFormat = info.event._instance.range.end.toISOString().slice(0, 10) + " " + endTime;
				console.log(stdFormat);
				console.log(endFormat);

                   	$.ajax({
						  url: "/erp4/calendar/modify",
						  type: "POST",
						  data : { 
							 	calendar_title: title,	// 키값 : 벨류값
							  	calendar_start: stdFormat,	// 키값 : 벨류값
							  	calendar_end: endFormat,	// 키값 : 벨류값
							  	calendar_no: info.event._def.extendedProps.cal_no
						  },
//							  traditional: true,
//							  async: false, //동기
						  success : function(data){
							  alert("일정이 수정 되었습니다.");
							  alert(data);
							  $("#calendarModal").modal("hide");
							  location.reload();
						  },
						  error : function(request,status,error){
							alert("에러 났음."); // 실패 시 처리
						  }
					});
	
			},
				
			eventClick:function(info) {
				
				// 시작 시간 변환
				var startTimeInput = document.getElementById('modifyStartTime');
				var startTimeValue = info.event.start;
				var startTimeFormatted = formatTime(startTimeValue);
				startTimeInput.value = startTimeFormatted;

				// 종료 시간 변환
				var endTimeInput = document.getElementById('modifyEndTime');
				var endTimeValue = info.event.end;
				var endTimeFormatted = formatTime(endTimeValue);
				endTimeInput.value = endTimeFormatted;

				// 시간 포맷 변환 함수
				function formatTime(time) {
// 				  var date = new Date(time);
				  var hours = time.getHours().toString().padStart(2, '0');
				  var minutes = time.getMinutes().toString().padStart(2, '0');
				  var formattedTime = hours + ':' + minutes;
				  return formattedTime;
				}
				
				// 한국 표준시간으로 변환하는 함수
				function convertKST(date){
					// 1. 현재 시간(Locale)
					const curr = new Date();
					console.log("현재시간(Locale) : " + curr + '<br>');

					// 2. UTC 시간 계산
// 					const utc = curr.getTime() + (curr.getTimezoneOffset() * 60 * 1000);
					const utc = date.getTime();

					// 3. UTC to KST (UTC + 9시간)
					const KR_TIME_DIFF = 9 * 60 * 60 * 1000;
					const kr_curr = new Date(utc - (KR_TIME_DIFF));

					console.log("한국시간 : " + kr_curr);
					return kr_curr;
				}
				
				function convertYMD(date){
					let year = date.getFullYear();
					let month = ('0' + (date.getMonth() + 1)).slice(-2);
					let day = ('0' + date.getDate()).slice(-2);
					let dateStr = year + '-' + month  + '-' + day;
					return dateStr;
				}
				
// 				// 날짜  형변환
// 				let calendar_start = new Date(info.event.start.getTime() );
// 				let calendar_end = new Date(info.event.end.getTime() );
				
// 				let calendar_start_hour = ("0" + calendar_start.getHours()).slice(-2);
// 				let calendar_start_minute = ("0" + calendar_start.getMinutes()).slice(-2);
// 				let calendar_end_hour = ("0" + calendar_end.getHours()).slice(-2);
// 				let calendar_end_minute = ("0" + calendar_end.getMinutes()).slice(-2);
// 				console.log(info)
// 				calendar_start = calendar_start_hour + ":" + calendar_start_minute;
// 				calendar_end = calendar_end_hour + ":" + calendar_end_minute;
// 				console.log(new Date().setTime(info.event._instance.range.start));
// 				let modStartTime = info.event._instance.range.start;
// 				let modEndTime = info.event._instance.range.end;
// 				console.log('modStartTime : ' + modStartTime);
// 				console.log('modEndTime : ' + modEndTime);
// 				console.log('modStartHour : ' + modStartTime.getHours() + ':' + modStartTime.getMinutes());
// 				console.log('modEndHour : ' + modEndTime.getHours() + ':' + modEndTime.getMinutes());
// 				modStartTime = convertKST(modStartTime);
// 				let startYMD = convertYMD(modStartTime);
// 				modEndTime = convertKST(modEndTime);
// 				let endYMD = convertYMD(modEndTime);
// 				console.log(startYMD + " " + formatTime(modStartTime));
// 				console.log(endYMD + " " + formatTime(modEndTime));
	            // 이전에 등록한 일정의 정보를 이벤트를 클릭했을때 나타나는 해당 모달로 불러온다
				$('#modifyTitle').attr('value', info.event.title);
				$('#modifyStartTime').attr('value', info.event.start);
				$('#modifyEndTime').attr('value', info.event.end);
	            console.log(info.event.title);
	            console.log(info.event.start);
	            console.log(info.event.end);
// 				$('#calendar_no').attr('value', info.event._def.extendedProps.cal_no);
	            $("#calendarDetailModal").modal("show");
	            
	            // 디테일 캘린더 닫기 버튼
	        	$("#closeModifyCalendar").on("click", function() {
					$("#calendarDetailModal").modal("hide");
				});
	        	
	            // 캘린더 삭제 버튼
	        	$("#removeCalendarBtn").on("click", function() {
	        		
	        		$.ajax({
						  url: "/erp4/calendar/remove",
						  type: "POST",
						  data : { 
							  	calendar_no: info.event._def.extendedProps.cal_no
						  },
// 						  traditional: true,
// 						  async: false, //동기
						  success : function(res){
							  alert("일정이 삭제 되었습니다.");
							  $("#calendarDetailModal").modal("hide");
							  location.reload();
						  },
						  error : function(request,status,error){
							  console.log("에러 발생:");
							    console.log(request);
							    console.log(status);
							    console.log(error);
							  alert("에러 났음."); // 실패 시 처리
						  } 
					});
// 	        		alert("일정이 삭제 되었습니다.");
// 					  $("#calendarDetailModal").modal("hide");
// 					  location.reload();
				});
	        	
	        		
	            // 캘린더 수정 완료 버튼
	        	$("#modifyCalendarBtn").on("click", function() {
	        		
	        		var title = $('#modifyTitle').val();
					var startTime = $('#modifyStartTime').val();
					var endTime = $('#modifyEndTime').val();

					var endDate = new Date(info.endStr);
					var startDate = new Date(info.startStr);
			        endDate.setDate(endDate.getDate() - 1); // 일자를 1일 뒤로 당김
			        
	        		let stdFormat = info.event._instance.range.start.toISOString().slice(0, 10) + " " + startTime;
	                let endFormat = info.event._instance.range.end.toISOString().slice(0, 10) + " " + endTime;
					console.log(stdFormat);
					console.log(endFormat);
					//내용 입력 여부 확인
					if(title == null || title == ""){
					    alert("내용을 입력하세요.");
					}else if(startTime == "" || endTime ==""){
					    alert("시간을 입력하세요.");
					}else if(String(endDate) == String(startDate) && parseInt(endTime) - parseInt(startTime) < 0){ // date 타입으로 변경 후 확인
						alert("종료 시간이 시작 시간보다 빠릅니다.\n시간을 올바르게 설정해주세요.");
					}else{ // 정상적인 입력 시

                       	$.ajax({
							  url: "/erp4/calendar/modify",
							  type: "POST",
							  data : { 
								 	calendar_title: title,	// 키값 : 벨류값
								  	calendar_start: stdFormat,	// 키값 : 벨류값
								  	calendar_end: endFormat,	// 키값 : 벨류값
								  	calendar_no: info.event._def.extendedProps.cal_no
							  },
// 							  traditional: true,
// 							  async: false, //동기
							  success : function(data){
								  alert("일정이 수정 되었습니다.");
								  alert(data);
								  $("#calendarModal").modal("hide");
								  location.reload();
							  },
							  error : function(request,status,error){
								alert("에러 났음."); // 실패 시 처리
							  }
						});
		
// 						calendar.addEvent({
// 							title: title,
// 							start: startTime,
// 							end: endTime,
// 							calendar_no: calendar_no
// 						})
					};
				});
// 	            return false;
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
					var calendar_no = $('#calendar_no').val();
					
					var endDate = new Date(arg.endStr);
					var startDate = new Date(arg.startStr);
			        endDate.setDate(endDate.getDate() - 1); // 일자를 1일 뒤로 당김
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
					 $("#endTime").val('');
					 $("#startTime").val('');
					 $("#title").val('');
					 $("#calendarModal").modal("hide");
				}),
				
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
