<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>상품 주문서</title>
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
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        th {
            text-align: left;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button[type="submit"] {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h1>상품 주문서</h1>
    <form>
        <table>
            <tr>
                <th>고객명:</th>
                <td style="width:60%";><input type="text" name="customerName" required></td>
            </tr>
            <tr>
                <th>배송주소:</th>
                <td><input type="text" name="shippingAddress" required></td>
            </tr>
            <tr>
                <th>상품:</th>
                <td>
                    <select name="product" required>
                        <option value="">-- 선택 --</option>
                        <option value="productA">상품A</option>
                        <option value="productB">상품B</option>
                        <option value="productC">상품C</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>수량:</th>
                <td><input type="number" name="quantity" required></td>
            </tr>
        </table>

        <button type="submit">주문하기</button>
    </form>
</body>
</html>
