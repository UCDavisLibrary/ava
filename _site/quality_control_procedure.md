# Quality Control Procedure
As we near the colmpletion of the current boundaries, it is now time to begin checking each boundary for a second time against the official description and the approved maps.

The process should proceed as follows:
1. Pick a boundary to check.
1. Comment in the issue for that boundary that you are reviewing that boundary.
1. Load the boundary's .geojson file and the list of Used Maps into QGIS.
1. Check that
  * the Used Maps were the most appropriate to use.  If not, load up other maps.
  * the attribute table for the boundary file is complete and follows our standard.  Note that State and County use | "pipe" as the separator.
  * the boundary follows the description as best it can.  Make changes as necessary.
5. Update the Used Maps column to add any additional resources you used.  Whenever possible, please only use the Approved Maps.
1. Post any questions or discussion points on the issue for the boundary you are reviewing.
1. Submit a pull request for changes you made - please submit each boundary in it's own pull request.  Or, if the boundary and attribute table don't need edits, comment on the Issue for the boundary that you've checked it and it doesn't need edits.
