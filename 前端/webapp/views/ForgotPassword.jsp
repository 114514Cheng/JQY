<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('#userForm').submit(function(event) {
        event.preventDefault(); // 阻止表单的默认提交行为

        $.ajax({
            url: '${pageContext.request.contextPath}/GetUserDetailServlet',
            type: 'POST',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(response) {
                if (response) {
                    alert('密码修改成功');
                } else {
                    alert('密码修改失败，请检查输入信息');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('请求失败，请稍后再试');
            }
        });
    });
});
</script>
</head>
<body>
<div class="background"></div>
<div class="topbar">
	<a href="${pageContext.request.contextPath}/views/WelcomeView.jsp">首页</a>
    <a href="#" onclick="openNav()">地图导览</a>
    <a href="${pageContext.request.contextPath}/views/UserCenter.jsp">用户中心</a>
</div>
<!-- 输入用户名表单 -->
<div class="container">
		<div class="form-container" id="forgetForm">
            <h2>忘记密码</h2>
            <form id="userForm">
                用户名: <input type="text" id="username" name="name" required><br>
			  请输入您的邮箱: <input type="email" id="email" name="email" required><br>
			  请输入您的电话: <input type="text" id="phone" name="phone" required><br>
			  请输入您的新密码: <input type="password" id="newPassword" name="newPassword" required><br>
			  请输入您的新密码(二次确认): <input type="password" id="newPasswordSec" name="newPasswordSec" required><br>
			  <input type="submit" value="确认修改">
            </form>
        </div>

</div>
</body>
</html>
