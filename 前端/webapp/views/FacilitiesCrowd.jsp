<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Facilities List</title>
</head>
<body>
    <h2>Facilities List</h2>
    <ul id="facilitiesList">
        <!-- Facilities will be displayed here -->
    </ul>

    <script>
        window.onload = function() {
            const spotId = '<%= request.getParameter("spotId") %>';
            if (spotId && spotId !== "") {
                fetchFacilities(spotId);
            } else {
                console.error("Invalid spotId");
            }
        };

        function fetchFacilities(spotId) {
            const url = '${pageContext.request.contextPath}/FacilitiesCrowdServlet?id=' + encodeURIComponent(spotId);
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                	console.log(data);
                    displayFacilities(data);
                })
                .catch(error => console.error('Error fetching facilities:', error));
        }

        function displayFacilities(facilities) {
            const facilitiesList = document.getElementById('facilitiesList');
            if (facilities && facilities.length > 0) {
                facilitiesList.innerHTML = ''; // Clear previous content
                facilities.forEach(facility => {
                    const listItem = document.createElement('li');
                    //console.log(facility.name);
                    //console.log(facility.explain);
                    listItem.innerText = facility.name + "\n" + facility.explain;

                    facilitiesList.appendChild(listItem);
                });
            } else {
                facilitiesList.innerHTML = '<li>No facilities found.</li>';
            }
        }
    </script>
</body>
</html>
