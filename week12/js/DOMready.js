document.addEventListener("DOMContentLoaded", function(event) {
    //do work

    //youbike data
    var youbikeDOM = document.getElementById("youbike-data")
    youbike=JSON.parse(youbikeDOM.textContent);

    circlemarkers0=[youbike[0].lat,youbike[0].lng]
    circlemarkers1=[youbike[1].lat,youbike[1].lng]

    // for (let n=0 ; n<2408;n++){
    //     circlemarker=[youbike[n].lat,youbike[n].lng]
    //     leaflet.circlemarkers=
    //     L.circle(circlemarker,{radius: 5}).addTo(leaflet.map);
    // }


    //prepare default map
    
    currentLocation = [25.05, 121.5]
    prepareBaseMap(currentLocation);
    
    //get current location and update map
    navigator.geolocation
        .getCurrentPosition(successCallback, errorCallback)
        
    //youbike data
    // var youbikeDOM = document.getElementById("youbike-data")
    // youbike=JSON.parse(youbikeDOM.textContent);
    // leaflet.data = JSON.parse(youbikeDOM.textContent);

    //prepare circleMarkers
    // circlemarkers=[youbike[0].lat,youbike[0].lng]
    
})



