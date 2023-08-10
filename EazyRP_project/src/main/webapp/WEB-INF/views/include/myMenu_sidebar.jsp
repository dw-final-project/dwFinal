<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.sideMenuList{
		box-shadow: 0px 15px 10px gray;
	}
</style>

<nav id="navSideBar"class="d-flex flex-column p-3 sideMenuList" style=" float:left ; width: 15%; height: 100%; display: inline; background: linear-gradient(to bottom, #7bc4b2, #00ff72);">
		<div class="mousePoint">
		<a class="p-2 a nav-link bold fw-bold " href="javascript:goPage('/mymenu/noteList.do', 'M040100', '커뮤니케이션');" data-url="M040100" aria-expanded="true" style="color: white; text-decoration-line: none;">커뮤니케이션</a>
			<ul style="list-style-type: none;">
				<li>	
					<a class="p-2 a nav-link " href="javascript:goPage('/mymenu/noteList.do', 'M040101', '쪽지함');" data-url="M040101" aria-expanded="true" style="color: white; text-decoration-line: none;">&nbsp;&nbsp;&nbsp;&nbsp;쪽지함</a>
				</li>
				<li>	
					<a class="p-2 a nav-link " href="javascript:goPage('/mymenu/sendNoteList.do', 'M040102', '보낸쪽지');" data-url="M040102" aria-expanded="true" style="color: white; text-decoration-line: none;">&nbsp;&nbsp;&nbsp;&nbsp;보낸쪽지</a>
				</li>
			</ul>
		<a class="p-2 a nav-link bold fw-bold " href="javascript:goPage('/mymenu/noteList.do', 'M040100', '커뮤니케이션');" data-url="M040100" aria-expanded="true" style="color: white; text-decoration-line: none;">테스트</a>	
		</div>
</nav>

<div id="menutitle"></div>

<c:forEach var="myMenu" items="${myMenuList}">
	<c:if test="${myMenu.murl eq murl}">
		<c:set var="chk">checked</c:set>
	</c:if>
</c:forEach> 
<c:if test="${not empty loginUser}">
	<button id="myMenuBtn">즐겨찾기 임시 버튼</button><input id="myMenuChk" type="checkbox" name="myMenuChk" value="o" onClick="return false;" ${chk }>
</c:if>
	
<script>
	$(function () {
		let micon = sessionStorage.getItem("micon");
		$('#menutitle').html(micon);
		
	})
	
	
	$('.mousePoint ul').hide();

	$('.mousePoint').on('mouseenter', function() {
		  $(this).find('ul').stop().slideDown(); // 아래로 내려오는 애니메이션 적용
		});

		$('.mousePoint').on('mouseleave', function() {
		  $(this).find('ul').stop().slideUp(); // 위로 올라가는 애니메이션 적용
		});

		$('.mousePoint ul').on('mouseenter', function() {
		  $(this).stop().slideDown(); // 아래로 내려오는 애니메이션 적용
		});

		$('.mousePoint ul').on('mouseleave', function() {
		  $(this).stop().slideUp(); // 위로 올라가는 애니메이션 적용
		});

	$('#myMenuBtn').on('click', function () {
		let murl = sessionStorage.getItem("murl");
		
		let data = {
				"murl" : murl,
				"u_no" : "${loginUser.u_no }"
		};
		

		
		if($('#myMenuChk').is(':checked')){
			$.ajax({
				url : "<%=request.getContextPath()%>/common/myMenuDelete",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(data){
					alert("나만의 메뉴에서 삭제 되었습니다.");
					$('#myMenuChk').prop('checked',false);
				},
				error : function(error){
					alert("실패 ㅠㅠ");
				}
			});		
		}else{
			$.ajax({
				url : "<%=request.getContextPath()%>/common/myMenuRegist",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(data){
					alert("나만의 메뉴에 등록 되었습니다.");
					$('#myMenuChk').prop('checked',true);
				},
				error : function(error){
					alert("실패ㅠㅠ");
				}
			});
		}
		
	})


</script>

