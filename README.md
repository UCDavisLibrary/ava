# American Viticultural Areas (ava)

The ava project is the UC Davis library plan to create a publically accessable version American Viticultural Areas.  Using the text descriptions from the ATPF Code of regulations, we will build this data from the official descriptions.  These data will be made freely availabe.

## Roadmap

Our original plan is to begin with a small region, Napa Valley. From there, we will expand to Sonoma.  We will use these examples to create our documents on the best practices for the creation of new datasets.  We will then move forward with solitating input and data from other organizations in the 

## Required Data Sets

The federal register usually uses the following datasets; USGS DRGs either F scale, and C scale.  There is an official set of DRGS that are available.  You can use these data. Often topological data is included as input.  We use the USGS DLGs for these.  It's important.  

In additon, Roads are often included in the descriptive text. The USGS DLGs also include these data as well. 

The descriptions from the federal regulations are also included in

## Schema development

identifier | type | description
---| --- | ---
identifier | integer | Local identifier for the AVA
Name | text | The official name for the AVA
Synonyms | list | comma seperated list of other or previous official names for the identifier
Start date | date | Date the final rule was published
End Date | date | If the AVA designation was removed
County | text | The county the AVA is in
State | text | The state the AVA is in (relevant later if the database expands to other states)
Document Number | text | The Federal Register document number that approved the AVA
Petitioner | text | The name of the person who petitioned for the AVA
Petitioner Affiliation | text | The affiliation or company of the person who petitioned for the AVA
Principle Author | text | The name of the person who wrote the Federal Register document
Approved Maps | text | The maps used as a reference for the boundary description
Textual description | text | the Federal registration description
CFR Index | float | The CFR Registry code location
LOC Index | string | The Library of Congress 
Wiki data | url | Link to wikidata AVA description 

### JSON Schema


### Napa Valley
``` json
```

### Methods Considerations
Minimum mapping unit
Snapping to reference layers like roads, rivers, etc.
Topology


