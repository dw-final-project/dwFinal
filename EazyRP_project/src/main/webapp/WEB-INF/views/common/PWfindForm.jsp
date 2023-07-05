<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Flat Modal Login Modal Form</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
html {
    height: 100%;
    width: 100%;
}
body {
	font-family: 'Varela Round', sans-serif;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100%;
}
.modal-login {
	width: 500px;
   
}
.modal-login .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
}
.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}
.modal-login .close {
	position: absolute;
	top: -10px;
	right: -10px;
}
.modal-login h4 {
	color: #636363;
	text-align: center;
	font-size: 26px;
	margin-top: 0;
}
.modal-login .modal-content {
	color: #999;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 25px;
}
.modal-login .form-group {
	margin-bottom: 20px;
}
.modal-login label {
	font-weight: normal;
	font-size: 13px;
}
.modal-login .form-control {
	min-height: 44px;
	padding-left: 5px;
	box-shadow: none !important;
	border-width: 0 0 1px 0;
	border-radius: 0;
}
.modal-login .form-control:focus {
	border-color: #ccc;
}
.modal-login .input-group-addon {
	max-width: 42px;
	text-align: center;
	background: none;
	border-bottom: 1px solid #ced4da;
	padding-right: 5px;
	border-radius: 0;
}
.modal-login .btn, .modal-login .btn:active {        
	font-size: 16px;
	font-weight: bold;
	background: #4685e4 !important;
	border-radius: 3px;
	border: none;
	min-width: 140px;
}
.modal-login .btn:hover, .modal-login .btn:focus {
	background: #4685e4 !important;
}
.modal-login .hint-text {
	text-align: center;
	padding-top: 5px;
	font-size: 13px;
}
.modal-login .modal-footer {
	color: #999;
	border-color: #dee4e7;
	text-align: center;
	margin: 0 -25px -25px;
	font-size: 13px;
	justify-content: center;
}
.modal-login a {
	color: #fff;
	text-decoration: underline;
}
.modal-login a:hover {
	text-decoration: none;
}
.modal-login a {
	color: #636363;
	text-decoration: none;
}	
.modal-login a:hover {
	text-decoration: underline;
}
.modal-login .fa {
	font-size: 21px;
	position: relative;
	top: 6px;
}
.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
.findbtn{
	display: flex;
	justify-content: center;
	align-items: center;
}
.inputText{
	width: 70%;
	display: inline-flex;
}
.chkbtn{
	color: #fff;
	background: #4685e4 !important;
	border: none;
    font-size: 0.85rem;
    padding: 12px 7px;
	border-radius: 7px;
}
</style>
</head>
<body>
<!-- Modal HTML -->
	<div class="modal-dialog modal-login ">
	<div class="modal-dialog modal-login ">
		<div class="modal-content " style="padding-left: 45px; padding-right: 5px;">
			<div class="modal-header">				
				<h4 class="modal-title">PW ì°¾ê¸°</h4>
			</div>
			<div class="modal-body">
				<form action="/examples/actions/confirmation.php" method="post">
					<div class="form-group">
						<div class="input-group inputText">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" class="form-control" name="id" placeholder="ìì´ë" required="required">
						</div>
					</div>
					<div class="form-group d-flex">
						<div class="input-group inputText">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="text" class="form-control" name="email" placeholder="ì´ë©ì¼" required="required">
						</div>
						<div>
							<input type="button" class="chkbtn" name="emailchk" required="required" value="ì¸ì¦ë²í¸ ì ì¡">							
						</div>
					</div>
					<div class="form-group d-flex">
						<div class="input-group inputText">
							<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
							<input type="text" class="form-control" name="password" placeholder="ì¸ì¦ë²í¸" required="required">
						</div>
						<div>
							<input type="button" class="chkbtn" name="emailchk" required="required" value="ì¸ì¦ë²í¸ íì¸">			
						</div>
					</div>
					<div class="form-group findbtn">
						<button type="submit" class="btn btn-info btn-block btn-sm" style="width: 60%; margin-top: 30px;">ID ì°¾ê¸°</button>
					</div>
				</form>
			</div>
			
		</div>
	</div>    
</body>
</html>