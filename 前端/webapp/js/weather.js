document.addEventListener("DOMContentLoaded", function() {
    console.log("Weather script loaded");

    function fetchWeatherInfo() {
        fetch('${pageContext.request.contextPath}/api/webservice')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data);
                displayWeatherInfo(data);
            })
            .catch(error => {
                console.error('Error fetching weather info:', error);
                document.getElementById('weather').innerText = '无法获取天气信息';
            });
    }

    function displayWeatherInfo(weatherInfo) {
        const weatherElement = document.getElementById('weather');
        if (weatherInfo && weatherInfo.location && weatherInfo.Temperature && weatherInfo.condition) {
            weatherElement.innerText = `地点：${weatherInfo.location}，温度：${weatherInfo.Temperature}，天气状况：${weatherInfo.condition}`;
        } else {
            weatherElement.innerText = '无法获取天气信息';
        }
    }

    fetchWeatherInfo();
});
