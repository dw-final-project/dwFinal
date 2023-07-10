<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>출하지시서</title>
    <style>
        html {
        	text-size : 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            width: 65%;
        }
        h1 {
            text-align: center;
            color: #333;
            text-decoration: underline;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e6e6e6;
        }
        .close-button {
            text-align: center;
            margin-top: 30px;
        }
        .close-button button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .close-button button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h1>출하지시서</h1>
    <table>
        <tr>
            <th>지시서 코드</th>
            <th>등록일자</th>
            <th>사원번호</th>
            <th>출하예정일</th>
            <th>진행 상태</th>
            <th>사용 구분</th>
            <th>제품 업체 코드</th>
            <th>출고량</th>
            <th>첨부 파일</th>
            <th>외화 코드</th>
            <th>수정자</th>
            <th>수정일</th>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>     
        <!-- 다른 주문 정보도 추가할 수 있습니다. -->
    </table>
    <div class="close-button">
        <button onclick="closeWindow()">닫기</button>
    </div>

    <script>
        function closeWindow() {
            window.close();
        }
    </script>
</body>
</html>
