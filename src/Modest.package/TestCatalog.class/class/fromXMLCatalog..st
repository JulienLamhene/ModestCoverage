instance creation
fromXMLCatalog: xmlCollection
	"Create a collection of test from a collection of report"
	| testCollection |
	testCollection := OrderedCollection new.
	xmlCollection do: [ :report | testCollection add: (Test fromXMLReport: report) ].
	^ self sortByClass: testCollection.
