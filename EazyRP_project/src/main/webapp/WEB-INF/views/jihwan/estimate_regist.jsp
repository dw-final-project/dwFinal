<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <h2>DW 견적서 등록</h2>
	<!-- card footer End -->
<form role="form">
<input type="hidden" name="est_no" value="${est.EST_NO }">
	<table>
        <tr>
            <td width="40%" align="center"><b>담당자</b></td>
            <input type="hidden" name="emp_no" id="emp_no" value="">
            <td><input type="text" style="width: 100%;" value="" id="name" name="name" readonly onclick="OpenWindow('/erp4/findPeople.do', '제품찾기', 800, 600)"></td>
        </tr>
        <tr>
            <td width="40%" align="center"><b>외화 코드</b></td>
            <td><select name="fc_no" id="fc-select">
			    <option value="FC_001">FC_001</option>
			    <option value="FC_002">FC_002</option>
			    <option value="FC_003">FC_003</option>
			    <option value="FC_004">FC_004</option>
			    <option value="FC_005">FC_005</option>
			    <option value="FC_006">FC_006</option>
				</select></td>
        </tr>
        <tr>
            <td align="center"><b>첨부파일</b></td>
            <td><input type="file" style="width: 100%;" value=""></td>
        </tr>
    </table>
    <button type="button" id="addPutBtn">제품추가</button>
    <table>
    	<thead>
        <tr>
            <th align="center" style="width: 20%;">제품 코드</th>
            <th align="center" style="width: 20%;">창고 코드</th>           
            <th align="center" style="width: 20%;">수량</th>
            <th align="center" style="width: 20%;">가격</th>
            <th align="center" style="width: 15%;">비고</th>
            
        </tr>
        </thead>
        <tbody id="prInput">
        <tr>
            <td><input type="text" name="pr_no" style="width: 100%;" value="" onclick="OpenWindow('/erp4/findProduct.do', '제품 찾기', 800, 600)"></td>
            <td><input type="text" name="wh_no" style="width: 100%;" value=""></td>
            <td><input type="text" name="quantity" style="width: 100%;" value=""></td>
            <td><input type="text" name="amount" style="width: 100%;" value=""></td>
            <td style="text-align : center;"><button type="button" id="cancelBtn">삭제</button></td>
        </tr>
        </tbody>
        <tr class="total">
            <td colspan="3" align="center">총계</td>
            <td colspan="2" align="center"><input type="text" style="width: 100%;" value="${est.AMOUNT }"></td>
        </tr>
    </table>
            <button type="button" id="modifyBtn" class="btn btn-warning" style="text-align : center;">생성</button>
</form>
</body>


<script>
	// 파일 추가 버튼
	$('#addPutBtn').on('click', function(){
		$('#prInput').append('<tr>'+
	            '<td><input type="text" name="pr_no" style="width: 100%;" value="" onclick="OpenWindow("/erp4/findProduct.do", "제품 찾기", 800, 600)"></td>' +
	            '<td><input type="text" name="wh_no" style="width: 100%;" value=""></td>' +
	            '<td><input type="text" name="quantity" style="width: 100%;" value=""></td>' +
	            '<td><input type="text" name="amount" style="width: 100%;" value=""></td>' +
	            '<td style="text-align : center;"><button type="button" id="cancelBtn">삭제</button></td>' +
	        '</tr>');
	});
	
	// 파일 삭제 버튼
	$('#prInput').on('click', '#cancelBtn', function(){
		$(this).parent('td').parent('tr').remove();
	});
	
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
	};
</script>

	

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
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
</html>
