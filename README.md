# American Viticultural Areas (AVA) Project

The American Viticultural Areas (AVA) Project is an open-licensed, community-contributed spatial dataset of the American Viticultural Areas boundaries, maintained by UC Davis [DataLab](https://datalab.ucdavis.edu/) and [Library](https://www.library.ucdavis.edu/), with significant contributions from UCSB Library and Virginia Tech.

Documentation, including information about our datasets and how you can contribute, is now available on our [Documentation Website](https://ucdavislibrary.github.io/ava/).  

All contributors are expected to follow the [Code of Conduct](code_of_conduct.md).

We have archived our older documentation for reference in the [archived_documentation](https://github.com/UCDavisLibrary/ava/tree/master/archived_documentation) folder.

## File Structure

The file structure for the project is:

```
archived_documentation/   Original documentation from 2017-2022
avas/                     Individual AVA files
avas_aggregated_files/    Aggregated AVA files
avas_by_state/            AVA files by state
docs/                     Supporting documents
└── _sass/color_schemes/  Website color schemes
└── cleaned/              Website visualizations
└── web_map/              Map for website
images/                   Supporting images
rcode/                    Supporting r scripts
reports/                  CSV results generated from r scripts
tbd/                      Template ava file
unofficial_boundaries/    Unofficial boundaries
LICENSE
NOTES.org
Notes.md
README.md
code_of_conduct.md
contributors.csv
```
## [rcode](rcode) Folder Description

| File Name               | Description                                             |
|-------------------------|---------------------------------------------------------|
| AVA counties from shapefile.R | Produces county field from shapefile when info is not found in CFR. |
| GettingProj4Strings.R (Not in Use) | Retrieves proj.4 strings for QGIS. |
| GuenocValley.R (Not in Use) | Transforms compass bearings and distances into a polygon for the Guenoc Valley AVA. |
| ScrapeRevisionHistories_new.R | Scrapes ECFR site for AVAs' names and revision histories for new digitization. |
| StatesFiles.R | Separates AVAs by state to generate .geojson and .shp file sets for each state. |
| ava_county_update.R | Identifies errors in the 'county' column needing updates. |
| check_winding_order.R | Checks if .geojsons in the avas folder have clockwise orientation and corrects them as per RFC 7946 standard. |
| commas_to_pipes.R | Converts commas to pipes in the 'county' column (applicable to states by changing "county" to "state"). |
| find bad dates.R | Identifies AVAs with incorrect date formats. |
| fix_contains.R | Replaces commas and deletes state abbreviations in within/contains columns. |
| getContributorInfo.R | Provides basic analysis on unique contributors to the AVA GitHub, contributors to each file, and their names using data from `getContributors.R`. |
| getContributors.R | Scrapes GitHub contributors for each file in the avas folder. |
| mergeGeoJson.R | Combines all GeoJSON files in a folder into one file and writes it back to the folder. |
| set_NAs_to_null.R | Changes N/A to NA. |
| visualizations_ava.R | Creates visualizations for the website. |
