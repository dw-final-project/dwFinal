<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="selectedEmpNo" value="${sessionScope.emp_no}" />
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.104.2">
  <title>EazyRP</title>

  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">

  <meta name="theme-color" content="#712cf9">
</head>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<style>
  html {
    height: 100%;
  }

  body {
    overflow-x: hidden;
    height: 100%;
  }

  .a:hover {
    background-color: darkslategray;
    transition-duration: 0.35s;
  }

  .nav--link.show {
    color: #fff !important;
  }

  .dropdown-menu {
    border: 1px solid #eee;
    border-radius: 0;
  }

  .card {
    border: solid 6px #f8f9fa;
    border-radius: 10px;
  }

  /* Custom styles */
  .navbar {
    background-color: #7bc4b2;
  }

  .navbar-brand {
    color: #fff;
    font-weight: bold;
  }

  .nav-link {
    color: #fff;
    text-decoration: none;
  }

  .nav-link:hover {
    color: #fff;
    background-color: #6ea89d;
    transition-duration: 0.35s;
  }

  .dropdown-menu {
    background-color: #7bc4b2;
  }

  .dropdown-item {
    color: #fff;
  }

  .dropdown-item:hover {
    background-color: #6ea89d;
    transition-duration: 0.35s;
  }

  .card-header {
    background-color: #f8f9fa;
    color: #000;
    font-weight: bold;
  }

  .table {
    color: #000;
  }
	#selectOp, #selectOp2{
		font-size: 0.8em;
		border: 2px red solid;
		text-align: center;
		width: 100px;
		${c_no eq "" || emp_no eq 0 ? "animation: ct2 1s infinite;" : ""}
		
	}
	@keyframes ct2 {
	     50% {border: 2px yellow solid;}
	}
	
	#animation {
     color: red;
     ${c_no eq "" || emp_no eq 0 ? "animation: ct 1s infinite;" : ""}
	}
	
	@keyframes ct {
	     50% {color: yellow;}
	}
</style>

<body class="bg-light">

    <nav class="navbar navbar-expand-lg bg-light">
    	<c:if test="${empty c_no || emp_no eq 0}">
		    <div style="position: absolute; z-index: 2; right: 80px; top: 55px; font-weight: bold;" id="animation">
		        체험하실 업체와 직원을 먼저 선택해주세요.
		    </div>
		</c:if>
      <div class="container-fluid" style="position: relative;">
        <a class="navbar-brand" href="/common/main.do"><img src="<%=request.getContextPath() %>/resources/img/EazyRP.png" style="width: 100px;"></a>
            <div style="display: flex;">
	            <form class="d-flex" id="selectCompany" method="post" action="/common/change.do?mcode=${mcode }">
	             <select id="selectOp2" class="form-control" name="selectedC_no" >
					<option value="" style=" text-align: center;">업체 선택</option>
					<option style=" text-align: center;" value="C000001" ${c_no eq 'C000001' ? 'selected' : '' }>(주)지민식품</option>
					<option style=" text-align: center;" value="C000002" ${c_no eq 'C000002' ? 'selected' : '' }>희성전자</option>
					<option style=" text-align: center;" value="C000003" ${c_no eq 'C000003' ? 'selected' : '' }>석준물산</option>
					<option style=" text-align: center;" value="C000004" ${c_no eq 'C000004' ? 'selected' : '' }>(주)소라전자</option>
					<option style=" text-align: center;" value="C000005" ${c_no eq 'C000005' ? 'selected' : '' }>민준식품</option>
					<option style=" text-align: center;" value="C000006" ${c_no eq 'C000006' ? 'selected' : '' }>지환물산</option>
				</select>
				<input class="btn btn-warning" style="font-size: 0.8em; margin: 0px 5px 0px 5px;" id="submitBtn" type="submit" value="업체 변경">
	           </form>
	           <form class="d-flex" id="selectCompany" method="post" action="/common/empChange.do?mcode=${mcode }">
	             <select id="selectOp" class="form-control" name="selectedEmp" style="${c_no eq '' ? 'background-color: gray;' : ''}" >
					<option value="" style=" text-align: center;" >직원 선택</option>
						<c:forEach items="${empMap['e_nameList']}" var="eName" varStatus="loop">
						    <c:set var="empNo" value="${empMap['emp_noList'][loop.index]}" />
						    <option style="text-align: center;" value="${empNo}" ${empNo eq selectedEmpNo ? 'selected' : ''}>${eName}</option>
						</c:forEach>
				</select>
				<input class="btn btn-warning" style="font-size: 0.8em; margin-left: 5px;" id="submitBtn2" type="submit" value="직원 변경" ${c_no eq '' ? 'disabled' : ''}>
	           </form>
           </div>
         </div>
    </nav>

    <nav class="nav d-flex" style="padding: 0 16.66666667%; padding-top: 6px; background-color: #7bc4b2; justify-content:space-evenly;">
      <c:forEach items="${menuList}" var="menu">
         <li class="nav-scroller py-1 mb-2 dropdown">
          <a class="p-2 a nav-link  bold fw-bold" href="javascript:goPage('${menu.murl}', '${menu.mcode}');" data-url="${menu.mcode }" aria-expanded="true" style="color: white; text-decoration-line: none;">${menu.mname }</a>
          
         </li>
         </c:forEach>
  </nav>
  <script>
	$('#submitBtn').on('click', function(){
		alert('설정이 완료되었습니다.');
		location.reload(true);
	})
	
	$('#selectOp').on('click', function(){
		if(${c_no} == $(this).val()){
			$("#submitBtn").prop("disabled", true);
		} else{
			$("#submitBtn").prop("disabled", false);
		}
	})
	
	$('#selectOp2').on('click', function(){
		if(${emp_no} == $(this).val()){
			$("#submitBtn2").prop("disabled", true);
		} else{
			$("#submitBtn2").prop("disabled", false);
		}
	})
</script>
<!--   <nav class="flex-column p-3 sideMenuList" style=" float:left ; width: 15%; height: 100%; display: none; background-color: #7bc4b2;"> -->

<!--   </nav> -->