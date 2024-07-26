accessing
avgCoverageOnMethod: aMethod atClass: aClass
	"Calculate average coverage for a method from a file"
	| avg collection |
	collection := self findTestByClass: aClass andMethod: aMethod.
	
	avg := ((collection sum: [ :t | (t accessMethod: aMethod atClass: aClass) coverageByLine ]) / collection size) asFloat.
	
	^ avg.