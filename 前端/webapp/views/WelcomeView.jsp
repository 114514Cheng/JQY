<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
        body, html {
		    margin: 0;
		    padding: 0;
		    width: 100%;
		    height: 100%;
		    font-family: Arial, sans-serif;
		}
		
		.topbar {
		    height: 70px;
		    width: 100%;
		    position: sticky;
		    top: 0;
		    left: 0;
		    background-color: #fff;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 0 20px;
		    border-bottom: 1px solid rgba(0, 0, 0, 0.1); /* 淡化边框，避免明显的分界线 */
		}
		
		.topbar-content {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-grow: 1;
		}
		
		.topbar a {
		    display: block;
		    padding: 10px 15px;
		    color: #000;
		    text-decoration: none;
		    transition: background-color 0.3s;
		    height: 100%;
		    line-height: 50px;
		    margin: 0 10px;
		}
		
		.topbar a:hover {
		    background-color: #555;
		    color: #fff;
		    border-radius: 3px;
		}
		
		.weather-info {
		    padding: 10px 20px;
		    color: #000;
		    white-space: nowrap;
		    text-align: right;
		}



        #slideshow {
		    width: 100%;
		    height: calc(75vh - 70px); /* Adjust to account for topbar height */
		    margin: 0 auto;
		    overflow: hidden;
		    position: relative;
		}
		
		#slideshow img {
		    width: 100%;
		    height: 100%;
		    position: absolute;
		    top: 0;
		    left: 0;
		    object-fit: cover;
		    object-position: center;
		    opacity: 0;
		    transition: opacity 1.5s linear;
		}
		
		#slideshow img.active {
		    opacity: 1;
		    transition: opacity 1.5s linear;
		}
		
		#slideshow img.activelogo {
		    width: 30%;
		    height: 15%;
		    position: absolute;
		    top: 30%;
		    left: 35%;
		    opacity: 1;
		    transition: opacity 1.5s linear, top 1.5s ease-in-out, left 1.5s ease-in-out; 
		}
		
		#slideshow img.nonactivelogo {
		    width:30%;
		    height:15%;
		    position: absolute;
		    top:100%;
		    left: 35%;
		    opacity: 0;
		    transition: opacity 1.5s linear, top 1.5s ease-in-out, left 1.5s ease-in-out; 
		}

        #slideshow p {
		    position: absolute;
		    bottom: 0;
		    left: 50px;
		    line-height: 30px;
		    padding: 5px 30px;
		    font-size: 20px;
		    color: white;
		    background-color: rgba(100, 100, 100, 0);
		    opacity: 0;
		    transition: all 1.5s;
		}
		
		#slideshow p.active {
		    bottom: 150px;
		    opacity: 1;
		}

        #weatherInfo {
            text-align: center;
            margin-top: 20px;
        }

        #map {
            height: 550px;
            width: 35%;
            margin: auto;
            margin-top: 20px;
        }

        .active {
            opacity: 1;
        }
        .activelogo{

        	opacity: 1;
        }
        .nonactivelogo{

        	opacity: 0;
        }
        
        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            right: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
            color: white;
        }

        .sidebar .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
            color: white;
        }

        #map {
            height: 800px;
            width: 100%; /* 设置地图宽度为100%以充满侧边栏 */
        }
    </style>
</head>
<body>

<div class="topbar">
    <div class="topbar-content">
        <a href="${pageContext.request.contextPath}/views/WelcomeView.jsp">首页</a>
        <a href="#" onclick="openNav()">地图导览</a>
        <a href="${pageContext.request.contextPath}/views/UserCenter.jsp">用户中心</a>
        <a href="${pageContext.request.contextPath}/views/Login.jsp">登录/注册</a>
    </div>
    <span id="weather" class="weather-info"></span>
</div>

<div id="slideshow">
    <a href="${pageContext.request.contextPath}/views/Sight.jsp?spotId=1">
        <img class="active" src="${pageContext.request.contextPath}/images/sight1.jpg" />
        <img class="activelogo" src="${pageContext.request.contextPath}/images/motianlingLogo.png">
    </a>
    <a href="${pageContext.request.contextPath}/views/Sight.jsp?spotId=2">
        <img  src="${pageContext.request.contextPath}/images/sight2.jpg" />
        <img  src="${pageContext.request.contextPath}/images/chengtoushanLogo.png">
    </a>
    <a href="${pageContext.request.contextPath}/views/Sight.jsp?spotId=3">
        <img  src="${pageContext.request.contextPath}/images/sight3.jpg" />
        <img  src="${pageContext.request.contextPath}/images/luofenggangLogo.png">
    </a>
</div>

