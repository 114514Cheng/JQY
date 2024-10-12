<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
    <h1>个人信息</h1>
    <div id="info">
        <%-- Placeholder for displaying user information --%>
    </div>
    <button onclick="editInfo()">修改信息</button>

    <script>
        window.onload = function() {
            // 页面加载完成后，发送 AJAX 请求获取个人信息
            const name = '<%= session.getAttribute("username") %>';
            fetchUserInfo(name);
        };

        function fetchUserInfo(name) {
            // 发送 AJAX 请求到 Servlet 获取个人信息
            fetch('${pageContext.request.contextPath}/GetUserDetailServlet?name'+name)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    displayUserInfo(data);
                })
                .catch(error => console.error('Error fetching user information:', error));
        }

        function displayUserInfo(userInfo) {
            // 将获取的用户信息显示在页面上
            const infoDiv = document.getElementById('info');
            console.log(userInfo.name);
            infoDiv.innerHTML = '<p>姓名：' + userInfo.name + '</p>' +
                                '<p>性别：' + userInfo.gender + '</p>' +
                                '<p>邮箱：' + userInfo.email + '</p>'+
                                '<p>电话：' + userInfo.telnumber + '</p>';
        }

        function editInfo() {
            // 跳转到修改页面
            window.location.href = '${pageContext.request.contextPath}/views/EditUserInfo.jsp';
        }
    </script>
</div>
