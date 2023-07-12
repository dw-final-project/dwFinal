<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 페이징 -->
<c:set var="cri" value="${pageMaker.cri }"/>
<<<<<<< Updated upstream

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

=======
>>>>>>> Stashed changes
<body>
	
	<div class="content-wrapper">
		<h1>공정 관리 페이지</h1>
		<section class="row">
			<div class="col-1"></div>
			<div class="card col-10" style="margin-top:3em;">
				<div class="card-header with-border">
					<button type="button" class="btn btn-success" id="" onclick="OpenWindow('registForm.do', '공정등록', 800, 700);">등록</button>
					<div class="card-tools">
						<div class="input-group">
							<select class="custom-select form-control col-md-4" name="searchType" id="searchType" style="apa">
								<option value="nnc" ${cri.searchType eq 'nnc' ? 'selected' : '' }>전 체</option>
								<option value="number" ${cri.searchType eq 'number' ? 'selected' : '' }>글번호</option>
								<option value="code" ${cri.searchType eq 'code' ? 'selected' : '' }>공정코드</option>
								<option value="title" ${cri.searchType eq 'title' ? 'selected' : '' }>공정명</option>
							</select>
							<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }">
							<span class="input-group-append">
								<button class="btn btn-primary" type="button" onclick="searchList_go(1);">
									<i>검색</i>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-borderd text-center">
						<tr style="font-size:0.95em;">
							<th>글번호</th>
							<th>생산공정코드</th>
							<th>생산공정명</th>
							<th>순번</th>
							<th>작업코드등록</th>
						</tr>
						<c:if test="${empty processList }">
							<tr>
								<td colspan="5">
									<strong>해당 게시글이 없습니다.</strong>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${processList }" var="process">		
							<tr style="font-size: 0.85em;">
								<td>${process.pc_no }</td>
								<td>
									<a href="javascript:OpenWindow('detail.do?pc_code=${process.pc_code}', '공정상세보기', 800, 700);">${process.pc_code}</a>
								</td>								
								<td>${process.pc_name}</td>
								<td>${process.pc_order}</td>
								<td><span class="badge bg-red" onclick="">등록</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 페이징 -->
				<div class="card-footer">
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
				</div>
			</div>
		</section>
	</div>
	
	<!-- 풀캘린더 API Start -->
	<div class="demos__main-container" id="demo-content">
		<div
			class="demo-calendar fc fc-media-screen fc-direction-ltr fc-theme-standard">
			<div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr">
				<div class="fc-toolbar-chunk">
					<div class="fc-button-group">
						<button type="button" title="Previous month" aria-pressed="false"
							class="fc-prev-button fc-button fc-button-primary">
							<span class="fc-icon fc-icon-chevron-left"></span>
						</button>
						<button type="button" title="Next month" aria-pressed="false"
							class="fc-next-button fc-button fc-button-primary">
							<span class="fc-icon fc-icon-chevron-right"></span>
						</button>
					</div>
					<button type="button" title="This month" disabled=""
						aria-pressed="false"
						class="fc-today-button fc-button fc-button-primary">today</button>
				</div>
				<div class="fc-toolbar-chunk">
					<h2 class="fc-toolbar-title" id="fc-dom-1">July 2023</h2>
				</div>
				<div class="fc-toolbar-chunk">
					<div class="fc-button-group">
						<button type="button" title="month view" aria-pressed="true"
							class="fc-dayGridMonth-button fc-button fc-button-primary fc-button-active">month</button>
						<button type="button" title="week view" aria-pressed="false"
							class="fc-timeGridWeek-button fc-button fc-button-primary">week</button>
						<button type="button" title="day view" aria-pressed="false"
							class="fc-timeGridDay-button fc-button fc-button-primary">day</button>
						<button type="button" title="list view" aria-pressed="false"
							class="fc-listWeek-button fc-button fc-button-primary">list</button>
					</div>
				</div>
			</div>
			<div aria-labelledby="fc-dom-1"
				class="fc-view-harness fc-view-harness-active"
				style="height: 617.037px;">
				<div class="fc-dayGridMonth-view fc-view fc-daygrid">
					<table role="grid" class="fc-scrollgrid  fc-scrollgrid-liquid">
						<thead role="rowgroup">
							<tr role="presentation"
								class="fc-scrollgrid-section fc-scrollgrid-section-header ">
								<th role="presentation"><div class="fc-scroller-harness">
										<div class="fc-scroller" style="overflow: hidden;">
											<table role="presentation" class="fc-col-header "
												style="width: 831px;">
												<colgroup></colgroup>
												<thead role="presentation">
													<tr role="row">
														<th role="columnheader"
															class="fc-col-header-cell fc-day fc-day-sun"><div
																class="fc-scrollgrid-sync-inner">
																<a aria-label="Sunday"
																	class="fc-col-header-cell-cushion">Sun</a>
															</div></th>
														<th role="columnheader"
															class="fc-col-header-cell fc-day fc-day-mon"><div
																class="fc-scrollgrid-sync-inner">
																<a aria-label="Monday"
																	class="fc-col-header-cell-cushion">Mon</a>
															</div></th>
														<th role="columnheader"
															class="fc-col-header-cell fc-day fc-day-tue"><div
																class="fc-scrollgrid-sync-inner">
																<a aria-label="Tuesday"
																	class="fc-col-header-cell-cushion">Tue</a>
															</div></th>
														<th role="columnheader"
															class="fc-col-header-cell fc-day fc-day-wed"><div
																class="fc-scrollgrid-sync-inner">
																<a aria-label="Wednesday"
																	class="fc-col-header-cell-cushion">Wed</a>
															</div></th>
														<th role="columnheader"
															class="fc-col-header-cell fc-day fc-day-thu"><div
																class="fc-scrollgrid-sync-inner">
																<a aria-label="Thursday"
																	class="fc-col-header-cell-cushion">Thu</a>
															</div></th>
														<th role="columnheader"
															class="fc-col-header-cell fc-day fc-day-fri"><div
																class="fc-scrollgrid-sync-inner">
																<a aria-label="Friday"
																	class="fc-col-header-cell-cushion">Fri</a>
															</div></th>
														<th role="columnheader"
															class="fc-col-header-cell fc-day fc-day-sat"><div
																class="fc-scrollgrid-sync-inner">
																<a aria-label="Saturday"
																	class="fc-col-header-cell-cushion">Sat</a>
															</div></th>
													</tr>
												</thead>
											</table>
										</div>
									</div></th>
							</tr>
						</thead>
						<tbody role="rowgroup">
							<tr role="presentation"
								class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
								<td role="presentation"><div
										class="fc-scroller-harness fc-scroller-harness-liquid">
										<div class="fc-scroller fc-scroller-liquid-absolute"
											style="overflow: hidden auto;">
											<div class="fc-daygrid-body fc-daygrid-body-balanced "
												style="width: 831px;">
												<table role="presentation" class="fc-scrollgrid-sync-table"
													style="width: 831px; height: 591px;">
													<colgroup></colgroup>
													<tbody role="presentation">
														<tr role="row">
															<td aria-labelledby="fc-dom-2" role="gridcell"
																data-date="2023-06-25"
																class="fc-day fc-day-sun fc-day-past fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to June 25, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-2"
																			class="fc-daygrid-day-number">25</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-4" role="gridcell"
																data-date="2023-06-26"
																class="fc-day fc-day-mon fc-day-past fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to June 26, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-4"
																			class="fc-daygrid-day-number">26</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-6" role="gridcell"
																data-date="2023-06-27"
																class="fc-day fc-day-tue fc-day-past fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to June 27, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-6"
																			class="fc-daygrid-day-number">27</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-8" role="gridcell"
																data-date="2023-06-28"
																class="fc-day fc-day-wed fc-day-past fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to June 28, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-8"
																			class="fc-daygrid-day-number">28</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-10" role="gridcell"
																data-date="2023-06-29"
																class="fc-day fc-day-thu fc-day-past fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to June 29, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-10"
																			class="fc-daygrid-day-number">29</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-12" role="gridcell"
																data-date="2023-06-30"
																class="fc-day fc-day-fri fc-day-past fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to June 30, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-12"
																			class="fc-daygrid-day-number">30</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-14" role="gridcell"
																data-date="2023-07-01"
																class="fc-day fc-day-sat fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 1, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-14"
																			class="fc-daygrid-day-number">1</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-event-harness"
																			style="margin-top: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past fc-daygrid-event fc-daygrid-block-event fc-h-event"><div
																					class="fc-event-main">
																					<div class="fc-event-main-frame">
																						<div class="fc-event-title-container">
																							<div class="fc-event-title fc-sticky">All
																								Day Event</div>
																						</div>
																					</div>
																				</div>
																				<div class="fc-event-resizer fc-event-resizer-end"></div></a>
																		</div>
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
														</tr>
														<tr role="row">
															<td aria-labelledby="fc-dom-16" role="gridcell"
																data-date="2023-07-02"
																class="fc-day fc-day-sun fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 2, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-16"
																			class="fc-daygrid-day-number">2</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-18" role="gridcell"
																data-date="2023-07-03"
																class="fc-day fc-day-mon fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 3, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-18"
																			class="fc-daygrid-day-number">3</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-20" role="gridcell"
																data-date="2023-07-04"
																class="fc-day fc-day-tue fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 4, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-20"
																			class="fc-daygrid-day-number">4</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-22" role="gridcell"
																data-date="2023-07-05"
																class="fc-day fc-day-wed fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 5, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-22"
																			class="fc-daygrid-day-number">5</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-24" role="gridcell"
																data-date="2023-07-06"
																class="fc-day fc-day-thu fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 6, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-24"
																			class="fc-daygrid-day-number">6</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-26" role="gridcell"
																data-date="2023-07-07"
																class="fc-day fc-day-fri fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 7, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-26"
																			class="fc-daygrid-day-number">7</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div
																			class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																			style="top: 0px; left: 0px; right: -119.281px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-start fc-event-past fc-daygrid-event fc-daygrid-block-event fc-h-event"><div
																					class="fc-event-main">
																					<div class="fc-event-main-frame">
																						<div class="fc-event-title-container">
																							<div class="fc-event-title fc-sticky">Long
																								Event</div>
																						</div>
																					</div>
																				</div></a>
																		</div>
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 20px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-28" role="gridcell"
																data-date="2023-07-08"
																class="fc-day fc-day-sat fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 8, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-28"
																			class="fc-daygrid-day-number">8</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 20px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
														</tr>
														<tr role="row">
															<td aria-labelledby="fc-dom-30" role="gridcell"
																data-date="2023-07-09"
																class="fc-day fc-day-sun fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 9, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-30"
																			class="fc-daygrid-day-number">9</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-event-harness"
																			style="margin-top: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-end fc-event-past fc-daygrid-event fc-daygrid-block-event fc-h-event"><div
																					class="fc-event-main">
																					<div class="fc-event-main-frame">
																						<div class="fc-event-title-container">
																							<div class="fc-event-title fc-sticky">Long
																								Event</div>
																						</div>
																					</div>
																				</div>
																				<div class="fc-event-resizer fc-event-resizer-end"></div></a>
																		</div>
																		<div class="fc-daygrid-event-harness"
																			style="margin-top: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past fc-daygrid-event fc-daygrid-dot-event"><div
																					class="fc-daygrid-event-dot"></div>
																				<div class="fc-event-time">4p</div>
																				<div class="fc-event-title">Repeating Event</div></a>
																		</div>
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-32" role="gridcell"
																data-date="2023-07-10"
																class="fc-day fc-day-mon fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 10, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-32"
																			class="fc-daygrid-day-number">10</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-34" role="gridcell"
																data-date="2023-07-11"
																class="fc-day fc-day-tue fc-day-past fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 11, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-34"
																			class="fc-daygrid-day-number">11</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div
																			class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																			style="top: 0px; left: 0px; right: -118.703px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-daygrid-event fc-daygrid-block-event fc-h-event"><div
																					class="fc-event-main">
																					<div class="fc-event-main-frame">
																						<div class="fc-event-title-container">
																							<div class="fc-event-title fc-sticky">Conference</div>
																						</div>
																					</div>
																				</div>
																				<div class="fc-event-resizer fc-event-resizer-end"></div></a>
																		</div>
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 20px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-36" role="gridcell"
																data-date="2023-07-12"
																class="fc-day fc-day-wed fc-day-today fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 12, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-36"
																			class="fc-daygrid-day-number">12</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-event-harness"
																			style="margin-top: 20px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today fc-daygrid-event fc-daygrid-dot-event"><div
																					class="fc-daygrid-event-dot"></div>
																				<div class="fc-event-time">10:30a</div>
																				<div class="fc-event-title">Meeting</div></a>
																		</div>
																		<div
																			class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																			style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today fc-daygrid-event fc-daygrid-dot-event"><div
																					class="fc-daygrid-event-dot"></div>
																				<div class="fc-event-time">12p</div>
																				<div class="fc-event-title">Lunch</div></a>
																		</div>
																		<div
																			class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																			style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today fc-daygrid-event fc-daygrid-dot-event"><div
																					class="fc-daygrid-event-dot"></div>
																				<div class="fc-event-time">2:30p</div>
																				<div class="fc-event-title">Meeting</div></a>
																		</div>
																		<div
																			class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																			style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today fc-daygrid-event fc-daygrid-dot-event"><div
																					class="fc-daygrid-event-dot"></div>
																				<div class="fc-event-time">5:30p</div>
																				<div class="fc-event-title">Happy Hour</div></a>
																		</div>
																		<div
																			class="fc-daygrid-event-harness fc-daygrid-event-harness-abs"
																			style="visibility: hidden; top: 0px; left: 0px; right: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-today fc-daygrid-event fc-daygrid-dot-event"><div
																					class="fc-daygrid-event-dot"></div>
																				<div class="fc-event-time">8p</div>
																				<div class="fc-event-title">Dinner</div></a>
																		</div>
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;">
																			<a tabindex="0" title="Show 4 more events"
																				aria-expanded="false" aria-controls=""
																				class="fc-daygrid-more-link fc-more-link">+4
																				more</a>
																		</div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-38" role="gridcell"
																data-date="2023-07-13"
																class="fc-day fc-day-thu fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 13, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-38"
																			class="fc-daygrid-day-number">13</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-event-harness"
																			style="margin-top: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-future fc-daygrid-event fc-daygrid-dot-event"><div
																					class="fc-daygrid-event-dot"></div>
																				<div class="fc-event-time">7a</div>
																				<div class="fc-event-title">Birthday Party</div></a>
																		</div>
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-40" role="gridcell"
																data-date="2023-07-14"
																class="fc-day fc-day-fri fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 14, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-40"
																			class="fc-daygrid-day-number">14</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-42" role="gridcell"
																data-date="2023-07-15"
																class="fc-day fc-day-sat fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 15, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-42"
																			class="fc-daygrid-day-number">15</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
														</tr>
														<tr role="row">
															<td aria-labelledby="fc-dom-44" role="gridcell"
																data-date="2023-07-16"
																class="fc-day fc-day-sun fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 16, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-44"
																			class="fc-daygrid-day-number">16</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-event-harness"
																			style="margin-top: 0px;">
																			<a
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-future fc-daygrid-event fc-daygrid-dot-event"><div
																					class="fc-daygrid-event-dot"></div>
																				<div class="fc-event-time">4p</div>
																				<div class="fc-event-title">Repeating Event</div></a>
																		</div>
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-46" role="gridcell"
																data-date="2023-07-17"
																class="fc-day fc-day-mon fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 17, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-46"
																			class="fc-daygrid-day-number">17</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-48" role="gridcell"
																data-date="2023-07-18"
																class="fc-day fc-day-tue fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 18, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-48"
																			class="fc-daygrid-day-number">18</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-50" role="gridcell"
																data-date="2023-07-19"
																class="fc-day fc-day-wed fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 19, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-50"
																			class="fc-daygrid-day-number">19</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-52" role="gridcell"
																data-date="2023-07-20"
																class="fc-day fc-day-thu fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 20, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-52"
																			class="fc-daygrid-day-number">20</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-54" role="gridcell"
																data-date="2023-07-21"
																class="fc-day fc-day-fri fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 21, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-54"
																			class="fc-daygrid-day-number">21</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-56" role="gridcell"
																data-date="2023-07-22"
																class="fc-day fc-day-sat fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 22, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-56"
																			class="fc-daygrid-day-number">22</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
														</tr>
														<tr role="row">
															<td aria-labelledby="fc-dom-58" role="gridcell"
																data-date="2023-07-23"
																class="fc-day fc-day-sun fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 23, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-58"
																			class="fc-daygrid-day-number">23</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-60" role="gridcell"
																data-date="2023-07-24"
																class="fc-day fc-day-mon fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 24, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-60"
																			class="fc-daygrid-day-number">24</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-62" role="gridcell"
																data-date="2023-07-25"
																class="fc-day fc-day-tue fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 25, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-62"
																			class="fc-daygrid-day-number">25</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-64" role="gridcell"
																data-date="2023-07-26"
																class="fc-day fc-day-wed fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 26, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-64"
																			class="fc-daygrid-day-number">26</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-66" role="gridcell"
																data-date="2023-07-27"
																class="fc-day fc-day-thu fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 27, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-66"
																			class="fc-daygrid-day-number">27</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-68" role="gridcell"
																data-date="2023-07-28"
																class="fc-day fc-day-fri fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 28, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-68"
																			class="fc-daygrid-day-number">28</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-event-harness"
																			style="margin-top: 0px;">
																			<a href="http://google.com/"
																				class="fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-future fc-daygrid-event fc-daygrid-block-event fc-h-event"><div
																					class="fc-event-main">
																					<div class="fc-event-main-frame">
																						<div class="fc-event-title-container">
																							<div class="fc-event-title fc-sticky">Click
																								for Google</div>
																						</div>
																					</div>
																				</div>
																				<div class="fc-event-resizer fc-event-resizer-end"></div></a>
																		</div>
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-70" role="gridcell"
																data-date="2023-07-29"
																class="fc-day fc-day-sat fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 29, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-70"
																			class="fc-daygrid-day-number">29</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
														</tr>
														<tr role="row">
															<td aria-labelledby="fc-dom-72" role="gridcell"
																data-date="2023-07-30"
																class="fc-day fc-day-sun fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 30, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-72"
																			class="fc-daygrid-day-number">30</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-74" role="gridcell"
																data-date="2023-07-31"
																class="fc-day fc-day-mon fc-day-future fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to July 31, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-74"
																			class="fc-daygrid-day-number">31</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-76" role="gridcell"
																data-date="2023-08-01"
																class="fc-day fc-day-tue fc-day-future fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to August 1, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-76"
																			class="fc-daygrid-day-number">1</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-78" role="gridcell"
																data-date="2023-08-02"
																class="fc-day fc-day-wed fc-day-future fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to August 2, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-78"
																			class="fc-daygrid-day-number">2</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-80" role="gridcell"
																data-date="2023-08-03"
																class="fc-day fc-day-thu fc-day-future fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to August 3, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-80"
																			class="fc-daygrid-day-number">3</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-82" role="gridcell"
																data-date="2023-08-04"
																class="fc-day fc-day-fri fc-day-future fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to August 4, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-82"
																			class="fc-daygrid-day-number">4</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
															<td aria-labelledby="fc-dom-84" role="gridcell"
																data-date="2023-08-05"
																class="fc-day fc-day-sat fc-day-future fc-day-other fc-daygrid-day"><div
																	class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																	<div class="fc-daygrid-day-top">
																		<a title="Go to August 5, 2023" data-navlink=""
																			tabindex="0" id="fc-dom-84"
																			class="fc-daygrid-day-number">5</a>
																	</div>
																	<div class="fc-daygrid-day-events">
																		<div class="fc-daygrid-day-bottom"
																			style="margin-top: 0px;"></div>
																	</div>
																	<div class="fc-daygrid-day-bg"></div>
																</div></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 풀캘린더 API End -->

</body>
</html>

<script>
	
	// 팝업창 띄우기
	// 새로운 Window 창을 Open 할 경우 사용되는 함수 (arg : 주소, 창 타이틀, 넓이, 길이)
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
	}
	
	// 팝업창 닫기
	function CloseWindow(){
		self.opener = self;
    // 	if (window.opener) window.opener.location.reload(true);
		window.close();
	}
	
	// 풀캘린더 API
	document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
    });
	
	$('#calendar').fullcalendar({
		header: { 
			left: 'prev, next today',
			center: 'title',
			right: 'month, agendWeek, agendaDay',
		},
		events: booking,
		selectable : true,
		selectHelper: true
	})
	
</script>

<!-- 풀캘린더 API -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<%@ include file="../include/footer_js.jsp" %>
