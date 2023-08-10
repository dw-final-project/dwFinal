<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.sideMenuList{
		box-shadow: 0px 15px 10px gray;
	}
</style>

<c:set var="mcode">${mcode }</c:set>
<c:set var="subMenuList2">${subMenuList[mcode] }</c:set>
<nav id="navSideBar"class="d-flex flex-column p-3 sideMenuList" style=" float:left ; width: 15%; height: 100%; display: inline; background: linear-gradient(to bottom, #7bc4b2, #00ff72);">
	<c:forEach items="${subMenuList[mcode]}" var="subMenu">
		<div class="mousePoint">
		<a class="p-2 a nav-link bold fw-bold " href="javascript:goPage('${subMenu.murl }', '${subMenu.mcode }', '${subMenu.micon }');" data-url="${subMenu.mcode }" aria-expanded="true" style="color: white; text-decoration-line: none;">${subMenu.mname }</a>
		<c:set var="mcode2">${subMenu.mcode }</c:set>
			<ul style="list-style-type: none;">
			<c:forEach items="${smallMenuList[mcode2] }" var="smallMenu">
				<li>	
					<a class="p-2 a nav-link " href="javascript:goPage('${smallMenu.murl }', '${smallMenu.mcode }', '${smallMenu.micon }');" data-url="${smallMenu.mcode }" aria-expanded="true" style="color: white; text-decoration-line: none;">&nbsp;&nbsp;&nbsp;&nbsp;${smallMenu.mname }</a>
				</li>
			</c:forEach>
			</ul>
		</div>
	</c:forEach>
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

