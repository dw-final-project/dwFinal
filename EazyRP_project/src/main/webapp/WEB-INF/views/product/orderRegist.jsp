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
            font-size: 0.7em;
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
        .readonly{
        	border: none;
        }
    </style>
</head>
	

<body>
    <h2>발주 요청 추가</h2>
	<!-- card footer End -->
<form role="form" method="post" action="/product/productBuyRegistFrom.do" enctype="multipart/form-data">
	<table>
        <tr>
            <td width="40%" align="center"><b>작성자</b></td>
            <td><input type="text" value="${e_name }" id="name" name="sys_reg" readonly class="readonly"></td>
        </tr>
        <tr>
            <td width="40%" align="center"><b>발주 보고서 첨부</b></td>
            <td>
            	<select name="dr_no" id="documentSel" style="width: 50%; height: 20px;">
            			<option value="">보고서 선택</option>
            		<c:forEach items="${draft}" var="draft">
            			<option value="${draft.dr_no }">${draft.title }</option>
            		</c:forEach>
				</select>
				<input type="button" id="documentInsertBtn" class="btn btn-primary" style="margin-left: 5px;"value="첨부">
			</td>
        </tr>
        <tr>
            <td align="center"><b>발주 요청 업체</b></td>
            <td></td>
        </tr>
    </table>
    <table>
    	<thead>
        <tr>
            <th align="center" style="width: 25%;">창고명</th>
            <th align="center" style="width: 25%;">제품명</th>
            <th align="center" style="width: 25%;">수량</th>
            <th align="center" style="width: 25%;">가격</th>
        </tr>
        </thead>
        <tbody id="prInput">
        <c:if test="${not empty name}">
         	<c:forEach var="nameItem" items="${name}" varStatus="loop">
                <tr>
                    <td>${quantity.get(loop.index) }</td>
                    <td>${name.get(loop.index) }</td>
                    <td></td>
                    <td></td>
                </tr>
            </c:forEach>
		</c:if>
        </tbody>
        <tr class="total">
            <td colspan="2" align="center">총계</td>
            <td colspan="2" align="center"></td>
        </tr>
    </table>
            <input type="submit" class="btn btn-primary" style="text-align : center;" value="요청">
            <input type="button" id="calcelBtn" class="btn btn-warning" style="text-align : center;" value="닫기">
</form>
</body>

<form id="documentForm" action="/product/document.do" method="post">
	<input type="hidden" id="documentName" name="dr_no" value="">
</form>
<script>
	$('#documentSel').on('change', function(){
		$('#documentName').val($('#documentSel').val());
	})
	
	$('#documentInsertBtn').on('click', function(){
		$('#documentForm').submit();
	})
	
	// 창고코드 이벤트
	$(document).on('click', '.wh_names', function(){
		let whVal = $(this).attr('id');
		$('#cnt').val(whVal);
		let openWin = OpenWindow("/erp4/findWareHouse.do","창고 찾기", 500,500);
	})
	
	// 수량 이벤트
	$(document).on('keyup', '.quantity', function(){
// 		let quantity = $(this).val();
		$(this).parent().next().children().val($(this).val()*$(this).next().val());
	})
	
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
								+ "height=" + WinHeight + ",top="+ wintop + ",left="
								+ winleft + ",resizable=yes,status=yes");
		win.focus();
		return win;
	};
	
	$(document).on('change, keyup', '#prInput', function(){
		let sum = Number(0);
		let inputAmount = $('input[name="amount"]').get();
		for(let i = 0; i < inputAmount.length; i++){
			sum += Number($('input[name="amount"]').eq(i).val());
		}
		
		$('#price').val(sum);
	})
	
</script>

	

<!-- <script> -->


<!-- </script> -->

<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
</html>
