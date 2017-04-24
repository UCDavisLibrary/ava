# American Viticultural Areas (ava) Project

The UC Davis library, in conjuction with partner organizations and contributions from the general public, will create a publically accessable version American Viticultural Areas boundaries.  Using the text descriptions from the ATPF Code of regulations, we will build this data from the official descriptions.  These data will be made freely availabe.  This dataset will provide wine researchers with an important tool as they examine the scientific, economic and historical aspects of viticulture.

Anyone can contribute to this project.

# Project Rationale
All wine sold is marked by a geographic location specifying where the grapes that make the wine were grown. Sometimes these geographical markers, or appellations, are shaped by political boundaries, but more often or not a wine’s geography is marked by a designated grape-grown region. In the United States, grape-growing regions are called American Viticultural Areas (AVAs) and their boundaries are established by the Alcohol and Tobacco Tax and Trade Bureau (TTB) under the Department of the Treasury. Today, there are 142 AVAs in California, for example, each recognized for its distinctive topographical, climatic, and/or historic and cultural features. Some are as well-known as the Napa Valley AVA established in 1981, and others as new the Malibu Coast AVA established in 2014.  

These designations are extremely important to the development of both the wine industry and wine research. They provide the standard geographical category for those seeking to evaluate and compare wine aesthetics, wine production and marketing data, and the science related to different wine-growing environments. 

While the AVAs are widely used in industry and research, there is no freely available, open-access geographical information dataset demarcating the boundaries of these regions in California (or in other States). GIS representations of the official AVA boundaries delineated in the US Code of Federal Regulations are incomplete, and those that are available are restricted and expensive to use. By developing a cooperative project aimed at making AVAs boundaries available as an open GIS dataset, we will extend to researchers and industry a tool that will allow them to better visualize, publicize, and compare their data. 

The AVA Project seeks to empower the study of wine regions and facilitate research into emerging environmental questions, while enabling greater insight into this important sector of the California’s economy and culture. 
  
For information of American Viticulture Areas: 
TTB: https://www.ttb.gov/wine/ava.shtml
Wine Institute: https://www.wineinstitute.org/resources/avas

## How Can You Contribute?
1. Read the GettingStarted.md & digitizing_ava_boundaries.md files to familiarize yourself with the policies and procedures for this project.
1. Fork the repository.
1. Check the Issues list to see which AVAs are available and claim the one you want to work on.
1. Make a boundary
1. Create a Pull Request

## Progress

### UC Davis
UC Davis anticipates contributing boundaries for the northern California AVAs.

### UC Santa Barbara
UC Santa Barbara anticipates contributing boundaries for the southern California AVAs.

### Additional Partnerships
University entities (departments, labs, research groups, etc.) or other organizations interested in becoming project partners should contact us.  We're happy to discuss new partnerships in building this and similar datasets!  A partnership is not necessary, however, to contribute.


## Attribute Data Definitions

identifier | type | description | example
---| --- | --- | ---
ava_id | text | an identification string prescribed in the Issue for each AVA |	leona_valley
name | text | the legal name given to the AVA |	Leona Valley
aka	| text | other names, including historical names, and terms used for the AVA | |
created	| date | the date of the first publication creating the AVA |
removed	| date | the date the AVA designation was removed from an area |
county | text | the county, or list of counties separated by a comma, in which the AVA exists |	Los Angeles, Ventura
state	| text | the state, or list of states separated by a comma, in which the AVA exists | CA, NV
within	| text | used for smaller AVAs that fit inside of larger AVAs; the larger AVA that this AVA sits inside | 
contains	| text | used for larger AVAs that contain smaller AVAs; the smaller AVAs that fit inside this AVA |
petitioner	| text | the name of the person who initiated the petition and their affiliation separated by a comma | Jane Smith, Smith Family Wineries
cfr_author	
cfr_index	9.212
cfr_revision_history | text | the string of text citing the documents that currently apply to this boundary definition |	[T.D. TTB-71, 73 FR 64202, Oct. 29, 2008]
approved_maps | text | the approved maps listed for the boundary defintion |(1) Ritter Ridge, Calif., 1958; Photorevised 1974; (2) Sleepy Valley, CA, 1995; (3) Del Sur, CA, 1995; and (4) Lake Hughes, CA, 1995.
boundary_description | text | the official boundary description |
used_maps	| text | the maps used to digitize the boundary |
last_revised | date | the last revision that applies to this boundary |
lcsh	| text | Library of Congress Subject Heading |
sameas	| linked data URIs for terms that are identical to this AVA |


# UC Davis Library Project Team:
Vessela Ensberg  (Program Director, Data Management Program)

[Michele Tobias](https://github.com/micheletobias) (GIS Data Curator, Data Management Program)

[Amber Reyes](https://github.com/amberreyes) (Student Employee, Data Management Program)

[Quinn Hart](https://github.com/qjhart) (Digital Applications)

Axel Borg (Wine Librarian) 

David Michalski (Geography Librarian)



