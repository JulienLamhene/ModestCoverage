instance creation
fromXMLReport: xmlReport
	"Create a test from a report"

	^ self new
		  name: (xmlReport name copyFrom: 1 to: xmlReport name size - 4);
		  loadCoveredLines: xmlReport file;
		  allMethods: xmlReport entity