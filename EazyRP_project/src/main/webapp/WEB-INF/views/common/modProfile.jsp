<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
    <!-- sidebar -->   
<%@ include file="../include/sidebar.jsp" %>
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
          <form id="modProfile" action="/member/modProfile.do"method="post">
            <!-- .form-group -->
          
            <div class="form-group">
              <label for="email">Email</label> 
              <div class="input-group">
                <input type="email" class="form-control" id="email" required="">
                <button type="submit" class="btn btn-primary" disabled>인증번호 전송</button>
              </div>
            </div>
            <div class="form-group">
              <label for="emailchk">인증번호</label> 
              <div class="input-group">
                <input type="email" class="form-control" id="emailchk">
                <button type="submit" class="btn btn-primary" disabled>인증번호 확인</button>
              </div>
            </div>
            <div class="form-group">
              <label for="input02">비밀번호 변경</label> 
              <input type="password" class="form-control" id="input02" required="">
            </div>
              <div class="form-group">  
              <label for="input02">비밀번호 확인</label> 
              <input type="password" class="form-control" id="input02" required="">
            </div><!-- /.form-group -->
              <button type="submit" class="btn btn-primary" disabled>비밀번호 변경</button>
              <button type="submit" class="btn btn-primary" disabled>취 소</button>
          </form><!-- /form -->
        </div><!-- /.card-body -->
      </div><!-- /.card -->
    </div>
  </div>
 
    
  </body>
  
  </html>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

