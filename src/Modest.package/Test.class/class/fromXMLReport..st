instance creation
fromXMLReport: xmlReport
	^ self new
	name: (xmlReport name copyFrom: 1 to: (xmlReport name size - 4));
	allMethods: xmlReport entity.
