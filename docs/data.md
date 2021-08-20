---
layout: default
title: Data
nav_order: 3
---

# Data

## Files Available

### Current AVA Boundaries
The avas.geojson file contains all of the AVA boundaries that were currently in use at the time the file was created.  This is the file that most people will want to download.

### Historical AVA Boundaries
AVA boundaries can change over time through a petition process to revise the boundaries.  The avas_historic.geojson file contains only boundaries that are no longer in use.

### All AVA Boundaries
The avas_allboundaries.geojson file contains all of the AVA boundaries that have ever been defined by the TTB, including current and historical boundaries.

### Individual AVA Boundaries
Boundaries are available for each official AVA.  The file contains the most recent boundary definition as well as any previous versions of the boundary that were amended through the revision process.  Files are named with the AVA's name follwed by .geojson, for example, adelaida_district.geojson


## Attribute Definitions

identifier | type | description | example
---| --- | --- | ---
ava_id | text | a unique identifier for each AVA polygon |	leona_valley
name | text | the legal name given to the AVA; an identifier for each AVA |	Leona Valley
aka	| text | (optional) other names, including historical names, and terms used for the AVA | |
created	| date | YYYY-MM-DD format; the date of the first publication creating the AVA | 2017-06-01 |
removed	| date | (optional) YYYY-MM-DD format; the date the AVA designation was removed from an area | 2017-06-01 |
county | text | the county, or list of counties separated by a pipe, in which the AVA exists |	Los Angeles&#124;Ventura
state	| text | the state, or list of states separated by a pipe, using the two-letter postal abbreviation, in which the AVA exists | CA&#124;NV
within	| text | (if applicable) used for smaller AVAs that fit inside of larger AVAs; the larger AVA that this AVA sits inside | 
contains	| text | (if applicable) used for larger AVAs that contain smaller AVAs; the smaller AVAs that fit inside this AVA |
petitioner	| text | the name of the person who initiated the petition and their affiliation separated by a comma | Jane Smith, Smith Family Wineries
cfr_author | text | the name of the TTB employee that authored the proposed and/or final rules in the Federal Register; typically found near the end of the document | Bob Jones	
cfr_index | decimal number | the number code that indicates where the final rule document can be found; typically, it is in the section heading of the CFR entry online|	9.212
cfr_revision_history | text | the string of text citing the documents that currently apply to this boundary definition |	[T.D. TTB-71, 73 FR 64202, Oct. 29, 2008]
approved_maps | text | the approved maps listed for the boundary defintion |(1) Ritter Ridge, Calif., 1958; Photorevised 1974; (2) Sleepy Valley, CA, 1995; (3) Del Sur, CA, 1995; and (4) Lake Hughes, CA, 1995.
boundary_description | text | the official boundary description |
used_maps	| text | the maps the digitizer used to digitize the boundary |
valid_start | date | YYYY-MM-DD format; the date this boundary revision began (applies only if there were revisions to the boundary) | 2017-06-01 |
valid_end | date | YYYY-MM-DD format; the last date this revision was valid (applies only if there were revisions to the boundary) | 2017-06-01 |
lcsh	| text | (optional) Library of Congress Subject Heading; Generally UCD Library staff has filled these in and will add them as new subject headings are approved |
sameas	| text | (optional) linked data URIs for terms that are identical to this AVA |

Any record with no data should use null (not N/A or blank).

## How to download the data
The data is avaiable from our [GitHub repository](https://github.com/UCDavisLibrary/ava).

### Download the whole repository
You can use the green download button on the Code tab of the [GitHub repository](https://github.com/UCDavisLibrary/ava) to download all of the files in this repository or you can fork this repository.  

### Download individual files
You can download single .geojson files by:
1. On the [GitHub repository](https://github.com/UCDavisLibrary/ava), click on the Code tab on the left (not the green Code button on the right), navigate to the file you would like to download, and click on the file name.
1. Click the Download button, which will take you to a page that displays the text of the document.
1. Right click anywhere on the page, and select "Save as..." 
1. Save the file where you would like to keep it.  You may need to remove an additional .txt extension that may get automatically added to the file name.  You file extension should be .geojson

## Suggested Citation

American Viticultural Areas Digitizing Project Team. 2021. `[file name]`. https://github.com/UCDavisLibrary/ava Accessed `[date accessed]`.

## License
The licence for this data is [Creative Commons CC0](https://creativecommons.org/share-your-work/public-domain/cc0/). We encourage citation of this dataset, especially when it is used in academic works.

## Disclaimer
The American Viticulture Areas (AVA) Project data is provided for educational purposes only. Data and materials may not be accurate or complete, and are provided as-is, without warranties of any kind. Please note that while every effort was made to digitize the data from the maps designated in the official descriptions of the boundaries from the Alcohol and Tobacco Tax and Trade Bureau, some substitutions were made and are noted in the attribute table.