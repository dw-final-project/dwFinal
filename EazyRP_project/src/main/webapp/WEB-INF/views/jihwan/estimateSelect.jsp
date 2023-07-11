<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>견적서</title>
    <style>
    	html {
    		display: flex;
    		align-items: center;
    		justify-content: center;
    	}
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            width: 70%;
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

        .total,.files {
            font-weight: bold;
        }

        .note {
            font-style: italic;
        }
    </style>
</head>

<body>
    <h2>DW 견적서</h2>

    <table>
        <tr>
            <td width="40%" align="center"><b>견적서 코드</b></td>
            <td width="60%"></td>
        </tr>
        <tr>
            <td align="center">등록일자</td>
            <td></td>
        </tr>
        <tr>
            <td align="center">사원 번호</td>
            <td></td>
        </tr>
        <tr>
            <td align="center">외화 코드</td>
            <td></td>
        </tr>
        <tr>
            <td align="center">최초 등록자</td>
            <td></td>
        </tr>
    </table>
    <table>
        <tr>
            <th rowspan="2" align="center">사용 구분</th>
            <th rowspan="2" align="center">진행 상태</th>
            <th colspan="2" align="center">금액(비용)</th>
            <th rowspan="2" align="center">비고</th>
        </tr>
        <tr>
            <th align="center">제품 코드</th>
            <th align="center">수량</th>
        </tr>
        <tr>
            <td rowspan="12" align="center"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td rowspan="2"></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td rowspan="2"></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td rowspan="3"></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td rowspan="2"></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td align="center"></td>
            <td colspan="3"></td>
        </tr>
        <tr class="files">
            <td colspan="3" align="center">첨부 파일</td>
            <td colspan="2" align="center"></td>
        </tr>
        <tr class="total">
            <td colspan="3" align="center">총계</td>
            <td colspan="2" align="center"></td>
        </tr>
    </table>

</body>

</html>
