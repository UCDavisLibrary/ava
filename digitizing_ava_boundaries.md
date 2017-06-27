# Instructions & Methods for Digitizing AVA Boundaries

## Getting Started:
### Start with the Issues Tracker
1. In the Issues section of the AVA project GitHub page, you should find an Issue for each AVA.  All AVAs in need of digitizing have an issue open on the github repository.  The issues are closed for AVAs as they are finished.  AVAs are given labels to indicate their status.  Open issues labeled as "In Progress" are currently being digitized by a contributor.  Choose an AVA that does not have an "In Progress" label.  Labels for partner organizations such as "UC Davis" or "UC Santa Barbara" indicate that the project coordinators expect these boundaries to be completed by the organization indicated.
1. In the text of each issue, you will find the boundary description you should use as well as the list of Approved Maps.  Other attribute information will be found in the Federal Register documents.  Occasionally, the text in the issue is missing either the Approved Maps or the starting point for the boundary description (due to the automated process that generated this text).  To find the missing text, refer to the "src" link (meaning "source") to the official Federal Register text.
  2. Add the "In Progress" label to the Issue for the AVA you've chosen to work on.  Write a comment for your chosen AVA that you are working on the boundary.  If possible, assign the task to yourself (on the top of the right side panel of options).  Add additional comments if any issues or questions arise about this particular AVA.

### Resources:
Hein Online Federal Register Library: http://heinonline.org/HOL/Index?collection=fedreg&set_as_cursor=clear 

Wine Institute’s list of documents establishing the original AVA boundaries:	https://www.wineinstitute.org/resources/avas

Alcohol and Tobacco Tax and Trade Bureau’s (TTB) list of currently established AVAs:	https://www.ttb.gov/wine/us_by_ava.shtml 


### Review the available Federal Register document for your AVA of interest  
  1. Search the Hein Online Federal Register Library for the name of your chosen AVA (the text search box is at the top of the page near the logo).  Many of the documents you will need are available there.  
  2. Check the TTB’s list linked above for a citation of the revision history of the AVA found at the bottom of the page in brackets.  Hardcopies of the Federal Register documents are also available in the UC Davis Library.  

## Download the Approved Maps
1. Go to the USGS National Geologic Map Database’s topoView: https://ngmdb.usgs.gov/maps/TopoView/viewer 
2. On the right side of the map in the Map Scales box, select the scale of the Approved Map.
3.	Zoom into the general region of the AVA, and the names of the maps will appear inside the index bounding boxes.
4. Select the map of interest by clicking inside the box.
5. On the lower left of the window, a dialog box should appear with details about the map you selected.  On the right side of this dialog, a section will indicate how many maps are available for the area.  For example, the Mount George quad near Napa says “5 Maps”.  Click on the number to see details about the maps available.
6. On the table that appears, you will see a column for “Date” and another for “Edition”.  Click on the date and edition that corresponds to the Approved Map listed in the Federal Register document.  
i. For example, one of the Approved Maps for the Coombsville AVA is listed as “Napa Quadrangle, California-Napa Co., 1951, Photorevised 1980”.  For this map, select the Napa map with a date of 1951 and edition of 1980.  
ii. In the event that the specific year for the Approved Map is not available, you may need to download one or two maps that are of a similar age and determine which has the landmarks indicated in the description.
7. Make sure the text in the dialog reflects the map you want to download, then click the GEOTIFF download option.
8. Save the file to your local computer.  The file saved will be a zipped folder containing GeoTIFF files.
9. Navigate to the folder where you saved the file.  Right click the file and select “Extract All”.  Browse to the folder you would like to unzip the folder to, then click the “Extract” button.  The new unzipped folder should contain 4 files.
10. Repeat all the substeps for Step 2 for each of the Approved Maps needed for your AVA before you move on to the digitizing process in Step 3.