<div id="mySidebar" class="sidebar">
        <!-- 关闭侧边栏按钮 -->
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <!-- 地图容器 -->
        <div id="map"></div>
</div>

<div id="weatherInfo">
    <p id="weather"></p>
</div>


<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/js/slide.js"></script>
<script>
    let map;
    document.addEventListener("DOMContentLoaded", function() {
        map = L.map('map').setView([37.4012, 122.6657], 14); // 使用你提供的经纬度和缩放级别

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 18,
            attribution: 'Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors'
        }).addTo(map);

        // 添加示例标记
        var marker = L.marker([37.4212, 122.6715]).addTo(map)
            .bindPopup('摩天岭生态区');
        var marker2 = L.marker([37.3947, 122.6981]).addTo(map)
            .bindPopup('成山头景区');
        var marker3 = L.marker([37.4171, 122.6286]).addTo(map)
            .bindPopup('神雕山自然保护区');
        var marker4 = L.marker([37.4049, 122.6419]).addTo(map)
            .bindPopup('红山生态区 竹林漫步');
        var marker5 = L.marker([37.3903, 122.6610]).addTo(map)
            .bindPopup('落凤岗村农家乐');

        // 添加景区边界矩形
        var bounds = [
            [37.4259, 122.6219],
            [37.3760, 122.7042]
        ];
        L.rectangle(bounds, {color: "rgb(255, 0, 0)", weight: 1, fill: false}).addTo(map);

        // 标记点击状态
        var clickedMarkers = {};

        // 监听标记点击事件
        marker.on('click', function(e) {
            if (!clickedMarkers['marker1']) {
                marker.bindPopup('摩天岭生态区').openPopup();
                clickedMarkers['marker1'] = true;
            } else {
                window.location.href = '${pageContext.request.contextPath}/views/Sight.jsp?spotId=1';
            }
        });

        marker2.on('click', function(e) {
            if (!clickedMarkers['marker2']) {
                marker2.bindPopup('成山头景区').openPopup();
                clickedMarkers['marker2'] = true;
            } else {
                window.location.href = '${pageContext.request.contextPath}/views/Sight.jsp?spotId=2';
            }
        });

        marker3.on('click', function(e) {
            if (!clickedMarkers['marker3']) {
                marker3.bindPopup('神雕山自然保护区').openPopup();
                clickedMarkers['marker3'] = true;
            } else {
                window.location.href = '${pageContext.request.contextPath}/views/Sight.jsp?spotId=3';
            }
        });

        marker4.on('click', function(e) {
            if (!clickedMarkers['marker4']) {
                marker4.bindPopup('红山生态区 竹林漫步').openPopup();
                clickedMarkers['marker4'] = true;
            } else {
                window.location.href = '${pageContext.request.contextPath}/views/Sight.jsp?spotId=4';
            }
        });

        marker5.on('click', function(e) {
            if (!clickedMarkers['marker5']) {
                marker5.bindPopup('落凤岗村农家乐').openPopup();
                clickedMarkers['marker5'] = true;
            } else {
                window.location.href = '${pageContext.request.contextPath}/views/Sight.jsp?spotId=5';
            }
        });
        
        fetchWeatherInfo();

        function fetchWeatherInfo() {
            fetch('${pageContext.request.contextPath}/api/webservice')
                .then(response => {
                    console.log('Received response:', response);
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Received data:', data);
                    displayWeatherInfo(data);
                })
                .catch(error => {
                    console.error('Error fetching weather info:', error);
                    document.getElementById('weather').innerText = '无法获取天气信息';
                });
        }

        function displayWeatherInfo(weatherInfo) {
            const weatherElement = document.getElementById('weather');
            console.log('Displaying weather info:', weatherInfo);
            if (weatherInfo && weatherInfo.location && weatherInfo.Temperature && weatherInfo.condition) {
                weatherElement.innerText = "地点：" + weatherInfo.location + "温度："+ weatherInfo.Temperature + " "+ "天气状况："+weatherInfo.condition+" "+"交通："+weatherInfo.traffic;
            } else {
                weatherElement.innerText = '无法获取天气信息';
            }
        }
    });

    /* 打开侧边栏 */
    function openNav() {
        document.getElementById("mySidebar").style.width = "40%";
        map.invalidateSize(); // 调整地图尺寸
    }

    /* 关闭侧边栏 */
    function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
    }

    /* 监听侧边栏打开事件 */
    document.querySelector('.sidebar').addEventListener('transitionend', function(event) {
        if (event.propertyName === 'width' && this.style.width !== '0px') {
            map.invalidateSize();
        }
    });
    </script>
</body>
</html>
