<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</style>

<body class="bg-light">

    <nav class="navbar navbar-expand-lg bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">로고</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          </ul>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li>
            </ul>
            <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
          </div>
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
  
<!--   <nav class="flex-column p-3 sideMenuList" style=" float:left ; width: 15%; height: 100%; display: none; background-color: #7bc4b2;"> -->

<!--   </nav> -->