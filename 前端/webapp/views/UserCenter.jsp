<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            display: flex;
            margin: 0;
            background-color: #f4f4f4;
            height: 100vh;
        }
        .sidebar {
            width: 10%;
            background-color: #333;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 2% 0;
        }
        .sidebar img {
            border-radius: 50%;
            width: 40%;
            height: auto;
        }
        .sidebar h2 {
            margin: 5% 0;
            font-weight: 400;
        }
        .sidebar a {
            text-decoration: none;
            color: #fff;
            margin: 5% 0;
            padding: 2% 5%;
            width: 90%;
            text-align: center;
            display: block;
            border-radius: 4px;
            cursor: pointer;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .sidebar .back-button {
            background-color: #007BFF;
            color: white;
            padding: 2% 5%;
            margin-top: auto;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
        }
        .sidebar .back-button:hover {
            background-color: #0056b3;
        }
        .content {
            flex: 1;
            padding: 2%;
        }
        .content h1 {
            font-size: 2em;
            font-weight: 500;
        }
        .content p {
            font-size: 1em;
            font-weight: 300;
        }
        #info {
            margin-top: 20px;
        }
    </style>
    <script>
        function loadContent(page) {
            const xhr = new XMLHttpRequest();
            xhr.open('GET', page + '.jsp', true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById('main-content').innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }

        function loadPersonalInfo() {
            const name = '<%= session.getAttribute("username") %>';
            console.log(name);
            fetchUserInfo(name);
        }

        function fetchUserInfo(name) {
            // 发送 AJAX 请求到 Servlet 获取个人信息
            fetch('${pageContext.request.contextPath}/GetUserDetailServlet?name=' + name)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log("电话："+data.telnumber);
                    displayUserInfo(data);
                })
                .catch(error => console.error('Error fetching user information:', error));
        }

        function displayUserInfo(userInfo) {
            // 将获取的用户信息显示在页面上
            const infoDiv = document.getElementById('info');
            console.log(userInfo.telnumber);
            infoDiv.innerHTML = '<p>姓名：' + userInfo.name + '</p>' +
                                '<p>性别：' + userInfo.gender + '</p>' +
                                '<p>邮箱：' + userInfo.email + '</p>' +
                                '<button id="editInfoButton">修改信息</button>';

            // 添加事件监听器
            document.getElementById('editInfoButton').addEventListener('click', editInfo);
        }

        function editInfo() {
            // 跳转到修改页面
            window.location.href = '${pageContext.request.contextPath}/views/EditUserInfo.jsp';
        }

        function loadReservations() {
            const id = '<%= session.getAttribute("userid") %>';
            fetchUserReservations(id);
        }

        function fetchUserReservations(id) {
            // 发送 AJAX 请求到 Servlet 获取预约信息
            fetch('${pageContext.request.contextPath}/GetUserReservationsServlet?userid=' + id)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                	console.log('Reservations fetched:', data); 
                    displayReservations(data);
                })
                .catch(error => console.error('Error fetching user reservations:', error));
        }

        function displayReservations(reservations) {
            // 将获取的预约信息显示在页面上
            const mainContentDiv = document.getElementById('main-content');
            let htmlContent = '<h1>我的预约</h1><ul>';
            reservations.forEach(reservation => {
                htmlContent += '<li>预约时间：' + reservation.date + '，地点：' + reservation.name + '</li>';
            });
            htmlContent += '</ul>';
            mainContentDiv.innerHTML = htmlContent;
        }

    </script>
</head>
<body>
    <div class="sidebar">
    <% 
        // 从 session 中获取用户名
        String username = (String) session.getAttribute("username");
        if (username != null) {
    %>
        <p>当前用户名： <%= username %> </p>
    <% } else { %>
        <p>未登录</p>
    <% } %>
        <a onclick="loadReservations()">我的预约</a>
        <a onclick="loadPersonalInfo()">个人信息</a>
        <a onclick="loadContent('OrderHistory')">订单历史</a>
        <button class="back-button" onclick="window.location.href='${pageContext.request.contextPath}/views/WelcomeView.jsp'">返回主页</button>
    </div>
    <div class="content" id="main-content">
        <h1>欢迎来到个人中心</h1>
        <p>在这里您可以查看和管理您的个人信息、预约记录、消息等。</p>
        <div id="info"></div>
    </div>
</body>
</html>