The AVA Project team has made a [Video](https://drive.google.com/open?id=0B9xw97DGLpqAVEpYTzhfWm00TTg) of the process of downloading the Approved Maps. 

 
## Get the most recent project files from GitHub 
We’ll describe how to do this with the GitHub for Desktop tool, but you may use the tool of your choice.  We’ll also assume you’ve already set up your GitHub account and the GitHub for Desktop program.:
1.	Fork the AVA repository: https://github.com/UCDavisLibrary/ava (this link will change if the repository gets moved to the UC Davis GitHub account).  Details about how to fork a repository and work with it in GitHub Desktop are here: https://guides.github.com/activities/forking/ 
2.	Open GitHub for Desktop
3.	Select the forked AVA repository on the left sides of the window.
4.	In your computer’s file navigation system, navigate to your GitHub folder and open the AVAs folder.  Inside the folder for AVAs that haven’t been completed, find the AVA you want to work on and move the .geojson file to the “avas” folder.

## Digitizing the Boundary
### Set Up Your Project File:
1.  In your file browser, move the geojson file for your chosen AVA (for example, coombsville.geojson) from the "tbd" (stands for "to be determined") folder to the "avas" folder.
1.	Open QGIS
1.	Load data:
    * avas.geojson - for reference and snapping to shared boundaries
    * Your AVA geojson file - the file you will edit; example: coombsville.geojson
    * Approved Maps
1.	Set Project Projection
    * Open the Project Properties (Project menu → Project Properties)
    * Set the Coordinate Reference System to NAD83 (EPSG:4269)
1.  Set Snapping
    * In the Layers Panel (Table of Contents), select the all.geojson layer.
    * Open the Snapping Options (Settings menu → Snapping Options)
    * Set Layer Selection to “Current Layer” (the all.geojson layer you selected earlier in the Layers Panel), Snap To “To Vertex and Segment”, Tolerance to 20 Pixels (adjust this as needed), and finally check the boxes for “Enable topological editing” and “Enable snapping on intersection”.

The AVA Project team has made a [Video](https://drive.google.com/open?id=0B9xw97DGLpqATk9sTUFiM2ZuUFk) of the process of setting up your project file. 

### Digitizing the Boundary:
Each AVA has a template generated automatically and placed at the centroid of the county that the AVA resides in.
1.	Toggle Editing on for the new AVA GeoJSON file.
2.	You have two options for digitizing the boundary: 
    1. Add new polygon with the Add Feature tool. Digitize the boundary adding vertices according to the Federal Register Boundary description at a scale sufficient to identify the features needed from the topoquads.  You can switch between the Add Feature tool and navigating tools as needed.  Right click to finish.  Finally, delete the triangle template.
    2. Add nodes to the triangle moving them to the places described in the boundary description.
4.	Some things to keep in mind:
    * Note that as you near the edge of a map, you may need to turn off or reorder some of the maps to adjust for the white edges of the scanned maps that obscure the maps underneath.
    * If the AVA you are digitizing is very close to another that has already been digitized, read the boundary descriptions for both and determine if they share a boundary.  If they share a boundary, make sure you snap your vertices to the vertices of the other boundary.
    * Pay close attention to the wording describing the boundaries.  Some require a straight line between points and use language like "the next point is a straight line to the peak at 1700 feet".  Others require you to digitize along a feature and use language like "follow along Cold Creek until it crosses J Street".
5.	When you are done digitizing, fill out the attribute data based on the text of the official Federal Register documents.  The definitions of the attributes are found in the [README.md file](https://github.com/UCDavisLibrary/ava/blob/master/README.md).
6.	Save Layer Edits.
7.	Toggle Editing off.
8.	Close QGIS if you’re done making new AVAs, or start over from Step 3e above to make another.

The AVA Project team has made a [Video](https://drive.google.com/open?id=0B9xw97DGLpqAMkNOc05GOGhoZ2M) of the process of digitzing an AVA boundary.

![alt text](https://github.com/UCDavisLibrary/ava/blob/master/images/Example_AVA_Coombsville.PNG "Example of a completed AVA boundary")

## Submit your changes to the AVA GitHub Repository
1.	In GitHub for Desktop, you should see a list of changes you’ve made to the files.  Fill in the Summary and Description fields at the bottom of the window and then click the Commit button.  https://guides.github.com/activities/forking/#making-changes 
2.	If you are ready to incorporate your changes into the main branch, submit a pull request for your fork: https://guides.github.com/activities/forking/#making-a-pull-request 
3.  If your changes are accepted, project adminsitrators will incorporated your changes and close the issue for your AVA.  If there is any problems or questions, the project administrators will contact you.

## Additional Reference Material:
1.	QGIS editing geometry manual: http://docs.qgis.org/2.14/en/docs/user_manual/working_with_vector/editing_geometry_attributes.html 
2.	Understanding the GitHub Flow: https://guides.github.com/introduction/flow/
3.	USGS Topographic Map Symbols: https://pubs.usgs.gov/gip/TopographicMapSymbols/topomapsymbols.pdf 

-----------------------------------------------------------------------------------------------------
Considerations for post-processing:
1.	Densify the lines for areas with large distances between points so when people re-project the file it won’t distort.

