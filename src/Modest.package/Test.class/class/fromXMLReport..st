instance creation
fromXMLReport: xmlReport
	"Create a test from a report, the name is the name of report withou the '.xml' extenstion"
	^ self new
	name: (xmlReport name copyFrom: 1 to: (xmlReport name size - 4));
	allMethods: xmlReport entity.
