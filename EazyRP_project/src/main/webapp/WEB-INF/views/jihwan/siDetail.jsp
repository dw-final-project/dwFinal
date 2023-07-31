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
    <title>출하지시서 상세</title>
    
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
    <h2>DW 출하지시서 상세</h2>
	<div class="card-footer">
		<button type="button" id="modifyBtn" class="btn btn-warning">수정</button>
		<button type="button" id="removeBtn" class="btn btn-danger">삭제</button>
		<button type="button" id="listBtn" class="btn btn-primary">닫기</button>
	</div>
	<!-- card footer End -->
<form role="form" method="post" enctype="multipart/form-data">
<input type="hidden" name="si_no" value="${si.SI_NO }">
	<table>
        <tr>
            <td width="40%" align="center"><b>출하지시서 코드</b></td>
            <td width="100%"><input type="text" style="width: 100%;" value="${si.SI_NO }" readonly></td>
        </tr>
        <tr>
            <td align="center">등록 일자</td>
            <td><fmt:formatDate value="${si.SYS_REGDATE }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
        </tr>
        <tr>
            <td align="center">사원 명</td>
            <td><input type="hidden" name="emp_no" id="receiver" value="${si.EMP_NO }">
            <input type="text" style="width: 100%;" value="${si.E_NAME }" id="name" name="name" readonly onclick="OpenWindow('/mymenu/findPeople.do', '사람찾기', 500, 500)"></td>
        </tr>
         <tr>
            <td align="center">출하 창고</td>
             <td><input type="text" id="0" class="wh_names" name="wh_name" style="width: 100%;" value="${si.WH_NAME }"><input type="hidden" name="wh_no" value=""></td>
        </tr>
        <tr>
            <td align="center">출하 일자</td>
            <td><input type="date" value="<fmt:formatDate value="${si.SHIPDATE }" pattern="yyyy-MM-dd"></fmt:formatDate>"></td>
        </tr>
       
    </table>
    <button type="button" id="addPutBtn" style="margin-bottom: 10px;" class="btn btn-primary">버튼 추가</button>
    <table>
        <tr>
            <th align="center" style="width: 20%;">제품코드</th>
            <th align="center" style="width: 20%;">제품 명</th>           
            <th align="center" style="width: 20%;">수량</th>
           	<th align="center" style="width: 20%;">내용</th>
           	<th align="center" style="width: 20%;">비고</th>
        </tr>
    	<tbody id="prInput">
    	<input type="hidden" value="" id="cnt">
       <c:forEach items="${siList}" var="si">
        <tr id="trChk" >    	
	       <input type="hidden" class="rownum" value="${si.ROWNUM }">
	       <input type="hidden" name="sidetail_no" id="sidtail_no" value="${si.SIDETAIL_NO }">
	       <input type="hidden" name="enabled" id="estenabled" value="${si.ENABLED }">
	       <input type="hidden" name="pr_delete" value="n">
        	<td><input type="text" id="${si.ROWNUM }" class="pr_nos" name="pr_no" value="${si.PR_NO }" readonly><input type="hidden" name="pr_no" value="${si.PR_NO }"></td>
        	<td><input type="text" id="pr_name${si.ROWNUM }" class="pr_names2" name="pr_name" style="width: 100%;" value="${si.PR_NAME }"></td>
            <td><input type="text" id="quantity" class="quantity" name="quantity" style="width: 100%;" value="${si.QUANTITY }">
            <td><input type="text" id="amount" name="amount" style="width: 100%;" value="${si.AMOUNT }" readonly ></td>
            <td style="text-align : center;"><button type="button" id="cancelBtn" class="btn btn-danger">삭제</button></td>
        </tr>
        </c:forEach>
        </tbody>
        <tr class="total">
            <td colspan="2" align="center">총 수량</td>
            <td colspan="1" align="center"><input type="text" id="totalQuantity" style="width: 100%;" value="${si.QUANTITY }" readonly></td>
            <td colspan="2" align="center"></td>
        </tr>
    </table>
