# American Viticultural Areas (AVA) Project

The UC Davis library, in conjunction with UCSB, Virginia Tech, other partner organizations, and contributions from the general public, will create a publicly accessible version American Viticultural Areas boundaries.  Using the text descriptions from the ATPF Code of regulations, we will build this data from the official descriptions.  These data will be made freely available.  This dataset will provide wine researchers with an important tool as they examine the scientific, economic and historical aspects of viticulture.

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
Read the [GettingStarted.md](https://github.com/UCDavisLibrary/ava/blob/master/GettingStarted.md), [digitizing_ava_boundaries.md](https://github.com/UCDavisLibrary/ava/blob/master/digitizing_ava_boundaries.md), and [quality control procedure.md](/quality_control_procedure.md) files to familiarize yourself with the policies and procedures for this project.

The project will now shift to creating historical boundaries and to quality control and we welcome contributions to both of these efforts.

## Progress
As of March 20, 2020, California's boundaries are complete and have undergone our quality control procedure. We feel that the current data for California is of high quality and suitable for use in academic research, however, please submit an Issue if you find additional areas of concern in the dataset so we can address them.

All the remaining AVA boundaries outside of California have been completed, as of May 11,2020, and we are beginning quality control procedures on these data.

New AVAs that were approved by the TTB between June and October 2020 are in the process of being added to our dataset.

### UC Davis
UC Davis completed boundaries for the northern California, Arizona, and Colorado AVAs.  Issues marked with the "UC Davis" label are designated for UC Davis to work on.  They will continue adding AVAs moving east across the county.

### UC Santa Barbara
UC Santa Barbara completed boundaries for the southern California AVAs (marked with the "UC Santa Barbara" label in the Issues list) November 2017 and have subsequently contributed many boundaries in Oregon and Washigton.

### Virginia Tech
Virginia Tech plans to complete boundaries in and around Virginia.  These boundaries are marked with the "Virginia Tech" label in the Issues list.

### Additional Partnerships
University entities (departments, labs, research groups, etc.) or other organizations interested in becoming project partners should contact us.  We're happy to discuss new partnerships in building this and similar datasets!  A partnership is not necessary, however, to contribute.


## Attribute Data Definitions

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

# How can you access the data?

## Download the whole repository
You can use the green download button on the Code tab of this repository to download all of the files in this repository or you can fork this repository.  Finished states are available for download in the AVAs By State folder.

## Download just the AVAs file or individual AVA boundaries
You can download single .geojson files (including the avas.geojson file that has all of the boundaries) by:
1. On the Code tab, navigate to the file you would like to download, and click on the file name.
1. Click the Download button, which will take you to a page that displays the text of the document.
1. Right click anywhere on the page, and select "Save as..." 
1. Save the file where you would like to keep it.  You may need to remove an additional .txt extension that may get automatically added to the file name.  You file extension should be .geojson

# What is the long-term plan for this data?
Version 1.0 will be released once all of the AVAs in California are completed and proofed for quality.  The data will be offered as a fixed set of boundaries (no longer updated) here on our GitHub site but also in the UC Davis Library Digital Asset Management System.  Work will continue on additional AVA boundaries.  Definitions for additional versions will depend on partnerships and resource availability.

# UC Davis DataLab & Library Project Team:

[Michele Tobias](https://github.com/micheletobias) (Geospatial Data Specialist, DataLab, Data & Digital Scholarship)

[Vessela Ensberg](https://www.library.ucdavis.edu/author/vessela-ensberg/)  (Online Strategies)

[Quinn Hart](https://github.com/qjhart) (Digital Applications)

[Axel Borg](https://www.library.ucdavis.edu/author/axel-borg/) (Wine Librarian, Research Support Services) 

[David Michalski](https://www.library.ucdavis.edu/author/david-michalski/) (Geography Librarian, Research Support Services)

[Michael Colby](https://www.library.ucdavis.edu/author/michael-colby/) (Librarian, Content Support Services)

[Amber Reyes](https://github.com/amberreyes) (Student Employee, Data Management Program, from April - July 2017)

[Yao Fang](https://github.com/fyfangyao) (Student Employee, Data Management Program, from October 2017 - June 2018)

[Soo Min Hur](https://github.com/SoominHur) (Student Employee, Data Management Program, November 2018 - June 2019)

[David Li](https://github.com/davidkli) (Student Employee, DataLab, October 2019 - July 2020)

[Elijah Stockwell](https://github.com/elistockwell) (Student Employee, DataLab, Starting October 2020)

[Kelley Chu](https://github.com/kelleych) (Intern, DataLab, Starting April 2021)

**Consultants:**

[Jennifer Harbster](https://www.library.ucdavis.edu/author/jennifer-jj-harbster/) (Librarian, Research Support Services)

[Michael Wolfe](https://www.library.ucdavis.edu/author/michael-wolfe/) (Scholarly Communications Officer)

# UCSB Library Project Team:
[Tom Brittnacher](https://github.com/tbrittnacher) (Geospatial Data Curator)

[Andrew Jessup](https://github.com/andrewjessup) (Collaboratory Services Specialist)

Maga Kim (Undergraduate; Collaboratory Staff)

Timothy Kwong (Undergraduate; Collaboratory Staff)

# Virginia Tech Project Team:

[Peter Sforza](https://www.cgit.vt.edu/people/biographies/peter-sforza.html) (Director, Center for Geospatial Information Technology)

[Eric West](https://github.com/ericallanwest) (Geospatial Analyst, Center for Geospatial Information Technology)

# Other Contributors
[Alex Mandel](https://github.com/wildintellect) (UC Davis Center for Spatial Sciences)

[Grant Miller-Francisco](https://github.com/gdmf)

[Kyle W. Smith](https://github.com/KyleWSmith)

[ouwxmaniac](https://github.com/ouwxmaniac)

[Arielle Rose](https://github.com/ariellerose) (Intern, UC Davis Center for Spatial Sciences)

[Sierra Mabanta](https://github.com/sierramabanta) (Intern, UC Davis Center for Spatial Sciences)

[Brian Lee](https://github.com/bsllee) (UC Davis Economics Alumni)

[Innisfree McKinnon](https://github.com/InnisfreeM) (Assistant Professor, University of Wisconsin, Stout)

[Daniel O'Brien](https://github.com/dannyo33) (Intern, UC Davis Center for Spatial Sciences)

[Anna Gard](https://github.com/amgard) (Intern, UC Davis Center for Spatial Sciences)

[Alexenia Aldape](https://github.com/Alexenia) (UC Davis Alumni & Intern, UC Davis Center for Spatial Sciences)

[Steve De Long](https://github.com/sdelong)

[Arturo P. Rios](https://github.com/APRios)

[Kurtis Houser](https://github.com/kurtishouser)

# Awards, Publications, & Projects Using Our Data

Tobias, M.M. & C.C. Myles. 2021. "Wine, culture, and environment: A study of the Sierra (Nevada) Foothills American Viticultural Area" in *Handbook of Wine and Culture*, Tim Unwin, ed. Routledge. (In progress)

Cantu, et al. 2021. [Investigating the impact of regionality on the sensorial and chemical aging characteristics of Pinot noir grown throughout the U.S. West coast.](https://www.sciencedirect.com/science/article/abs/pii/S030881462031582X).  *Food Chemistry* 337(2021).

Myles, C.C., M.M. Tobias, & I. McKinnon. 2020. “‘A big fish in a small pond’: How Arizona wine country was made” in [*Agritourism, Wine Tourism, Craft Beer Tourism: Local Responses to peripherality through tourism niches.*](https://www.routledge.com/Agritourism-Wine-Tourism-and-Craft-Beer-Tourism-Local-Responses-to-Peripherality/Pezzi-Faggian-Reid/p/book/9781138614413)  Maria Giulia Pezzi (GSSI), Alessandra Faggian (GSSI), Neil Reid (University of Toledo, OH), eds.

2018 [Sautter Award](https://www.ucop.edu/information-technology-services/initiatives/sautter-award-program/award-winners-and-applications/2018.html) - Silver - for Innovation in Information Technologies, awarded by the University of California Office of the President.

Bizou Wine's ["Mapping Our Wines"](http://www.bizouwines.com/mapping-our-wines)

Have you used the AVA project in your work?  Please let us know! mmtobias [at] ucdavis.edu

# License
The licence for this data is [Creative Commons CC0](https://creativecommons.org/share-your-work/public-domain/cc0/).  We encourage citation of this dataset when it is used in academic works.


# Disclaimer
The American Viticulture Areas (AVA) Project data is provided for educational purposes only. Data and materials may not be accurate or complete, and are provided as-is, without warranties of any kind. Please note that while every effort was made to digitize the data from the maps designated in the official descriptions of the boundaries from the Alcohol and Tobacco Tax and Trade Bureau, some substitutions were made and are noted in the attribute table.
