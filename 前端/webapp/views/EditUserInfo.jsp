<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改信息</title>
    <style>
        .form-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-container input[type="password"],
        .form-container input[type="email"],
        .form-container input[type="text"],
        .form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>修改信息</h2>
        <form action="${pageContext.request.contextPath}/AlterServlet" method="post">     
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="email">邮箱:</label>
            <input type="email" id="email" name="email" required>
            
            
            <label for="gender">性别:</label>
            <select id="gender" name="gender" required>
                <option value="male">男</option>
                <option value="female">女</option>
                <option value="other">其他</option>
                <option value="prefer_not_to_say">不愿透露</option>
            </select>
            
            <!-- 隐藏的输入组件 -->
            <input type="hidden" id="username" name="username" value="<%= (String) session.getAttribute("username") %>">
            
            <input type="submit" value="提交">
        </form>
    </div>
</body>
</html>
