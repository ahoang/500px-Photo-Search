# 500px-Photo-Search

This is a Mac App that allows you to find photos on the 500px API using any search term. 
The results will display in an NSOutlineView, grouped by your search term. 
The UI will display a thumbnail of the photo along with the ISO, Aperture, and Shutterspeed used to take that photo.

I didn't have much time this week so I had to cut a few corner:
* This app follows MVVM architecture but without Reactive. 
* There are hard coded strings used as identifiers and such. I would normally move this to a constants file.
* I didn't sublcass any of the NSTableCellViews, thus I populate the cell's data in the view controller. I would normally have a separate class for the TableCellViews with its own view model, and I'd set the data for the views internally.
* Consumer Key for the API is hardcoded in the app. Normally wouldn't check-in API Keys.
