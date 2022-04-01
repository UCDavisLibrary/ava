---
layout: default
title: Explore the Data
nav_order: 11
---
## UC Davis AVA Data



<html>
<head>
<!--
<title>UC Davis Campus Cats Map</title>
-->
<!--Load the Leaflet CSS file-->
<link rel="stylesheet" href="{{ '/assets/vendor/leaflet/leaflet.css' | relative_url }}">
<!--Load the Leaflet JavaScript file-->
<script src="{{ '/assets/vendor/leaflet/leaflet.js' | relative_url }}"></script>
<script src="{{ '/assets/vendor/leaflet.markercluster/dist/leaflet.markercluster.js' | relative_url }}"></script>
<script src="{{ '/assets/vendor/leaflet.edgebuffer/src/leaflet.edgebuffer.js' | relative_url }}"></script>
<script src="{{ '/assets/js/campus_cats.js' | relative_url }}"></script>
<script src="{{ '/assets/plugins/hash/hash.js' | relative_url }}"></script>
</head>
<body>

<!--
<h1>UC Davis Campus Cats Map</h1>
<p>This webmap shows the locations of UC Davis campus community cats.</p>
-->
<div class="map" id="mapid" style="width: 600px; height: 400px;"></div>
<script src="{{ '/assets/js/campus_cats.js' | relative_url }}"></script>
<script>
//add an empty map called "catmap" to the page in the mapid div
var catmap = L.map('mapid', {
center: [38.538592, -121.75],
zoom: 15
});
//add the base map = Stamen Toner tile layer
var Stamen_Toner = L.tileLayer('https://stamen-tiles-{s}.a.ssl.fastly.net/toner/{z}/{x}/{y}.{ext}', {
attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
subdomains: 'abcd',
minZoom: 0,
maxZoom: 20,
ext: 'png'
});
catmap.addLayer(Stamen_Toner);
//add a marker for the Quad with a tooltip
//Quad: 38.541162, -121.749371
var marker = new L.marker([38.541112, -121.749350], {
opacity: 1.0   //teardrop marker opacity may be set to zero
});             
marker.bindTooltip("<b>Quad</b>", { });
marker.addTo(catmap);
//add cat points from the GeoJSON (campus_cats.js) file
var catpoints = L.geoJSON(campus_cats, {  
pointToLayer: function(feature, latlng){  
return L.circleMarker(latlng, {color: 'orange', radius: 8});
},
onEachFeature: function(feature, layer){
layer.bindPopup(
"<img src='"+feature.properties.gx_media_links+"' width='259'><br><b>Name: </b>" + feature.properties.Name + "<br><b>Description: </b>"+ feature.properties.details);
}
}).addTo(catmap);
</script>
</body>
</html>