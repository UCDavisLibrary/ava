#This r script takes the compass bearings and distances from the 
#Federal Register Document describing the Guenoc Valley AVA and turns it into a polygon.


library(geosphere)
library(sp)

# Starting Point: 38.7660° N, 122.4900° W = peak of Jim Davis Mountain, as reported by Google

point0<-c((0-122.4900), 38.7660)

#(1) South 07°49'34??? East, 9,822.57 feet to the USGS triangulation station "Guenoc;"
point1<-destPoint(point0, (180-7.826111111111111),  0.3048*9822.5)

#(2) Then, South 29°14'31??? West, 10,325.08 feet;
point2<-destPoint(point1, (180+29.241944444444446),  0.3048*10325.0)

#(3) Then, South 00°00' West, 2,100.00 feet;
point3<-destPoint(point2, 270, 0.3048*2100.0)

#(4) Then, North 90°00' West, 4,150.00 feet;
point4<-destPoint(point3, 270, 0.3048*4150.0)

#(5) Then, North 24°23'11??? West, 16,469.36 feet;
point5<-destPoint(point4, (360-24.386388888888888),  0.3048*16469.3)

#(6) Then, North 75°47'20??? East, 7,943.08 feet; and
point6<-destPoint(point5, 75.78888888888889,  0.3048*7943.0)

#(7) Then, North 60°47'00??? East, 7,970.24 feet to the beginning point.
point7<-destPoint(point6, 60.78333333333333,  0.3048*7970.2)

lonlat<-rbind(point0, point1, point2, point3, point4, point5, point6, point7)
row.names(lonlat)<-1:8
pts<-SpatialPoints(lonlat)
pts<-spPolygons(lonlat)
crs(pts)<-CRS("+init=epsg:4326")

plot(pts)

geojson_write(pts, file="guenoc.geojson", overwrite=TRUE, convert_wgs84 = TRUE)
