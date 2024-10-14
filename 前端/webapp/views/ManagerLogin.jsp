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



        .container {
		    max-width: 600px;
		    width: 100%;
		    background-color: rgba(255, 255, 255, 0.9);
		    border-radius: 5px;
		    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
		    overflow: hidden;
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

    <div class="container">

        <div class="form-container" id="loginForm">
            <h2>登录</h2>
            <form action="${pageContext.request.contextPath}/ManagerLoginServlet" method="get">
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
        
        
        
    </div>

    <script>
        function showLoginForm() {
            document.getElementById("loginForm").style.display = "block";
            document.getElementById("registerForm").style.display = "none";
            document.getElementById("registerManagerForm").style.display = "none";
            document.querySelectorAll(".tab").forEach(tab => tab.classList.remove("active"));
            document.querySelector(".tab:nth-child(1)").classList.add("active");
        }


    </script>
</body>
</html>