</form>
</body>
</script>

<script>
let rownumList = $('.rownum');
let cnt = rownumList.length; 
console.log(cnt);
let dtail_no = $('#dtail_no').val();

// 제품 추가 버튼
$('#addPutBtn').on('click', function(){
	cnt++;
	$('#prInput').append('<tr id="trChk"><input type="hidden" class="rownum" value="'+ cnt + '">' +
	'<input type="hidden" name="sidetail_no" value="0">'+
	'<input type="hidden" name="pr_delete" value="n">'+
	'<td><input type="text" id="' + cnt + '" class="pr_nos" name="pr_no" value="${si.PR_NO }" readonly><input type="hidden" name="pr_no" value="${si.PR_NO }"></td>' + 
	'<td><input type="text" id="pr_name' + cnt + '" class="pr_names2" name="pr_name" style="width: 100%;" value="${si.PR_NAME }"></td>' +
    '<td><input type="text" id="quantity'+ cnt +'" class="quantity" name="quantity" style="width: 100%;" value=""><input type="hidden" id="cost"></td>'+
    '<td><input type="text" id="sys_up' + cnt +'"class="sys_up" name="sys_up" style="width: 100%;" value="" ></td>' +
    '<td style="text-align : center;"><button type="button" id="cancelBtn" class="btn btn-danger">삭제</button></td>'+
'</tr>');
});


function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
							+ "height=" + WinHeight + ",top="+ wintop + ",left="
							+ winleft + ",resizable=yes,status=yes");
	win.focus();
	return win;
};

$('tr').on('click', function(){
	$('#name', opener.document).val($(this).find('#c_name').text() + " / " + $(this).find('#name').text());
	$('#receiver', opener.document).val($(this).find("#emp_no").val());
	
})

	
	//제품 삭제 버튼
	$('#prInput').on('click', '#cancelBtn', function(){
		$(this).parents('tr').css('display', 'none');
		$(this).parents('tr').find("input[name='pr_delete']").val("d")
	});
	
	//창고코드 이벤트
	$(document).on('click', '.wh_names', function(){
		let whVal = $(this).attr('id');
		$('#cnt').val(whVal);
		let openWin = OpenWindow("/erp4/findWareHouse.do","창고 찾기", 500,500);
	})
	
	// 수량 체인지
	$(document).on('change keyup', '.quantity', function(){
    let totalQuantity = 0;
    $('.quantity').each(function(){
        totalQuantity += parseInt($(this).val()) || 0;
    });
    $('#totalQuantity').val(totalQuantity);
	});

	
	$(document).on('change', '.pr_names', function(){   
			let selectedValue = $(this).val();
		    $(this).siblings('.pr_nos').val(selectedValue);
		});
	
// 	// 제품코드 td 클릭 이벤트
// 	$(document).on('click', '.pr_names2', function(){
// 		let idVal = $(this).parents("tr").find(".rownum").val();
// 		$('#cnt').val(idVal);
// 		let openWin = OpenWindow("/erp4/findProduct.do", "제품 찾기", 500, 500);
		
// 	});
	
	

	<!-- 제품 코드 클릭 이벤트 -->
	$(document).on('click', '.pr_names2', function() {
	    let idVal = $(this).parents("tr").find(".rownum").val();
	    $('#cnt').val(idVal);
	    let openWin = OpenWindow("/erp4/findProduct.do", "제품 찾기", 500, 500);
	});


	
	$(document).on('change, keyup', '#prInput', function(){
		let sum = Number(0);
		let inputAmount = $('input[name="amount"]').get();
		for(let i = 0; i < inputAmount.length; i++){
			sum += Number($('input[name="amount"]').eq(i).val());
		}
		
		$('#totalAmount').val(sum);
	})
	
	
	let fc_no = "${si.FC_NO}";
	$('#fc-select').val(fc_no);
	$('select#fc-select').find('option[value="' + fc_no + '"]').attr('selected', 'selected');
</script>



</html>
    