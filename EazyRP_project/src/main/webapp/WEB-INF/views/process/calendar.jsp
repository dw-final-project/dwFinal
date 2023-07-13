<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  
<%@page import="java.util.List"%>
<%@page import="kr.or.dw.vo.CalendarVO"%>

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
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
  <script>
  document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			locale : 'ko', // 한국어 설정
			headerToolbar : {
				  left: 'prev,next today',
			      center: 'title',
			      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	            },
            dateClick: function() {
                alert('클릭했삼!!');
            },
		selectable : true,
		droppable : true,
		editable : true,
		events : [ 
	    	    <%List<CalendarVO> calendarList = (List<CalendarVO>) request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
	            <%for (CalendarVO vo : calendarList) {%>
	            {
	            	title : '<%=vo.getCalendarTitle()%>',
	                start : '<%=vo.getCalendarStart()%>',
	                end : '<%=vo.getCalendarEnd()%>',
	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
	             },
					<%}
				}%>
				]
					
				});
				calendar.render();
			});
  </script>

<!-- 풀캘린더  -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
</body>
</html>
