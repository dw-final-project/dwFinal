<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="C:\Users\note_ma01\Desktop\bootstrap-datepicker-master\dist\css\bootstrap-datepicker.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<head>
  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>개인정보수정</title>

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

  </style>
  <!-- Custom styles for this template -->
</head>
  
  <!-- main -->
  <div class="main" style="height: 80%; display: flex;">

     <!-- 11111 -->
     <div class="h-60 col-lg-8" style="align-items: center; display: flex; justify-content: center;">
      <!-- .card -->
      <div class="card card-fluid" >
        
        
        <div class="card-body">
          <!-- form -->
          <!-- form -->
          <div class="d-flex align-items-center pb-3 mb-3 text-center link-dark text-decoration-none border-bottom">
            <span class="fs-5 fw-semibold "> 개인정보 수정 </span>
          </div>
          <form id="modProfileForm" action="/member/modProfileForm.do" method="post">
            <!-- .form-group -->
          
            <div class="form-group">
              <label for="email">Email</label> 
              <div class="input-group">
                <input type="email" class="form-control" id="email" name ="email" required="">
                <button type="button" class="btn btn-primary" class="chkbtn" name="emailauth" id="emailauth" >인증번호 전송</button>
              </div>
            </div>
            <div class="form-group">
              <label for="emailchk">인증번호</label> 
              <div class="input-group ">
                <input type="text" class="form-control mail-check-input">
                <button type="btn" class="btn btn-primary" id="emailchk" name="emailchk" required="required"  >인증번호 확인</button>
              </div>
            </div>
            <div class="form-group">
              <label for="input02">비밀번호 변경</label> 
              <input type="password" class="form-control" id="pwd" name="pwd" required="required">
            </div>
              <div class="form-group">  
              <label for="input02">비밀번호 확인</label> 
              <input type="password" class="form-control" id="pwchk" name="pwchk" required="required">
            </div><!-- /.form-group -->
              <button type="submit" class="btn btn-primary" >비밀번호 변경</button>
              <button type="cencle" id ="cencle" class="btn btn-primary" >취 소</button>
          </form><!-- /form -->
        </div><!-- /.card-body -->
      </div><!-- /.card -->
    </div>
  </div>
    
    <!-- footer -->
    
    
    

  
  </html>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<%@ include file="modProfile_js.jsp" %> 
<%@ include file="../include/footer_js.jsp"%>