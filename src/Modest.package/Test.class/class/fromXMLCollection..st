instance creation
fromXMLCollection: xmlCollection
	"Create a collection of test from a collection of report"
	| testCollection |
	testCollection := OrderedCollection new.
	xmlCollection do: [ :report | testCollection add: (self fromXMLReport: report) ].
	^ testCollection.
