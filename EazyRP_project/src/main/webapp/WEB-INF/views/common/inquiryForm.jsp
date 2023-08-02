<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>문의답변확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">


  <style>
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
	#sora:hover{
		color: red;
	}
  </style>
  <!-- Custom styles for this template -->
</head>

<body class="bg-light">

  
  <!--1234512512124-->
  <div class="h-60 col-lg-10 container text-center;" style="height: 80%;">
    <!-- .card -->
    <div class="card card-fluid" style="width: 80%;">
      <div class="card-body" style="text-align: center;">
        <!-- form -->
        <div class="d-flex align-items-center pb-3 mb-3 text-center link-dark text-decoration-none border-bottom">
          <span class="fs-5 fw-semibold "> 문의사항 </span>
        </div>  
        <div class="row">
          <div class="col-12 table-responsive">
          <table class="table table-striped">
          	<tr>
          		<th>내용이다</th>
          		<th>날짜다</th>
          		<th>답변여부다</th>
          	</tr>
          	<tr id="sora2">
          		<td>내용1</td>
          		<td>날짜1</td>
          		<td>답변1</td>
          	</tr>
          	<tr id="sora" style="position: absolute; z-index: -2;">
          		<td colspan=3>asdfasdfasdf</td>
          	</tr>
          </table>
          </div>
          
          </div>



        </div>
      </div>
</div>



</body>

</html>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
