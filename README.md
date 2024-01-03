# American Viticultural Areas (AVA) Project

The American Viticultural Areas (AVA) Project is an open-licensed, community-contributed spatial dataset of the American Viticultural Areas boundaries, maintained by UC Davis [DataLab](https://datalab.ucdavis.edu/) and [Library](https://www.library.ucdavis.edu/), with significant contributions from UCSB Library and Virginia Tech.

Documentation, including information about our datasets and how you can contribute, is now available on our [Documentation Website](https://ucdavislibrary.github.io/ava/).  

All contributors are expected to follow the [Code of Conduct](code_of_conduct.md).

We have archived our older documentation for reference in the [archived_documentation](https://github.com/UCDavisLibrary/ava/tree/master/archived_documentation) folder.

### `rcode` Folder Contents

1. AVA counties from shapefile.R
Purpose: This script is used for producing county field from shapefile (when info not found in CFR).

2. GettingProj4Strings.R (Not in Use)
Purpose: retrieve proj.4 strings for qgis

3. GuenocValley.R (Not in Use)
Purpose: This r script takes the compass bearings and distances from the Federal Register Document describing the Guenoc Valley AVA and turns it into a polygon.

4. ScrapeRevisionHistories_new.R
Purpose: This r script scrapes the ECFR site for the names and revision histories for the AVAs for new AVAs to be digitized.

5. StatesFiles.R
Purpose: This r script separates AVAs by state to make a .geojson and .shp file set for each state.

6. ava_county_update.R
Purpose: This r script returns a list of errors in the 'county' column that need to be updated

7. check_winding_order.R
Purpose: This script checks if the .geojsons in the avas folder are clockwise, and if so reverses them to fit the RFC 7946 standard of exterior rings = counterclockwise

8. commas_to_pipes.R
Purpose: This r script changes commas to pipes in the county column (can be used in states too, change "county" to "state")

9. find bad dates.R
Purpose: This r script identifies AVAs with wrong date formats

10. fix_contains.R
Purpose: This r script replaces commas and deletes state abbr in within/contains columns

11. getContributorInfo.R
Purpose: This script uses the data frame created in getContributors.R to return some basic analysis such as the unique contributors to the AVA GitHub, a data frame of the number of contributors to each file, and their names.

12. getContributors.R
Purpose: This script scrapes the GitHub contributors for each file in the avas folder.

13. mergeGeoJson.R
Purpose: This r script combines all the GeoJSON files in a folder into one file, and then writes it back to the folder.

14. set_NAs_to_null.R
Purpose: This r script changes N/A to NA.

15. visualizations_ava.R
Purpose: This r script creates visualizations for the website.