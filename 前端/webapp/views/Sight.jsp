<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sight Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .topbar {
            height: 50px;
            width: 100%;
            position: sticky;
            top: 0;
            left: 0;
            background-color: #fff;
            padding-top: 20px;
            text-align: center;
            color: #000;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .topbar a {
            display: block;
            padding: 10px;
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
        
        .image-gallery {
            width: 100%;
            height: 400px;
            overflow: hidden;
            position: relative;
        }
        
        .image-gallery img {
            width: 100%;
            height: 160%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .artistic-text {
            position: absolute;
            width: 10%; /* 减小艺术字 */
            height: auto;
            bottom: 20px; /* 调整位置 */
            left: 50%;
            transform: translateX(-50%);
        }
        
        .tabs {
            display: flex;
            justify-content: center;
            background-color: #f8f8f8;
            border-bottom: 1px solid #ccc;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .tab {
            flex: 0 0 15%;
            padding: 10px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s, border-bottom 0.3s;
            border-right: 1px solid #ccc;
        }
        
        .tab:last-child {
            border-right: none;
        }
        
        .tab.active {
            background-color: white;
            border-bottom: 2px solid #d2b48c;
        }
        
        .tab:hover {
            background-color: #e7e7e7;
        }
        
        .tab-content {
            display: none;
            padding: 20px;
            text-align: center;
            border: 1px solid #ccc;
            margin-top: 20px;
        }
        
        .tab-content.active {
            display: block;
        }
        
        .video-container {
            text-align: center;
            margin-top: 20px;
        }
        
        #appointmentForm {
		    display: none;
		    margin: 20px auto;
		    padding: 20px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    background-color: #f9f9f9;
		    max-width: 400px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		
		#appointmentForm label {
		    display: block;
		    margin-bottom: 10px;
		    font-weight: bold;
		}
		
		#appointmentForm select {
		    width: 100%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		}
		
		#appointmentForm button {
		    display: block;
		    width: 100%;
		    padding: 10px;
		    background-color: #4CAF50;
		    color: white;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 16px;
		}
		
		#appointmentForm button:hover {
		    background-color: #45a049;
		}

    </style>
    <script>
        window.onload = function() {
            const spotId = '<%= request.getParameter("spotId") %>';
            console.log("Spot ID from request:", spotId);
            if (spotId && spotId !== "") {
                fetchSightDetail(spotId);
                fetchSightImageAndVideo(spotId);
            } else {
                console.error("Invalid spotId");
            }
            setupTabs();
        };

        function fetchSightDetail(spotId) {
            const url = '${pageContext.request.contextPath}/SightDetailServlet?id=' + encodeURIComponent(spotId);
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    displaySightDetail(data);
                })
                .catch(error => console.error('Error fetching sight detail:', error));
        }

        function fetchSightImageAndVideo(spotId){
            const url = '${pageContext.request.contextPath}/SightImgVideoServlet?id=' + encodeURIComponent(spotId);
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    displaySightImageAndVideo(data);
                })
                .catch(error => console.error('Error fetching sight detail:', error));
        }

        function displaySightImageAndVideo(sight_detail){
            const imageGallery = document.getElementById('imageGallery');
            const videoContainer = document.getElementById('videoContainer');
            
            // 添加视频
            const videoPath = sight_detail[0].video;
            const video = document.createElement('video');
            video.controls = true;
            const source = document.createElement('source');
            source.src = '${pageContext.request.contextPath}'+videoPath;
            source.type = 'video/mp4';
            video.appendChild(source);
            videoContainer.appendChild(video);
            
            const image = document.createElement('img');
            image.src = '${pageContext.request.contextPath}'+sight_detail[0].image;
            image.alt = 'Sight Image';
            imageGallery.appendChild(image);
            
            // 添加中文艺术字图
            const artisticText = document.createElement('img');
            artisticText.src = '${pageContext.request.contextPath}'+sight_detail[1].image;
            artisticText.alt = 'Artistic Text';
            artisticText.className = 'artistic-text';
            imageGallery.appendChild(artisticText);
        }

        function displaySightDetail(sight) {
            const spotId = '<%= request.getParameter("spotId") %>';
            if (sight) {
                document.getElementById('overview').innerHTML = '<p>' + sight.explain + '</p>';
                fetchFacilitiesAndCrowd(spotId);
            } else {
                document.getElementById('overview').innerHTML = '<p>No sight details found.</p>';
            }
        }

        function fetchFacilitiesAndCrowd(spotId) {
            const url = '${pageContext.request.contextPath}/FacilitiesCrowdServlet?id=' + encodeURIComponent(spotId);
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    displayFacilitiesAndCrowd(data);
                })
                .catch(error => console.error('Error fetching facilities and crowd details:', error));
        }

        function bookAppointment() {
            const appointmentForm = document.getElementById('appointmentForm');
            const appointmentTab = document.getElementById('appointment');
            
            // 隐藏其他选项内容
            const tabContents = document.querySelectorAll('.tab-content');
            tabContents.forEach(content => content.classList.remove('active'));

            // 显示预约选项内容
            appointmentTab.classList.add('active');
            appointmentForm.style.display = 'block';
        }

        function submitBooking() {
            const spotId = '<%= request.getParameter("spotId") %>';
            if (spotId && spotId !== "") {
                const userName = '<%= session.getAttribute("username") %>';
                if (userName != null) {
                    const year = document.getElementById('year').value;
                    const month = document.getElementById('month').value;
                    const day = document.getElementById('day').value;
                    const time = "20"+year + "-" + month + "-" + day;

                    const url = '${pageContext.request.contextPath}/BookServlet?id=' + encodeURIComponent(spotId) + '&username=' + encodeURIComponent(userName) + '&time=' + encodeURIComponent(time);
                    window.location.href = url;
                } else {
                    console.error("User ID not found in session");
                }
            } else {
                console.error("Invalid spotId");
            }
        }

        function setupTabs() {
            const tabs = document.querySelectorAll('.tab');
            const tabContents = document.querySelectorAll('.tab-content');

            tabs.forEach((tab, index) => {
                tab.addEventListener('click', () => {
                    tabs.forEach(tab => tab.classList.remove('active'));
                    tabContents.forEach(content => content.classList.remove('active'));

                    tab.classList.add('active');
                    tabContents[index].classList.add('active');
                });
            });
        }

        function displayFacilitiesAndCrowd(data) {
            const facilitiesContainer = document.getElementById('facilities');
            if (data && data.length > 0) {
                facilitiesContainer.innerHTML = '';
                data.forEach(item => {
                    const paragraph = document.createElement('p');
                    paragraph.innerHTML = '<strong>' + item.name + '</strong>: ' + item.explain;
                    facilitiesContainer.appendChild(paragraph);
                });
            } else {
                facilitiesContainer.innerHTML = '<p>No facilities and crowd details found.</p>';
            }
        }
    </script>
</head>
<body>
    <div class="topbar">
        <a href="${pageContext.request.contextPath}/views/WelcomeView.jsp">首页</a>
        <a href="#" onclick="openNav()">地图导览</a>
        <a href="${pageContext.request.contextPath}/views/UserCenter.jsp">用户中心</a>
    </div>
    <div class="image-gallery" id="imageGallery"></div>

    <div class="tabs">
        <div class="tab active">概述</div>
        <div class="tab">设施</div>
        <div class="tab" onclick="bookAppointment()">预约</div>
        <div class="tab">视频</div>
    </div>

    <div id="overview" class="tab-content active"></div>
    <div id="facilities" class="tab-content"></div>
    <div id="appointment" class="tab-content">
    <div id="appointmentForm" style="display: none;">
        <label for="year">年:</label>
        <select id="year">
            <option value="24">24</option>
        </select>

        <label for="month">月:</label>
        <select id="month">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
        </select>

        <label for="day">日:</label>
        <select id="day">
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
        </select>

        <button onclick="submitBooking()">Submit</button>
    </div>
    
    </div>
    <div id="videoContainer" class="tab-content"></div>

    
</body>
</html>
