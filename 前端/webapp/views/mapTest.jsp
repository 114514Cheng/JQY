<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>景区地图测试</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
        /* 侧边栏样式 */
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

        /* 主体内容 */
        .main-content {
            margin-right: 40px; /* 预留空间给侧边栏按钮 */
        }

        /* 呼出侧边栏按钮 */
        .openbtn {
            font-size: 20px;
            cursor: pointer;
            background-color: #111;
            color: white;
            padding: 10px 15px;
            border: none;
            position: fixed;
            top: 20px;
            right: 60px;
            z-index: 2;
        }
    </style>
</head>
<body>
    <!-- 呼出侧边栏按钮 -->
    <button class="openbtn" onclick="openNav()">☰ 打开地图</button>

    <!-- 主要内容区域 -->
    <div class="main-content">
        <h2>Leaflet.js 景区地图测试</h2>
    </div>

    <!-- 侧边栏 -->
    <div id="mySidebar" class="sidebar">
        <!-- 关闭侧边栏按钮 -->
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <!-- 地图容器 -->
        <div id="map"></div>
    </div>

    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
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
