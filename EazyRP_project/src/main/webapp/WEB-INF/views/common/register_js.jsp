<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

	// 아이디 중복확인으로 확인된 아이디가 저장될 곳
	let checkedID = "";	
	function idCheck_go(){
		let input_ID = $('#id');
		
		if(input_ID.val() == ""){
			alert("아이디를 입력하세요.");
			input_ID.focus();
			return;
		}else{
			// 아이디는 4~13 글자의 영문자와 숫자로만 입력
			let reqID = /^[a-z]{1}[a-zA-Z0-9]{3,12}$/;
			if(!reqID.test(input_ID.val())){
				alert("아이디는 첫 글자는 영소문자이며, \n4~13자리의 영문자와 숫자로만 입력해야 합니다.");
				input_ID.focus();
				return;
			};
		};
		
		// 중복확인
		let data = {id : input_ID.val().trim()}; 
		
		$.ajax({
			url : "<%=request.getContextPath()%>/member/idCheck.do",
			data : data,
			type : 'post',
			success : function(result){
				if(result){	// 빈 스트링은 false 처리 됨
					alert("사용가능한 아이디 입니다.");
					checkedID = result;
					$('input[name="id"]').val(checkedID);
				}else{
					alert("중복된 아이디 입니다.");
					input_ID.focus();
				};
			},
			error : function(error){
				
			}
		});
		
	};
	
	// password 정규식 체크 - 영문 소문자, 대문자, 특수문자, 숫자가 반드시 하나 이상씩 입력
	let pass = $("input[name=pw]");
	pass.on("keyup",  function () {
		passVal = pass.val().trim();
		
		regPass =  /^(?=.*[a-z])(?=.*[A-Z])(?=.*[`~!@$%&?*])[A-Za-z\d`~!@$%&?*]{8,15}/;
		
		if ( !(regPass.test(passVal)) ) {
			pass.attr("class", "form-control is-invalid");
		} else {
			pass.attr("class", "form-control is-valid");
		}
	});
	
	// pass2 pass일치 비교
	let passCheck = $("input[name=pwchk]");
	passCheck.on("keyup", function () {
		let passCheckVal = passCheck.val().trim();
		
		if (passVal != passCheckVal) {
			passCheck.attr("class", "form-control is-invalid");
		} else {
			passCheck.attr("class", "form-control is-valid");
		}
	});

	$('#emailauth').click(function() {
		const email = $('#email').val() + $('#domainselect').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url :  '<%=request.getContextPath()%>/member/mailCheck.do?email=' + email,
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			},
			error : function(err){
				alert(err.status)
			}
		}); // end ajax
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#emailauthchk');
		
		if(inputCode === code){
			alert('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#email').attr('readonly',true);
			$('#domainselect').attr('readonly',true);
	 		$('#domainselect').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	        $('#domainselect').attr('onChange', 'this.selectedIndex = this.initialSelect'); 
		}else{
			alert('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});
	
	
	
	function submit_go(){
		let uploadCheck = $('input[name="checkUpload"]').val();		
		
		if($('input[name="id"]').val() == ""){
			alert("아이디는 필수 입니다.");
			return;
		};
		if($('input[name="idchk"]').val() != checkedID){
			alert("아이디 중복확인이 필요합니다.");
			return;
		};
		if($('input[name="pw"]').val() == ""){
			alert("패스워드는 필수입니다.");
			return;
		};
		
		if($('input[name="pwchk"]').val() == ""){
			alert("패스워드확인이 필요합니다.");
			return;
		};

		if($('input[name="name"]').val() == ""){
			alert("이름은 필수입니다.");
			return;
		};
		
		if($('input[name="email"]').val() == ""){
			alert("이메일은 필수입니다.");
			return;
		};
		
	
		
		$('form[role="form"]').submit();
			
	};
	
	
	
	
	
</script>