coverage - most lines covered
testsCoveredAvgFor: aClass onMethod: aMethod
	"This method return the tests with the highest coverage coming from the file used, for the method searched"
	| avg collection |
	collection := self findTestByClass: aClass andMethod: aMethod.
	
	avg := self avgCoverageOnMethod: aMethod atClass: aClass.
	
	collection := collection select: [ :t | (t accessMethod: aMethod atClass: aClass) coverageByLine >= avg].
	
	collection := collection sorted: [ :a :b | (a accessMethod: aMethod atClass: aClass) >= (b accessMethod: aMethod atClass: aClass)].
	
	^ collection.