<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>견적서</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            border: 2px solid #ccc;
            padding: 20px;
            border-radius: 10px;
        }

        label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        input[type="file"] {
            width: 300px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 8px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group::after {
            content: "";
            display: block;
            clear: both;
        }
        
        .form-group label {
            float: left;
        }
        
        .form-group input {
            float: right;
        }
    </style>
</head>
<body>
    <h1>견적서</h1>

    <form method="post" action="#">
        <div class="form-group">
            <label for="est_no">견적서 코드:</label>
            <input type="text" id="est_no" name="est_no" required>
        </div>

        <div class="form-group">
            <label for="sys_regdate">등록일자:</label>
            <input type="date" id="sys_regdate" name="sys_regdate" required>
        </div>

        <div class="form-group">
            <label for="emp_no">사원번호:</label>
            <input type="number" id="emp_no" name="emp_no" required>
        </div>

        <div class="form-group">
            <label for="fc_no">외화코드:</label>
            <input type="text" id="fc_no" name="fc_no" required>
        </div>

        <div class="form-group">
            <label for="amount">견적금액:</label>
            <input type="number" id="amount" name="amount" required>
        </div>

        <div class="form-group">
            <label for="progress">진행상태:</label>
            <input type="number" id="progress" name="progress" required>
        </div>

        <div class="form-group">
            <label for="enabled">사용구분:</label>
            <input type="text" id="enabled" name="enabled" required>
        </div>

        <div class="form-group">
            <label for="wh_no">창고코드(제품+업체):</label>
            <input type="text" id="wh_no" name="wh_no" required>
        </div>

        <div class="form-group">
            <label for="quantity">수량:</label>
            <input type="number" id="quantity" name="quantity" required>
        </div>

        <div class="form-group">
            <label for="sys_up">수정자:</label>
            <input type="text" id="sys_up" name="sys_up" required>
        </div>

        <div class="form-group">
            <label for="sys_updatedate">수정일:</label>
            <input type="date" id="sys_updatedate" name="sys_updatedate" required>
        </div>

        <div class="form-group">
            <label for="sys_reg">최초 등록자:</label>
            <input type="text" id="sys_reg" name="sys_reg" required>
        </div>

        <div class="form-group">
            <label for="files">첨부 파일:</label>
            <input type="file" id="files" name="files" required>
        </div>

        <input type="submit" value="견적서 생성">
    </form>
</body>
</html>
