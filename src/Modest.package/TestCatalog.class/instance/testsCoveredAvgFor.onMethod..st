coverage - most lines covered
testsCoveredAvgFor: aClass onMethod: aMethod
	"This method return the tests with the highest coverage coming from the file used, for the method searched"
	| avg collection |
	collection := self findTestByClass: aClass andMethod: aMethod.
	
	avg := ((collection sum: [ :t | (t accessMethod: aMethod atClass: aClass) coverageByLine ]) / collection size) asFloat.
	
	collection := collection select: [ :t | (t accessMethod: aMethod atClass: aClass) coverageByLine >= 50.0 ].
	
	collection := collection sorted: [ :a :b | (a accessMethod: aMethod atClass: aClass) >= (b accessMethod: aMethod atClass: aClass)].
	"coffeeTest := coffeeTest sorted: [:a :b| (a accessMethod: method atClass: file) lines size > (b accessMethod: method atClass: file) lines size ]."	
	^ collection.