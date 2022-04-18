---
layout: default
title: Methods
nav_order: 4
---

# Methods
The goal of the AVA Digitizing Project's methods is to replicate the offical boundary, adhering as closely as possible to the approved maps and offical boundary description. Deviations are only made when necessary. Outside data sources should only be used as a last ersort, when no other option is available. All data sources used to create any boundary are documented. All input datasources are public domain or open licensed so we can maintain the open license of our AVA dataset. Contributors agree to uphold these standards.

## Teamwork
Given the number and geographic distribution of contributors to this dataset, we have developed methods to help us work together.

### Working with the Issues List
Start with the Issues list to find a task to work on.

In the Issues section of the AVA project GitHub page, you will find an Issue for each AVA. All AVAs in need of digitizing have an issue open on the github repository. The issues are closed for AVAs as they are finished. AVAs are given labels to indicate their status. Open issues labeled as "In Progress" are currently being digitized by a contributor. Choose an AVA that does not have an "In Progress" label. Labels for partner organizations such as "UC Davis" or "UC Santa Barbara" indicate that the project coordinators expect these boundaries to be completed by the organization indicated. 

In the text of each issue, you will find details of the task to be completed. 

Before starting work on any issue, make a comment on the issue that you are going to start working on it. This will notify the project administrators so they can change the status to "In Progress". Add additional comments if any issues or questions arise about this particular issue. The issue for [Arroyo Seco](https://github.com/UCDavisLibrary/ava/issues/24) is a good example of the kinds of challenges and questions to track on an issue for an AVA.

## Digitizing Methods

### Common Resources:

Boundary Descriptions & Government Documents:

 * [Hein Online Federal Register Library](http://heinonline.org/HOL/Index?collection=fedreg&set_as_cursor=clear) (UC Davis affiliates may need to log in to the campus VPN to get access)
 * [GovInfo](https://www.govinfo.gov/) - free online source for government documents
 * Wine Institute’s list of [documents establishing the original AVA boundaries](https://www.wineinstitute.org/resources/avas)
 * Alcohol and Tobacco Tax and Trade Bureau’s (TTB) list of [currently established AVAs](https://www.ttb.gov/wine/us_by_ava.shtml)
 * Electronic Code of Federal Regulations (ECFR)'s [Approved American Viticultural Areas](https://www.ecfr.gov/cgi-bin/retrieveECFR?gp=&SID=371db32ecca6629af6dccad2a39d7833&mc=true&n=sp27.1.9.c) - has the boundary descriptions, but not the full document

Maps:

 * [USGS TopoView](https://ngmdb.usgs.gov/topoview/viewer)
 * [USGS Store](https://store.usgs.gov/)

### Digitize New Boundaries

New AVAs and boundary updates for existing AVAs are added to the Federal Register.  Our web scraping code checks this document regularly, and each new AVA or boundary revision is given it's own issue.  If you see one of these issues not yet assigned to a contributor or partner organization, and not labeleled "In Progress", you are encouraged to digitize it!  Comment on the issue that you would like to work on and one of our team members will assign it to you.  You may then digitize the new AVA following the methods described below.

#### Review the available Federal Register document for your AVA of interest  
  1. Search the [Hein Online Federal Register Library](http://heinonline.org/HOL/Index?collection=fedreg&set_as_cursor=clear) or [GovInfo](https://www.govinfo.gov/) for the name of your chosen AVA.  Many of the documents you will need are available there.  
  2. Check the [TTB’s list of established AVAs]((https://www.ttb.gov/wine/us_by_ava.shtml) for a citation of the revision history of the AVA found at the bottom of the page in brackets. 
  3. Make note of the approved Maps and the boundary description.

#### Download the Approved Maps
*Note* Google Chrome browser has occasionally had difficulties downloading files from topoView, resulting in an error message saying "Failed - Network error".  If this happens, try another browser.  Microsoft Edge has worked well in the past.
1. Go to the USGS National Geologic Map Database’s topoView: https://ngmdb.usgs.gov/maps/TopoView/viewer 
2. On the right side of the map in the side panel, select the scale of the Approved Map you are looking for.
3.	Zoom into the general region of the AVA, and the names of the maps will appear inside the index bounding boxes.  Alternatively you can search for the name of the approved map with the Map Name search at the top of the side panel.
4. Select the map of interest by clicking inside the box.
5. In the lower section of the side panel, a dialog box should appear with details about the map you selected and the maps that are available.  Identify the option with date and edition that corresponds to the Approved Map listed in the Federal Register document.  Note that TopoView lists the date the original map was created and the year it was printed, NOT the revision year. If you really want to be sure you're getting the exact map, you can preview the map by downloading the .jpg or .pdf option and then look near the bottom of the map for the revision information. 

    i. For example, one of the Approved Maps for the Coombsville AVA is listed as “Napa Quadrangle, California-Napa Co., 1951, Photorevised 1980”.  For this map, select the Napa map with a date of 1951 and edition of 1980.  
    
    ii. In the event that the specific year for the Approved Map is not available, first check the [USGS store](https://store.usgs.gov/filter-products?page=1).  If it is not available there, you may need to download a map (or multiple smaller maps) that are of a similar age in the same area from TopoView.
    
6. Click the GEOTIFF download option for the map edition closest to the Approved Map listed in the federal documents.
7. Save the file to your local computer.  The file saved will be a zipped folder containing GeoTIFF files.
8. Navigate to the folder where you saved the file.  Right click the file and select “Extract All”.  Browse to the folder you would like to unzip the folder to, then click the “Extract” button.  The new unzipped folder should contain 4 files.
9. Repeat all the substeps for Step 2 for each of the Approved Maps needed for your AVA before you move on to the digitizing process in Step 3.
10. Make note of the maps you use to digitize the boundary. You'll need to enter the list of maps int he `used_maps` column of the attribute table.

Further assistance in interpreting which scale of map to use can be found in the [USGS' Map Scales Report](https://pubs.usgs.gov/fs/2002/0015/report.pdf).

 
#### Get the most recent project files from GitHub 
We’ll describe how to do this with the GitHub for Desktop tool, but you may use the tool of your choice.  We’ll also assume you’ve already set up your GitHub account and the GitHub for Desktop program:
1.	Fork the [AVA repository](https://github.com/UCDavisLibrary/ava).  See [GitHub's forking documentation](https://guides.github.com/activities/forking/) for details about how to fork a repository and work with it in GitHub Desktop.  
2.	Open GitHub Desktop
3.	Select the forked AVA repository on the left sides of the window.
4.	In your computer’s file navigation system, navigate to your GitHub folder and open the AVAs folder.  The `tbd` ("to be determined") folder contains AVAs that haven’t been completed; find the AVA you want to work on and move the .geojson file to the “avas” folder. Note that the `tbd` folder is not visible in the GitHub repository when it is empty and there are currently no new boundaries to digitize.


#### Set Up Your Project File:
1.  Make sure you've moved the geojson file for your chosen AVA (for example, coombsville.geojson) from the `tbd` folder to the `avas` folder.
1.	Open QGIS. Note: we work with QGIS because it can write the standard geojson specification. ESRI tools do not. Please do not submit data in ESRI's geojson format.
1.	Load data:
    * avas.geojson - for reference and snapping to shared boundaries (vector data)
    * Your AVA geojson file - the file you will edit; example: coombsville.geojson (vector data)
    * Approved Maps files you downloaded from USGS' TopoView or Store (raster data)
1.	Set Project Projection
    * Open the Project Properties (Project menu → Project Properties)
    * Set the Coordinate Reference System to NAD83 (EPSG:4269)
1.  Set Snapping
    * In the Layers Panel (Table of Contents), select the all.geojson layer.
    * Open the Snapping Options (Settings menu → Snapping Options)
    * Set Layer Selection to “Current Layer” (the all.geojson layer you selected earlier in the Layers Panel), Snap To “To Vertex and Segment”, Tolerance to 20 Pixels (adjust this as needed), and finally check the boxes for “Enable topological editing” and “Enable snapping on intersection”.


#### Digitizing the Boundary:
Each AVA in the `tbd` folder has a template generated automatically and placed at the centroid of the county that the AVA resides in as a placeholder. You'll replace this triangle with the new boundary.
1.	Toggle Editing on for the new AVA GeoJSON file.
2.	You have two options for digitizing the boundary: 
    1. Add new polygon with the Add Feature tool. Digitize the boundary adding vertices according to the Federal Register Boundary description at a scale sufficient to identify the features needed from the topoquads.  You can switch between the Add Feature tool and navigating tools as needed.  Right click to finish.  Finally, delete the triangle template.
    2. Add nodes to the triangle moving them to the places described in the boundary description.
4.	Some things to keep in mind:
    * As you near the edge of a map, you may need to turn off or reorder some of the maps to adjust for the white edges of the scanned maps that obscure the maps underneath.
    * If the AVA you are digitizing is very close to another that has already been digitized, read the boundary descriptions for both and determine if they share a boundary.  If they share a boundary, refer to the Border Matching Methods section below.
    * Pay close attention to the wording describing the boundaries.  Some require a straight line between points and use language like "the next point is a straight line to the peak at 1700 feet".  Others require you to digitize along a feature and use language like "follow along Cold Creek until it crosses J Street".
5.	When you are done digitizing, fill out the attribute data based on the text of the official Federal Register documents.  The definitions of the attributes are found in the [Data Page](https://ucdavislibrary.github.io/ava/data.html).
6.	Save Layer Edits.
7.	Toggle Editing off.



### Historical Boundary Methods
The TTB has a process by which AVA boundaries can be ammended. Our dataset captures these boundaries because they can be helpful in understanding the history of a single AVA or the concept of AVAs over time. As these boundary revisions are appoved, this is how we digitize them and store the data:

We have one .geojson file for each named AVA. Within the file for an AVA, we create polygons for each official boundary revision as recorded by the TTB and described in the CFR documents.  We use the current table to indicate when each polygon was in use.  Attributes recorded for each polygon indicate:
 * `created`: the date the **AVA** officially began
 * `removed`: the date the **AVA** was terminated
 * `valid_start`: the date the **boundary** officially began
 * `valid_end`: the last date the **boundary** was in use (typically the day before the next revision took effect)
 * `ava_id`: for non-current boundaries, append and underscore and the date for the 'valid_start' in YYYYMMDD format.  Example: redwood_valley_19970221
 * `petitioner` and `cfr_author`:  The boundary update will most likely have a different petitioner and author, which can be found in the CFR document 
 * `cfr_revision_history`: the most updated version can be found on the e-CFR website, underneath the boundary instruction.  Example: [T.D. ATF-128, 48 FR 14375, Apr. 4, 1983, as amended by T.D. TTB-163, 85 FR 60361, Sept. 25, 2020]. Each revision should have the CFR history up to that revision (first version will and after the first date)
 
#### Digitizing Historical Boundaries:
Here is one option for adding historical boundaries to an existing AVA boundary. 

1. First, load the AVA into QGIS and use the boundary description field to figure out which revision it is.  Load the approved maps for this revision and CHECK THE BOUNDARY NOW, as any edits made later on will have to be made to all copies.
2. Find the AVA in the avas folder and make however many copies as there are revisions.  Rename the files to something like [AVA]1.geojson, [AVA]2.geojson, ... , [AVA]n.geojson
4. Find the Federal Register documents for each revision.  The easiest way is through HeinOnline (requires UCD Library VPN), input volume and page from the revision history strings given in the history issue	
5. For each revision:
	* Make updates to the boundary following the methods described in “Digitizing the Boundary” above
	* Edit the attribute tables of both layers (fields described above)
6. When editing is complete, use the merge tool to combine layers:
	* Open with Vector —> Data Management Tools —>  Merge Vector Layers
	* Select [AVA]1.geojson, [AVA]2.geojson, ... , [AVA]n.geojson as input layers
	* Under merged, click the ellipses and select “Save to File”, navigate to avas folder and save as [AVA].geojson
	* Once merge is complete, double check that the attribute table for the new layer contains tabs for the original and the update
	* The merge will have added extra fields at the bottom, delete these using the Delete Field tool in the attribute table menu (or Ctrl+L)
7. Delete [AVA]1.geojson, [AVA]2.geojson, ... , [AVA]n.geojson from the avas folder
 
### Border Matching Methods

In the interest of keeping the dataset clean and organized, AVAs that share a partial boundary are matched along this boundary.  In these cases, the border that is kept is the one that is of higher detail, i.e. larger scale maps.  If the two AVAs have the same level of detail, priority goes to the more recent AVA.  Some exceptions can be made, but all border matching decisions should be documented in the used maps attribute of the edited AVA.  

Border matching can be done manually with QGIS's snapping tool, but for longer sections of boundary the border_matching.R script in the rcode folder is a much quicker solution.

### Quality Control Methods

For quality control, each boundary for a second time against the official description and the approved maps. Having a second (or even third) check each boundary ensures that the data matches as closely to the offical description as we can make it.

The process should proceed as follows:
1. Pick a boundary to check.
1. Comment in the issue for that boundary that you are reviewing that boundary.
1. Load the boundary's .geojson file and the list of Used Maps into QGIS.
1. Check that
  * the Used Maps were the best match for the official Approved Maps.  If not, load up other maps. New options may now be available that weren't at the time the boundary was initially digitized.
  * the attribute table for the boundary file is complete and follows our standard.  Note that State and County use \| (pipe) as the separator.
  * the boundary follows the description as best it can.  Make changes as necessary.
5. Update the Used Maps column to add any additional resources you used.  Whenever possible, please only use the Approved Maps.
1. Post any questions or discussion points on the issue for the boundary you are reviewing.
1. Submit a pull request for changes you made - please submit each boundary in it's own pull request.  Or, if the boundary and attribute table don't need edits, comment on the Issue for the boundary that you've checked it and it doesn't need edits.


### Notes

If the name of the AVA changes, this should be reflected in the name field.  The `ava_id` field should have the most recent AVA ID followed by the appended date if applicable.

If the approved maps change but the boundary stays the same for any length (follows the same features on different maps) match the older boundaries to the new and make note of the in the used maps field: “Border matched to YYYY-MM-DD revision border where applicable”

To see an example of boundaries with revisions, see the closed issues for any issue with a `history` label.  These AVA's histories have been completed and are available in the `avas` folder.  



## Submiting your changes to the AVA GitHub Repository
1.	In GitHub for Desktop, you should see a list of changes you’ve made to the files.  Fill in the Summary and Description fields at the bottom of the window and then click the Commit button.  https://guides.github.com/activities/forking/#making-changes 
2.  You should now see the "Push" button at the top of your GitHub for Desktop Screen.  Click the "Push" button to send your changes to YOUR online repository.
2.	If you are ready to send finished data to the UC Davis repository, submit a pull request for your fork: https://help.github.com/articles/creating-a-pull-request-from-a-fork/ 
3.  The project administrators will review your changes and if your changes are accepted, project adminsitrators will incorporated your changes and close the issue you were working on.  If there is any problems or questions, the project administrators will contact you.


### Additional Reference Material:
1.	[QGIS editing geometry manual](https://docs.qgis.org/3.22/en/docs/user_manual/working_with_vector/editing_geometry_attributes.html)
2.	[Understanding the GitHub Flow](https://guides.github.com/introduction/flow/)
3.	[USGS Topographic Map Symbols](https://pubs.usgs.gov/gip/TopographicMapSymbols/topomapsymbols.pdf)

