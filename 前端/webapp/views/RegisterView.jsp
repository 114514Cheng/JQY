<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册表单</title>
    <link rel="stylesheet" href="RegisterCss.css">
</head>
<body>
    <div class="form-container">
        <h2>注册</h2>
        <form action="${pageContext.request.contextPath}/RegisterServlet" method="get">
            <label for="username">用户名:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="email">邮箱:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="telnumber">电话:</label>
            <input type="text" id="telnumber" name="telnumber" required>
            
            <label for="gender">性别:</label>
            <select id="gender" name="gender" required>
                <option value="male">男</option>
                <option value="female">女</option>
                <option value="other">其他</option>
                <option value="prefer_not_to_say">不愿透露</option>
            </select>
            
            <input type="submit" value="注册">
        </form>
    </div>
</body>
</html>
