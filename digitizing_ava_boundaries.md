# Instructions & Methods for Digitizing AVA Boundaries

## Getting Started:
### Start with the Issues Tracker
1. In the Issues section of the AVA project GitHub page, you should find an Issue for each AVA.  All AVAs in need of digitizing have an issue open on the github repository.  The issues are closed for AVAs as they are finished.  AVAs are given labels to indicate their status.  Open issues labeled as "In Progress" are currently being digitized by a contributor.  Choose an AVA that does not have an "In Progress" label.  Labels for partner organizations such as "UC Davis" or "UC Santa Barbara" indicate that the project coordinators expect these boundaries to be completed by the organization indicated.
1. In the text of each issue, you will find the boundary description you should use as well as the list of Approved Maps.  Other attribute information will be found in the Federal Register documents.  Occasionally, the text in the issue is missing either the Approved Maps or the starting point for the boundary description (due to the automated process that generated this text).  To find the missing text, refer to the "src" link (meaning "source") to the official Federal Register text.
  2. Write a comment for your chosen AVA that you are working on the boundary.  Michele will change the status to "In Progress" when she sees the comment.  Add additional comments if any issues or questions arise about this particular AVA.  The issue for [Arroyo Seco](https://github.com/UCDavisLibrary/ava/issues/24) is a good example of the kinds of troubles and questions to track on an issue for an AVA.

### Resources:
Hein Online Federal Register Library: http://heinonline.org/HOL/Index?collection=fedreg&set_as_cursor=clear 

Wine Institute’s list of documents establishing the original AVA boundaries:	https://www.wineinstitute.org/resources/avas

Alcohol and Tobacco Tax and Trade Bureau’s (TTB) list of currently established AVAs:	https://www.ttb.gov/wine/us_by_ava.shtml 


### Review the available Federal Register document for your AVA of interest  
  1. Search the Hein Online Federal Register Library for the name of your chosen AVA (the text search box is at the top of the page near the logo).  Many of the documents you will need are available there.  
  2. Check the TTB’s list linked above for a citation of the revision history of the AVA found at the bottom of the page in brackets.  Hardcopies of the Federal Register documents are also available in the UC Davis Library.  

## Download the Approved Maps
*Note* Google Chrome browswer has occasionally had difficulties downloading files from topoView, resulting in an error message saying "Failed - Network error".  If this happens, try another browswer.  Microsoft Edge has worked well in the past.
1. Go to the USGS National Geologic Map Database’s topoView: https://ngmdb.usgs.gov/maps/TopoView/viewer 
2. On the right side of the map in the side panel, select the scale of the Approved Map.
3.	Zoom into the general region of the AVA, and the names of the maps will appear inside the index bounding boxes.  Alternatively you can search for the name of the approved map with the Map Name search at the top of the side panel.
4. Select the map of interest by clicking inside the box.
5. In the lower section of the side panel, a dialog box should appear with details about the map you selected and the maps that are available.  Identify the option with date and edition that corresponds to the Approved Map listed in the Federal Register document.  Note that TopoView lists the date the original map was created and the year it was printed, NOT the revision year. If you really want to be sure you're getting the exact map, you can preview the map by downloading the .jpg or .pdf option and then look at the lower right corner of the map for the revision informatiomation.  

    i. For example, one of the Approved Maps for the Coombsville AVA is listed as “Napa Quadrangle, California-Napa Co., 1951, Photorevised 1980”.  For this map, select the Napa map with a date of 1951 and edition of 1980.  
    
    ii. In the event that the specific year for the Approved Map is not available, you may need to download one or two maps that are of a similar age and determine which has the landmarks indicated in the description.
    
7. Click the GEOTIFF download option for the map edition closest to the Approved Map listed in the federal documents.
8. Save the file to your local computer.  The file saved will be a zipped folder containing GeoTIFF files.
9. Navigate to the folder where you saved the file.  Right click the file and select “Extract All”.  Browse to the folder you would like to unzip the folder to, then click the “Extract” button.  The new unzipped folder should contain 4 files.
10. Repeat all the substeps for Step 2 for each of the Approved Maps needed for your AVA before you move on to the digitizing process in Step 3.

Further assistance in interpreting which scale of map to use can be found in the [USGS' Map Scales Report](https://pubs.usgs.gov/fs/2002/0015/report.pdf).

The AVA Project team has made a [Video](https://drive.google.com/open?id=0B9xw97DGLpqAVEpYTzhfWm00TTg) of the process of downloading the Approved Maps.  The video uses the older topoView interface, but the general procedure is the same.

 
## Get the most recent project files from GitHub 
We’ll describe how to do this with the GitHub for Desktop tool, but you may use the tool of your choice.  We’ll also assume you’ve already set up your GitHub account and the GitHub for Desktop program.:
1.	Fork the AVA repository: https://github.com/UCDavisLibrary/ava (this link will change if the repository gets moved to the UC Davis GitHub account).  Details about how to fork a repository and work with it in GitHub Desktop are here: https://guides.github.com/activities/forking/ 
2.	Open GitHub for Desktop
3.	Select the forked AVA repository on the left sides of the window.
4.	In your computer’s file navigation system, navigate to your GitHub folder and open the AVAs folder.  Inside the folder for AVAs that haven’t been completed, find the AVA you want to work on and move the .geojson file to the “avas” folder.

Once you've set up your fork, you'll need to update it regularly to make sure you have all the current files.  There is unfortunately no way to do this with the GitHub Desktop tool, but it's not too complicated to update it.
1. Open GitHub Desktop
1. Click on your fork to open it.
1. Right click on the name of the fork and select "Open Command Prompt" or "Open in Git Shell" (depending on the version you have the text will be different).  A command line shell will open.  The path before the > should be where you store your data (probably the GitHub folder on your computer).
1. You will now run a few commands to update your fork ([reference](https://gist.github.com/CristinaSolana/1885435)).
    1. The first time you'll need to set an upstream repository for your fork:
    ```
        git remote add upstream git://github.com/UCDavisLibrary/ava.git
    ```
        
    2. Now you'll fetch any changes:
    ```
        git fetch upstream
    ```
    
    3. Finally, you'll update your folder with the changes you just fetched:
    ```
        git pull upstream master
    ```

In the event that your fork gets too messy, you can do a **hard reset** to remove everything from your fork and replace it with what is on the UC Davis AVA repository. 
1. Copy any data you've been working on into a folder not affected by git. 
2. Run a few lines of code to reset your repository:
    1. The first time you'll need to set an upstream repository for your fork:
    ```
        git remote add upstream git://github.com/UCDavisLibrary/ava.git
    ```
    
    2. Now the reset:
    ```
    git fetch upstream
    git checkout master
    git reset --hard upstream/master  
    git push origin master --force
    ```
3. Finally, move any data you've been working on back into it's folder.  Now you can do a pull request like you normally would.

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
5.	When you are done digitizing, fill out the attribute data based on the text of the official Federal Register documents.  The definitions of the attributes are found in the [README.md file](https://github.com/UCDavisLibrary/ava/blob/master/README.md).  *Note:* Contributors using QGIS 2.18.10 or older with GDAL 2.2.0 should fill in any blanks in their attribute table with N/A due to a known issue with how unset values are handled. A [more permanent fix](https://issues.qgis.org/issues/16812) is in the works.
6.	Save Layer Edits.
7.	Toggle Editing off.
8.	Close QGIS if you’re done making new AVAs, or start over from Step 3e above to make another.

The AVA Project team has made a [Video](https://drive.google.com/open?id=0B9xw97DGLpqAMkNOc05GOGhoZ2M) of the process of digitzing an AVA boundary.

![alt text](https://github.com/UCDavisLibrary/ava/blob/master/images/Example_AVA_Coombsville.PNG "Example of a completed AVA boundary")

## Submit your changes to the AVA GitHub Repository
1.	In GitHub for Desktop, you should see a list of changes you’ve made to the files.  Fill in the Summary and Description fields at the bottom of the window and then click the Commit button.  https://guides.github.com/activities/forking/#making-changes 
2.  You should now see the "Push" button at the top of your GitHub for Desktop Screen.  Click the "Push" button to send your changes to YOUR online repository.
2.	If you are ready to incorporate your changes into the main branch (i.e. send finished data to the UC Davis repository), submit a pull request for your fork: https://help.github.com/articles/creating-a-pull-request-from-a-fork/ 
3.  If your changes are accepted, project adminsitrators will incorporated your changes and close the issue for your AVA.  If there is any problems or questions, the project administrators will contact you.

## Notes for pull request reviewers:
If a pull request cannot be merged automatically by GitHub, you can remove or modify files before you merge them into the main repository.

Step 1: In the command line tool, from your project repository, check out a new branch and test the changes.
```
git checkout -b [repository user name]-master master
git pull https://github.com/gdmf/ava.git master
```

Step 2: Remove or modify files on your computer.

Step 3: Committ the changes.

Step 4: Merge the changes and update on GitHub.
```
git checkout master
git merge --no-ff [repository user name]-master
git push origin master
```

Another Option: If you want to accept only some of the changes offered in a pull request, you will need to use the command line to [cherry-pick](https://mattstauffer.co/blog/how-to-merge-only-specific-commits-from-a-pull-request) the committs that you want to keep.

## Additional Reference Material:
1.	QGIS editing geometry manual: http://docs.qgis.org/2.14/en/docs/user_manual/working_with_vector/editing_geometry_attributes.html 
2.	Understanding the GitHub Flow: https://guides.github.com/introduction/flow/
3.	USGS Topographic Map Symbols: https://pubs.usgs.gov/gip/TopographicMapSymbols/topomapsymbols.pdf 

-----------------------------------------------------------------------------------------------------
Considerations for post-processing:
1.	Densify the lines for areas with large distances between points so when people re-project the file it won’t distort.

