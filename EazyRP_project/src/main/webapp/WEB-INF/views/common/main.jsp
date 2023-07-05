<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
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
        <a class="navbar-brand" href="#">ë¡ê³ </a>
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
      <li class="nav-scroller py-1 mb-2 dropdown">
          <a class="p-2 a nav-link dropdown-toggle bold fw-bold" href="#" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; text-decoration-line: none;">ê°ì¸ì ë³´/ë¬¸ì</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">ë§ì´íì´ì§1</a></li>
            <li><a class="dropdown-item" href="#">ë§ì´íì´ì§2</a></li>
            <li><a class="dropdown-item" href="#">ë§ì´íì´ì§3</a></li>
          </ul>
      </li>
      <li class="nav-scroller py-1 mb-2 dropdown">
        <a class="p-2 a nav-link dropdown-toggle bold fw-bold" href="#" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; text-decoration-line: none;">ëë§ì ë©ë´(ì ì¡°ì)</a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">ê¸°ì´ì ë³´</a></li>
          <li><a class="dropdown-item" href="#">ë°ì£¼ê´ë¦¬ ë° ì/ì¶ê³  ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ìì°ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ì»¤ë®¤ëì¼ì´ì</a></li>
        </ul>
      </li>
      <li class="nav-scroller py-1 mb-2 dropdown">
        <a class="p-2 a nav-link dropdown-toggle bold fw-bold" href="#" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; text-decoration-line: none;">ëë§ì ë©ë´(ì íµì)</a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">ê¸°ì´ì ë³´</a></li>
          <li><a class="dropdown-item" href="#">ì/ì¶ê³  ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ì¬ê³ ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ë§¤ì/ë§¤ì¶ ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ìê¸/ì§ê¸ ì²ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ì»¤ë®¤ëì¼ì´ì</a></li>
        </ul>
      </li>
      <li class="nav-scroller py-1 mb-2 dropdown">
        <a class="p-2 a nav-link dropdown-toggle bold fw-bold" href="#" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; text-decoration-line: none;">ì¬ê³ 1</a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">ê¸°ì´ë±ë¡</a></li>
          <li><a class="dropdown-item" href="#">ììê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">êµ¬ë§¤ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ìì°/ì¸ì£¼</a></li>
          <li><a class="dropdown-item" href="#">ê¸°íì´ë</a></li>
        </ul>
      </li>
      <li class="nav-scroller py-1 mb-2 dropdown">
        <a class="p-2 a nav-link dropdown-toggle bold fw-bold" href="#" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; text-decoration-line: none;">ì¬ê³ 2</a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">ì¼íëª°ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ìí ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">A/S ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">íì§ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ì´ìµê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ì¤ëê´ë¦¬</a></li>
        </ul>
      </li>
      <li class="nav-scroller py-1 mb-2 dropdown">
        <a class="p-2 a nav-link dropdown-toggle bold fw-bold" href="#" data-bs-toggle="dropdown" aria-expanded="false" style="color: white; text-decoration-line: none;">erp ê´ë¦¬</a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">ê¸ì¬ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ì¸ì¬ê´ë¦¬</a></li>
          <li><a class="dropdown-item" href="#">ì ìê²°ì¬ê´ë¦¬</a></li>
        </ul>
      </li>
        
  </nav>

    <!-- main -->

    <body>
        <div class="container-fluid" style="height: 80%; margin-top: 10px;">
            <div class="row" style="height: 65%;">
              <div class="card col col-sm-3 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">ìºë¦°ë</h4>
                    </div>
              </div>
             <div class="card col col-sm-3 rounded-3 shadow-sm">
                <div class="card-header py-3">
                  <h4 class="my-0 fw-normal">ìºë¦°ë</h4>
                </div>
            </div>
            <div class="card col col-sm-3 rounded-3 shadow-sm">
              <div class="card-header py-3">
                <h4 class="my-0 fw-normal">ìºë¦°ë</h4>
              </div>
            </div>
                <div class="card col col-sm-3 rounded-3 shadow-sm " >
                  <table class="table table-striped table-sm text-center">
                    <thead>
                      <tr>
                        <th class="p-2 mb-2 align-middle scope=" >
                          <font style="vertical-align: inherit; vertical-align: inherit; color: black;">ê²°ì ìë¥ëª</font>
                        </th>
                        <th class="p-2 mb-2 align-middle scope=" >
                          <font style="vertical-align: inherit; vertical-align: inherit; color: black;">ê¸°ìì</font>
                        </th>
                        <th class="p-2 mb-2 align-middle scope=" >
                          <font style="vertical-align: inherit; vertical-align: inherit; color: black;">ê²°ì ì</font>
                        </th>
                        <th class="p-2 mb-2 align-middle scope=" >
                          <font style="vertical-align: inherit; vertical-align: inherit; color: black;">ì§íìí</font>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;"><a href="#">íìë¹ì©</a></font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê¹ëë¦¬</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë°ê³¼ì¥</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì§íì¤</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,002</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¶ìê° ëë¤</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì§ë¦¿í</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì¤ê³</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,003</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¬´ììì</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê°</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì ì©í</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,003</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì ë³´</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì¤ëª</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¬´ììì</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,004</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì¼ì </font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì¡°ì </font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê°</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,005</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê°</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì§ë¦¿í</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¶ìê° ëë¤</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,005</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê°</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì§ë¦¿í</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¶ìê° ëë¤</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,005</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê°</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì§ë¦¿í</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¶ìê° ëë¤</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,005</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê°</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì§ë¦¿í</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¶ìê° ëë¤</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,005</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê°</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì§ë¦¿í</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¶ìê° ëë¤</font>
                          </font>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">1,005</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ê°</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ì§ë¦¿í</font>
                          </font>
                        </td>
                        <td>
                          <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">ë¶ìê° ëë¤</font>
                          </font>
                        </td>
                      </tr>
                   
                    
                      
                    
                      
                    </tbody>
                  </table>
                </div>
                </div>
                <div class="row d-flex" style="height: 35%;">
                  <div class="card col col-sm-12 rounded-3 shadow-sm">
                      <div class="card-header py-3">
                        <h4 class="my-0 fw-normal">ì¤ëê´ë¦¬ì§íë¨ê³</h4>
                      </div>
                    </div>
                </div>
              
                <!-- <div class="card col-12 row-4 rounded-3 shadow-sm">
                  <div class="card-header py-3">
                    <h4 class="my-0 fw-normal">ìºë¦°ë</h4>
                  </div>
               </div> -->
                
              <!-- <div class="card rounded-3 shadow-sm">
                <div class="card-header ui-sortable-handle" style="cursor: move;">
                  <h3 class="card-title">
                    <i class="fas fa-chart-pie mr-1"></i>
                    3
                  </h3>
                  <div class="card-tools">
                    <ul class="nav nav-pills ml-auto">
                      <li class="nav-item">
                        <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Area</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#sales-chart" data-toggle="tab">Donut</a>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="card-body">
                  <div class="tab-content p-0">
                    <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;">
                      <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                          <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                          <div class=""></div>
                        </div>
                      </div>
                      <canvas id="revenue-chart-canvas" height="300" style="height: 300px; display: block; width: 653px;"
                        width="653" class="chartjs-render-monitor"></canvas>
                    </div>
                    <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                      <canvas id="sales-chart-canvas" height="0" style="height: 0px; display: block; width: 0px;"
                        class="chartjs-render-monitor" width="0"></canvas>
                    </div>
                  </div>
                </div>
              </div> -->
        
            </div>
    </body>

</html>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>