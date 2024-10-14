<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
<%

    // 检查是否有管理员的登录信息
    if (session == null || session.getAttribute("adminUser") == null) {
        // 如果未登录，重定向到 Login.jsp
        response.sendRedirect("ManagerLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员后台</title>
    <style>
        body {
		    margin: 0; /* 移除默认外边距 */
		    padding: 0; /* 移除默认内边距 */
		    background-color: #f0f0f0; /* 背景颜色 */
		}
		
		.container {
		    max-width: 1500px; /* 设置最大宽度 */
		    margin: 0 auto; /* 居中显示 */
		    padding: 20px; /* 内边距 */
		    background-color: white; /* 背景颜色 */
		    border-radius: 8px; /* 圆角边框 */
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 阴影效果 */
		}
        .user-item {
		    display: flex;
		    justify-content: space-between;
		    padding: 10px;
		    border-bottom: 1px solid #ccc;
		}

		.username {
		    font-weight: bold;
		}

		button {
		    margin-left: 10px;
		}
        /* 选项卡导航样式 */
        .tab {
            overflow: hidden;
            border-bottom: 1px solid #ccc;
            background-color: #f1f1f1;
        }
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
        }
        .tab button:hover {
            background-color: #ddd;
        }
        .tab button.active {
            background-color: #ccc;
        }
        /* 选项卡内容样式 */
        .tabcontent {
            display: none;
            padding: 16px;
            border: 1px solid #ccc;
            border-top: none;
        }
		
		
		button {
		    margin-top: 10px;
		    padding: 5px 10px;
		    background-color: #007BFF;
		    color: white;
		    border: none;
		    cursor: pointer;
		}
		
		button:hover {
		    background-color: #0056b3;
		}

		
		.sight-name {
		    font-size: 1.2em;
		    font-weight: bold;
		    margin-bottom: 5px;
		}
		
		.sight-exp {
		    margin-bottom: 8px;
		}
		
		.sight-facilities div {
		    margin-bottom: 5px;
		}
		
		.sight-item {
		    margin-bottom: 20px;
		    padding: 15px; /* 内边距 */
		    border: 1px solid #e0e0e0; /* 边框 */
		    border-radius: 8px; /* 圆角 */
		    background-color: #fafafa; /* 背景颜色 */
		}
		
		.edit-button, .save-button {
		    padding: 10px 20px;
		    border-radius: 20px; /* 圆角 */
		    font-size: 16px; /* 加大尺寸 */
		    color: white;
		    background-color: green; /* 绿色 */
		    border: none;
		    cursor: pointer;
		    margin: 10px;
		}
		
		.edit-button:hover, .save-button:hover {
		    background-color: #006400; /* hover 时的更深绿色 */
		}
		
		.tabs {
		    background: linear-gradient(to right, #006666, #33cccc); /* 蓝绿色渐变 */
		    padding: 10px;
		    color: white;
		    border-radius: 8px; /* 圆角 */
		}
		
		.tabs a {
		    color: white;
		}

    </style>
</head>
<body>
<div class="container">
<h2>管理员后台管理系统</h2>

<!-- 选项卡导航 -->
<div class="tabs">
	<button class="tablinks" onclick="openTab(event, 'CustomerFlow')">客流量预览</button>
    <button class="tablinks" onclick="openTab(event, 'UserManagement');getUsers();" id="defaultOpen">用户管理</button>
    <button class="tablinks" onclick="openTab(event, 'ReservationManagement');getRes();">预约管理</button>
    <button class="tablinks" onclick="openTab(event, 'SightManagement');getSights();">景点管理</button>
</div>

<div id="CustomerFlow" class="tabcontent">
    <h3>客流量预览</h3>
    <p>这里可以插入客流量的折线图</p>
</div>

<!-- 用户管理选项卡内容 -->
<div id="UserManagement" class="tabcontent">
    <h3>用户管理</h3>
    <div id="UserContainer">
    
    </div>
</div>

<!-- 预约管理选项卡内容 -->
<div id="ReservationManagement" class="tabcontent">
    <h3>预约管理</h3>
    <table id="ReservationTable" style="width: 100%; border-collapse: collapse;">
        <thead>
            <tr>
                <th>预约人</th>
                <th>预约地点</th>
                <th>预约时间</th>
                <th>是否过期</th>
            </tr>
        </thead>
        <tbody id="ReservationContainer">
            <!-- 预约信息将通过 JavaScript 填充到这里 -->
        </tbody>
    </table>
</div>

<!-- 景点管理选项卡内容 -->
<div id="SightManagement" class="tabcontent">
    <h3>景点管理</h3>
    <div id="SightContainer">
        <!-- 动态生成的景点管理条目将放在这里 -->
    </div>
</div>
</div>

<script>
    // 打开选项卡函数
    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;
        
        // 隐藏所有的 tabcontent
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        
        // 清除所有的 tablinks 的 active 样式
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        
        // 显示当前点击的 tabcontent，并设置按钮为 active
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }
    
    // 默认打开第一个选项卡
    document.getElementById("defaultOpen").click();
    
    function getUsers(){
    	const url = '${pageContext.request.contextPath}/GetUsersServlet';
    	fetch(url)
    		.then(response =>{
    			if(!response.ok){
    				throw new Error('Network response was not ok ' + response.statusText);
    			}
    			console.log(response.json);
    			return response.json();
    		})
    		.then(data=>{
    			displayUsers(data);
    		})
    		.catch(error => console.error('Error', error));
    }
    
    function displayUsers(users){
    	const userContainer = document.getElementById("UserContainer");
    	userContainer.innerHTML = '';
    	users.forEach(user=>{
    		const userItem = document.createElement('div');
    		userItem.classList.add('user-item');
    		
            const username = document.createElement('span');
            username.classList.add('username');
            username.textContent = user.name;

            const unbanButton = document.createElement('button');
            unbanButton.textContent = '解封';
            unbanButton.onclick = function() {
                // 调用解封用户的函数
                unbanUser(user.id); // 假设 User 对象有 id 属性
            };

            const banButton = document.createElement('button');
            banButton.textContent = '封禁';
            banButton.onclick = function() {
                // 调用封禁用户的函数
                banUser(user.id); // 假设 User 对象有 id 属性
            };

            // 将用户名和按钮添加到用户条目中
            userItem.appendChild(username);
            userItem.appendChild(unbanButton);
            userItem.appendChild(banButton);

            // 将用户条目添加到用户容器中
            userContainer.appendChild(userItem);
    	})
    }
    
    function banUser(userId) {
        const url = '${pageContext.request.contextPath}/BanUserServlet?id=' + encodeURIComponent(userId);
        console.log("userid:"+userId);
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok: ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                if (data) {
                    alert('用户已成功封禁。'); 
                } else {
                    alert('封禁用户失败。');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('发生错误：' + error.message); // 网络错误提示
            });
    }

    
    function unbanUser(userId){
    	const url = '${pageContext.request.contextPath}/UnBanUserServlet?id='+ encodeURIComponent(userId);
    	console.log("userid:"+userId);
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok: ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                if (data) {
                    alert('用户已成功解封。'); 
                } else {
                    alert('解封用户失败。');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('发生错误：' + error.message); // 网络错误提示
            });
    }
    
    function getRes(){
    	const url = '${pageContext.request.contextPath}/GetAllResServlet';
    	fetch(url)
    		.then(response=>{
    			if(!response.ok){
    				throw new Error('Network response was not ok ' + response.statusText);
    			}
    			console.log(response.json);
    			return response.json();
    		})
    		.then(data=>{
    			console.log(JSON.stringify(data, null, 2)); // 美化输出 JSON 数据的详细信息
    			displayRes(data);
    		})
    		.catch(error => console.error('Error', error));
    }
    
    function displayRes(res) {
        const resContainer = document.getElementById("ReservationContainer");
        resContainer.innerHTML = ''; // 清空容器内容

        res.forEach(re => {
        	console.log("time:"+re.date);
        	console.log("username"+re.userName);
        	console.log("sightname"+re.sightName);
            const resItem = document.createElement('tr'); // 使用表格行

            // 创建显示预约人的单元格
            const usernameCell = document.createElement('td');
            usernameCell.textContent = re.userName; // 使用预约人的用户名

            // 创建显示预约地点的单元格
            const attractionCell = document.createElement('td');
            attractionCell.textContent = re.sightName; // 显示预约地点

            // 创建显示预约时间的单元格
            const reservationTimeCell = document.createElement('td');
            reservationTimeCell.textContent = re.date; // 格式化预约时间

            // 创建显示是否过期的单元格
            const expiredStatusCell = document.createElement('td');
            expiredStatusCell.textContent = re.down; // 显示过期状态

            // 将所有单元格添加到表格行中
            resItem.appendChild(usernameCell);
            resItem.appendChild(attractionCell);
            resItem.appendChild(reservationTimeCell);
            resItem.appendChild(expiredStatusCell);

            // 将表格行添加到容器中
            resContainer.appendChild(resItem);
        });
    }

    function getSights(){
    	const url = '${pageContext.request.contextPath}/GetSightsServlet';
    	fetch(url)
    		.then(response=>{
    			if(!response.ok){
    				throw new Error('Network response was not ok ' + response.statusText);
    			}
    			return response.json();
    		})
    		.then(data=>{
    			displaySights(data);
    		})
    		.catch(error => console.error('Error', error));
    }
    
    function displaySights(sights) {
        const sightContainer = document.getElementById("SightContainer");
        sightContainer.innerHTML = '';

        sights.forEach(sight => {
            const sightItem = document.createElement('div');
            sightItem.classList.add('sight-item');

            // 景区名称
            const sightName = document.createElement('div');
            const sightNameInput = document.createElement('input');
            sightNameInput.type = 'text';
            sightNameInput.value = sight.name;
            sightNameInput.disabled = true; // 默认不可编辑
            sightName.appendChild(sightNameInput);

            // 景区简介
            const sightExp = document.createElement('div');
            const sightExpDiv = document.createElement('div');
            
            const sightExpBefore = sight.explain; // 保存原来的简介
            
            sightExpDiv.textContent = sight.explain;
            sightExpDiv.contentEditable = false; // 默认不可编辑
            sightExp.appendChild(sightExpDiv);

            // 设施信息
            const sightFacilities = document.createElement('div');
            const facilityExplains = [];
            sight.facilities.forEach(facility => {
                const facilityItem = document.createElement('div');

                const facilityName = document.createElement('strong');
                facilityName.textContent = facility.name; // 设施名称加粗

                const facilityExplain = document.createElement('div');
                facilityExplain.textContent = facility.explain;
                facilityExplain.contentEditable = false; // 默认不可编辑
                facilityExplains.push(facility.explain);
                facilityItem.appendChild(facilityName);
                facilityItem.appendChild(facilityExplain);

                sightFacilities.appendChild(facilityItem);
            });

            // 修改按钮
            const editButton = document.createElement('button');
            editButton.textContent = '修改';
            editButton.classList.add('edit-button');
            editButton.onclick = function () {
                // 使景区名称、简介、设施信息可编辑
                sightNameInput.disabled = false;
                sightExpDiv.contentEditable = true;
                sightFacilities.querySelectorAll('div[contenteditable]').forEach(div => div.contentEditable = true);

                // 显示保存按钮
                saveButton.style.display = 'inline-block';
            };

            // 保存按钮
            const saveButton = document.createElement('button');
            const saveUrl = '${pageContext.request.contextPath}/SaveSightServlet';
            
            saveButton.textContent = '保存';
            saveButton.classList.add('save-button');
            saveButton.style.display = 'none'; // 初始隐藏
            saveButton.onclick = function () {
                // 点击保存按钮时，关闭编辑状态
                sightNameInput.disabled = true;
                sightExpDiv.contentEditable = false;
                sightFacilities.querySelectorAll('div[contenteditable]').forEach(div => div.contentEditable = false);
                
                // 保存数据逻辑
                if(sightExpDiv.textContent != sightExpBefore) {
                    const updatedSight = {
                        id: sight.id,
                        name: sightNameInput.value,
                        explains: sightExpDiv.textContent
                    };
                    
                    fetch(saveUrl, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(updatedSight)// 将对象转换为 JSON 字符串
                    })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('网络响应不正常: ' + response.statusText);
                        }
                        return response.json();
                    })
                    .then(data => {
                        console.log("保存成功:", data); 
                        sightExpBefore = sightExpDiv.textContent;
                    })
                    .catch(error => console.error('保存出错:', error));
                }
                
                const updatedFacilityExplains = [];
                const saveFacilityUrl = '${pageContext.request.contextPath}/SaveFacilityServlet';
                sightFacilities.querySelectorAll('div[contenteditable]').forEach((div, index) => {
                    updatedFacilityExplains.push(div.textContent); // 收集每个设施的最新内容
                });
                
                sight.facilities.forEach(facility=>{
                	const i = 0;
                	if(facility.explains!=updatedFacilityExplains[i]){
                		const updatedFacility = {
                                id: facility.id,
                                name: facility.name,
                                explains: updatedFacilityExplains[i]
                            };
                		fetch(saveFacilityUrl, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(updatedFacility)// 将对象转换为 JSON 字符串
                        })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('网络响应不正常: ' + response.statusText);
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log("保存成功:", data); 
                        })
                        .catch(error => console.error('保存出错:', error));
                	}
                	i++;
                })

                saveButton.style.display = 'none'; // 保存后隐藏按钮
            }; // 这里补上缺少的闭合括号

            // 将元素添加到景区条目中
            sightItem.appendChild(sightName);
            sightItem.appendChild(sightExp);
            sightItem.appendChild(sightFacilities);
            sightItem.appendChild(editButton);
            sightItem.appendChild(saveButton);

            sightContainer.appendChild(sightItem);
        });
    }




</script>

</body>
</html>
