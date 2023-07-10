<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<%@ include file="../include/sidebar.jsp" %>
<div style="height: 100px"></div>
<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width: 1000px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">쪽지함</h3>
					</div>
					<div class="card-body pad">
						<div>
							<table>
								<tr>
									<th width="10px" style="text-align: center;"></th>
									<th width="200px" style="text-align: center;">제목</th>
									<th width="200px" style="text-align: center;">보낸 사람</th>
									<th width="200px" style="text-align: center;">업체명</th>
									<th width="200px" style="text-align: center;">첨부파일 여부</th>
									<th width="200px" style="text-align: center;">보낸 시간</th>
								</tr>
								<c:forEach items="${note}" var="note">
									<tr>
										<td style="text-align: center; height:80%; background-color: ${note.readable == "N" ? "red" : "blue" };">
										
										</td>
										<td style="text-align: center;"><a onclick="OpenWindow('/mymenu/detail.do?n_no=${note.n_no }', '쪽지보기', 800, 600)">${note.title }</a></td>
										<td style="text-align: center;">${note.callerName }</td>
										<td style="text-align: center;">${note.c_cname }</td>
										<td style="text-align: center;">${note.files == "" || note.files == null ? "N" : "Y" }</td>
										<td style="text-align: center;">${note.senddate }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
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