---
layout: default
title: How to Contribute
nav_order: 5
---

# How to Contribute

## Getting Started

### Issues

Start with the Issues Tracker
In the Issues section of the AVA project GitHub page, you should find an Issue for each AVA. All AVAs in need of digitizing have an issue open on the github repository. The issues are closed for AVAs as they are finished. AVAs are given labels to indicate their status. Open issues labeled as "In Progress" are currently being digitized by a contributor. Choose an AVA that does not have an "In Progress" label. Labels for partner organizations such as "UC Davis" or "UC Santa Barbara" indicate that the project coordinators expect these boundaries to be completed by the organization indicated. As we discuss our future partnership with Virginia Tech, the remaining Virginia and Maryland AVAs have been marked with a label for "Virginia Tech" as we anticipate that they will provide data for these AVAs in the near future.
In the text of each issue, you will find the boundary description you should use as well as the list of Approved Maps. Other attribute information will be found in the Federal Register documents. Occasionally, the text in the issue is missing either the Approved Maps or the starting point for the boundary description (due to the automated process that generated this text). To find the missing text, refer to the "src" link (meaning "source") to the official Federal Register text.
Write a comment for your chosen AVA that you are working on the boundary. Michele will change the status to "In Progress" when she sees the comment. Add additional comments if any issues or questions arise about this particular AVA. The issue for Arroyo Seco is a good example of the kinds of troubles and questions to track on an issue for an AVA.

### Digitizing Boundaries

New AVAs and boundary updates for existing AVAs are added to the Federal Register.  Our web scraping code checks this document regularly, and each new AVA or boundary revision is given it's own issue.  If you see one of these issues not yet assigned to a contributor or partner organization, and not labeleled "In Progress", you are encouraged to digitize it!  Comment on the issue that you would like to work on and one of our team members will assign it to you.  You may then digitize the new AVA following our digitizing [methods](methods).


### Quality Control

As we near the colmpletion of the current boundaries, it is now time to begin checking each boundary for a second time against the official description and the approved maps.

The process should proceed as follows:
1. Pick a boundary to check.
1. Comment in the issue for that boundary that you are reviewing that boundary.
1. Load the boundary's .geojson file and the list of Used Maps into QGIS.
1. Check that
  * the Used Maps were the most appropriate to use.  If not, load up other maps.
  * the attribute table for the boundary file is complete and follows our standard.  Note that State and County use \| (pipe) as the separator.
  * the boundary follows the description as best it can.  Make changes as necessary.
5. Update the Used Maps column to add any additional resources you used.  Whenever possible, please only use the Approved Maps.
1. Post any questions or discussion points on the issue for the boundary you are reviewing.
1. Submit a pull request for changes you made - please submit each boundary in it's own pull request.  Or, if the boundary and attribute table don't need edits, comment on the Issue for the boundary that you've checked it and it doesn't need edits.