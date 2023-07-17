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
    <h2>DW 견적서 상세</h2>
	<div class="card-footer">
		<button type="button" id="modifyBtn" class="btn btn-warning">수정</button>
		<button type="button" id="removeBtn" class="btn btn-danger">삭제</button>
		<button type="button" id="listBtn" class="btn btn-primary">닫기</button>
	</div>
	<!-- card footer End -->
<form role="form">
<input type="hidden" name="est_no" value="${est.EST_NO }">
	<table>
        <tr>
            <td width="40%" align="center"><b>견적서 코드</b></td>
            <td width="100%"><input type="text" style="width: 100%;" value="${est.EST_NO }" readonly></td>
        </tr>
        <tr>
            <td align="center">등록일자</td>
            <td><input type="text" style="width: 100%;" value="${est.REGDATE }"></td>
        </tr>
        <tr>
            <td align="center">외화 명</td>
            <td><input type="text" style="width: 100%;" value="${est.FC_NAME }"></td>
        </tr>
        <tr>
            <td align="center">담당자</td>
            <td><input type="text" style="width: 100%;" value="${est.E_NAME }"></td>
        </tr>
        <tr>
            <td align="center">첨부파일</td>
            <td><input type="file" style="width: 100%;" value="${est.FILES != null ? "${est.files }" : "파일이 존재하지 않습니다."}"></td>
        </tr>
    </table>
    <table>
        <tr>
            <th align="center" style="width: 20%;">제품명</th>
            <th align="center" style="width: 20%;">창고</th>           
            <th align="center" style="width: 20%;">수량</th>
            <th align="center" style="width: 20%;">가격</th>
        </tr>
       <c:forEach items="${estPr }" var="est">
        <tr>
            <td><input type="text" style="width: 100%;" style="width: 100%;" value="${est.P_NAME }"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;" value="${est.WH_NAME }"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;" value="${est.QUANTITY }"></td>
            <td><input type="text" style="width: 100%;" style="width: 100%;" value="${est.AMOUNT }"></td>
        </tr>
        </c:forEach>
        <tr class="total">
            <td colspan="3" align="center">총계</td>
            <td colspan="2" align="center"><input type="text" style="width: 100%;" value="${est.AMOUNT }"></td>
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
