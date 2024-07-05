coverage
mostCoveredTest: aClass onMethod: aMethod
	| avg collection test |
	collection := self findTestByClass: aClass andMethod: aMethod.
	
	avg := ((collection sum: [ :t | (t accessMethod: aMethod atClass: aClass) coverageByLine ]) / collection size) asFloat.
	
	collection := collection select: [ :t | (t accessMethod: aMethod atClass: aClass) coverageByLine >= avg ].
	test := (collection at: 1).
	collection do: [ :t | 
		test := (test compareWith: t onMethod: aMethod).
	].
	^ test.