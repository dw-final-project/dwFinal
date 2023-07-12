<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	console.log('${mcode}')
	console.log('${smallMenuList}')
</script>
<c:set var="mcode">${mcode }</c:set>
<c:set var="subMenuList2">${subMenuList[mcode] }</c:set>
<nav class="d-flex flex-column p-3 sideMenuList" style=" float:left ; width: 15%; height: 100%; display: inline; background-color: #7bc4b2;">

	<c:forEach items="${subMenuList[mcode]}" var="subMenu">
		<a class="p-2 a nav-link bold fw-bold " href="javascript:goPage('${subMenu.murl }', '${subMenu.mcode }');" data-url="${subMenu.mcode }" aria-expanded="true" style="color: white; text-decoration-line: none;">${subMenu.mname }</a>
		<c:set var="mcode">${subMenu.mcode }</c:set>
		<c:forEach items="${smallMenuList[mcode] }" var="smallMenu">
			<a class="p-2 a nav-link " href="javascript:goPage('${smallMenu.murl }', '${smallMenu.mcode }');" data-url="${smallMenu.mcode }" aria-expanded="true" style="color: white; text-decoration-line: none;">&nbsp;&nbsp;&nbsp;&nbsp;${smallMenu.mname }</a>
		</c:forEach>
	</c:forEach>
</nav>