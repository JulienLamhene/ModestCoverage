accessing
maxCoverageForMethod: method atClass: file
	^ (self allLinesOfMethod: method atClass: file) sum: [:l | l coveredInstruction asInteger].