<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录/注册页面</title>
    <style>
        body {
		    font-family: Arial, sans-serif;
		    background-color: #f4f4f4;
		    margin: 0;
		    padding: 0;
		    height: 100vh;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center; /* 添加这行 */
		}

        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('${pageContext.request.contextPath}/images/background.jpg');
            background-size: cover;
            background-position: center;
            z-index: -1;
        }

        .topbar {
            height: 40px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #fff;
            display: flex;
            justify-content: center; /* 居中对齐 */
            align-items: center; /* 垂直居中 */
            z-index: 10;
        }

        .topbar a {
            display: block;
            padding: 10px 15px; /* 调整内边距 */
            color: #000;
            text-decoration: none;
            transition: background-color 0.3s;
            line-height: 20px; /* 确保垂直居中 */
            margin: 0 10px; /* 间距 */
        }

        .topbar a:hover {
            background-color: #555;
            color: #fff;
            border-radius: 3px; /* 添加圆角，避免溢出 */
        }

        .container {
		    max-width: 600px;
		    width: 100%;
		    background-color: rgba(255, 255, 255, 0.9);
		    border-radius: 5px;
		    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
		    overflow: hidden;
		}

        .tabs {
            display: flex;
            justify-content: space-between;
        }

        .tab {
            flex: 1;
            text-align: center;
            padding: 15px 0;
            background-color: #D1D1D1;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
            position: relative;
            z-index: 1;
        }

        .tab.active {
            background-color: #BBB9B9;
            border-bottom: 2px solid #8B4513; /* 深棕色 */
        }

        .tab.active:before {
            content: "";
            position: absolute;
            bottom: -2px;
            left: 50%;
            width: 20px;
            height: 2px;
            background-color: #8B4513; /* 深棕色 */
            transform: translateX(-50%);
            z-index: -1;
        }

        .form-container {
            padding: 20px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #0077cc;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-container input[type="text"],
        .form-container input[type="password"],
        .form-container input[type="email"],
        .form-container select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-container input[type="submit"] {
            width: 100%;
            background-color: #add8e6; /* 淡蓝色 */
            color: #fff;
            border: none;
            border-radius: 3px;
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #005ea6;
        }

        .form-container select {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="background"></div>
    <div class="topbar">
	<a href="${pageContext.request.contextPath}/views/WelcomeView.jsp">首页</a>
    <a href="#" onclick="openNav()">地图导览</a>
    <a href="${pageContext.request.contextPath}/views/UserCenter.jsp">用户中心</a>
    </div>
    <div class="container">
        <div class="tabs">
            <div class="tab active" onclick="showLoginForm()">登录</div>
            <div class="tab" onclick="showRegisterForm()">注册</div>
            <div class="tab" onclick="showManagerRegisterForm()">管理员注册</div>
        </div>
        <div class="form-container" id="loginForm">
            <h2>登录</h2>
            <form action="${pageContext.request.contextPath}/LoginServlet" method="get">
                <label for="username">用户名:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">密码:</label>
                <input type="password" id="password" name="password" required>
                
                <input type="submit" value="登录">
            </form>
            <!-- 忘记密码按钮 -->
			<form action="ForgotPassword.jsp" method="get" style="margin-top: 10px;">
  				<input type="submit" value="忘记密码">
			</form>
        </div>
        <div class="form-container" id="registerForm" style="display: none;">
            <h2>注册</h2>
            <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
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
        
        <div class="form-container" id="registerManagerForm" style="display: none;">
            <h2>管理员注册</h2>
            <form action="${pageContext.request.contextPath}/ManagerRegisterServlet" method="post">
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
                
                <label for="innercode">管理员代码:</label>
                <input type="text" id="innercode" name="innercode" required>
                
                <input type="submit" value="注册">
            </form>
        </div>
    </div>

    <script>
        function showLoginForm() {
            document.getElementById("loginForm").style.display = "block";
            document.getElementById("registerForm").style.display = "none";
            document.getElementById("registerManagerForm").style.display = "none";
            document.querySelectorAll(".tab").forEach(tab => tab.classList.remove("active"));
            document.querySelector(".tab:nth-child(1)").classList.add("active");
        }

        function showRegisterForm() {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("registerForm").style.display = "block";
            document.getElementById("registerManagerForm").style.display = "none";
            document.querySelectorAll(".tab").forEach(tab => tab.classList.remove("active"));
            document.querySelector(".tab:nth-child(2)").classList.add("active");
        }
        
        function showManagerRegisterForm() {
        	document.getElementById("loginForm").style.display = "none";
            document.getElementById("registerForm").style.display = "none";
            document.getElementById("registerManagerForm").style.display = "block";
            document.querySelectorAll(".tab").forEach(tab => tab.classList.remove("active"));
            document.querySelector(".tab:nth-child(3)").classList.add("active");
        }
    </script>
</body>
</html>
