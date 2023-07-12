<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>견적서</title>
    
    <style>
    	input {
    		border: none;
    		text-size : 100%;
    	}
    	html {
    		display: flex;
    		align-items: center;
    		justify-content: center;
    		font-size: 0.7em;
    	}
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            align-items: center;
    		justify-content: center;
            width: 70%;
            height: 70%;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th,
        td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
            text-align: center;
        }

        td {
            vertical-align: middle;
        }

        .total,
        .files {
            font-weight: bold;
        }

        .note {
            font-style: italic;
        }
    </style>
</head>

<body>
    <h2>DW 견적서 상세</h2>
	<div class="card-footer">
		<button type="button" id="modifyBtn" class="btn btn-warning">수정</button>
		<button type="button" id="removeBtn" class="btn btn-danger">삭제</button>
		<button type="button" id="listBtn" class="btn btn-primary">닫기</button>
	</div>
	<!-- card footer End -->
<form role="form">
<input type="hidden" name="est_no" value="${estVo.est_no }">
	<table>
        <tr>
            <td width="40%" align="center"><b>견적서 코드</b></td>
            <td width="100%"><input type="text" style="width: 100%;" value="${estVo.est_no }" readonly></td>
        </tr>
        <tr>
            <td align="center">등록일자</td>
            <td><input type="text" style="width: 100%;" value="${estVo.sys_regdate }"></td>
        </tr>
        <tr>
            <td align="center">사원 번호</td>
            <td><input type="text" style="width: 100%;" value="${estVo.emp_no }"></td>
        </tr>
        <tr>
            <td align="center">외화 코드</td>
            <td><input type="text" style="width: 100%;" value="${estVo.fc_no }"></td>
        </tr>
        <tr>
            <td align="center">최초 등록자</td>
            <td><input type="text" style="width: 100%;" value="${estVo.sys_reg }"></td>
        </tr>
    </table>
    <table>
        <tr>
            <th rowspan="2" align="center" style="width: 20%;">사용 구분</th>
            <th rowspan="2" align="center" style="width: 20%;">진행 상태</th>
            <th colspan="2" align="center" style="width: 40%;">금액(비용)</th>
            <th rowspan="2" align="center" style="width: 20%;">비고</th>
        </tr>
        <tr>
            <th align="center">제품 코드</th>
            <th align="center">수량</th>
        </tr>
        <tr>
            <td rowspan="12" align="center">
            <input type="text" style="width: 100%;" value="${estVo.enabled }"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;" value="${estVo.progress }"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;" value="${estVo.wh_no }"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;" value="${estVo.quantity }"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
        </tr>
        <tr>
            <td><input type="text" style="width: 100%;" style="width: 100%;">4</td>
            <td><input type="text" style="width: 100%;" style="width: 100%;">5</td>
            <td><input type="text" style="width: 100%;" style="width: 100%;">6</td>
            <td><input type="text" style="width: 100%;" style="width: 100%;">7</td>
        </tr>
        <tr>
            <td rowspan="2"><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
        </tr>
        <tr>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
        </tr>
        <tr>
            <td rowspan="2"><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
        </tr>
        <tr>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
        </tr>
        <tr>
            <td rowspan="3"><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
        </tr>
        <tr>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;"></td>
        </tr>
        <tr>
            <td><input type="text" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;"></td>
        </tr>
        <tr>
            <td rowspan="2"><input type="text" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;"></td>
        </tr>
        <tr>
            <td><input type="text" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;"></td>
            <td><input type="text" style="width: 100%;"></td>
        </tr>
        <tr>
            <td align="center"><input type="text" style="width: 100%;"></td>
            <td colspan="3"><input type="text" style="width: 100%;"></td>
        </tr>
        <tr class="files">
            <td colspan="3" align="center">첨부 파일</td>
            <td colspan="2" align="center"><input type="text" style="width: 100%;"></td>
        </tr>
        <tr class="total">
            <td colspan="3" align="center">총계</td>
            <td colspan="2" align="center"><input type="text" style="width: 100%;" value="${estVo.amount }"></td>
        </tr>
    </table>
</form>
</body>


	

<script>
window.onload = function(){

	let formObj = $('form[role="form"]');

	$('button#modifyBtn').on('click', function(){
		formObj.attr({
			'action' : 'modifyForm.do',
			'method' : 'post' 
		});
		formObj.submit();
	});
	
	$('button#removeBtn').on('click', function(){
		if(confirm("정말 삭제하시겠습니까?")){
			formObj.attr({
				'action' : 'remove',
				'method' : 'post' 
			});
			formObj.submit();
		};
	});
	
	$('button#listBtn').on('click', function(){
		window.opener.location.reload(true);
		window.close();
	});
}

</script>

</html>
