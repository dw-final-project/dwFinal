<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<%@ include file="../include/sidebar.jsp" %>
<div style="height: 100px"></div>
<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width: 1100px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">쪽지함</h3>
						<div class="input-group row">
							<select class="form-control col-md-4" name="searchType" id="searchType">
								<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected' : '' }>전 체</option>
								<option value="t" ${cri.searchType eq 't' ? 'selected' : '' }>제 목</option>
								<option value="w" ${cri.searchType eq 'w' ? 'selected' : '' }>보낸사람</option>
								<option value="c" ${cri.searchType eq 'c' ? 'selected' : '' }>업체</option>
							</select>
							<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요.">
							<span class="input-group-append">
								<button class="btn btn-primary" type="button" onclick="searchList_go();">
									<i class="fa fa-fw fa-search">검색</i>
								</button>
							</span>
						</div>
					</div>
					<div class="card-body pad">
						<div>
							<table style="font-size: 0.8em;">
								<tr>
									<th width="30px" style="text-align: center;"></th>
									<th width="220px" style="text-align: center;">제목</th>
									<th width="220px" style="text-align: center;">보낸 사람</th>
									<th width="220px" style="text-align: center;">업체명</th>
									<th width="220px" style="text-align: center;">첨부파일 여부</th>
									<th width="220px" style="text-align: center;">보낸 시간</th>
								</tr>
								<c:forEach items="${note}" var="note" varStatus="loop">
									<tr style="height: 10px;"></tr>
									<tr>
										<td id="read_${loop.index}" style="text-align: center; height:80%; background-color: "${note.readable == "N" ? "red" : "blue" };">
										</td>
										<td style="text-align: center;"><a id="aTag" href="#" onclick="OpenWindow('/mymenu/detail.do?n_no=${note.n_no }', '쪽지보기', 800, 600, '${loop.index}')">${note.title }</a></td>
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
					<div style="display: flex; align-items: end; justify-content: end;">
					<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow2('/mymenu/communication.do', '쪽지쓰기', 700, 1000)"
					style="width: 100px; margin: 20px; align-self: center;">쪽지 쓰기</button>
				</div>
			</div>
			
		</div>
	</section>
	
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	
<script>
		
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight, index){
		var selectedElement = document.getElementById("read_"+index);
		  if (selectedElement) {
		    selectedElement.style.backgroundColor = "blue";
		  }
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
	};
	
	function OpenWindow2(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
	};

	
</script>