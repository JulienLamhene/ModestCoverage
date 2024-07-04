testing
isTestFor: aMethod
	| idx testName methName |
	idx := (self name asText findString: '.' startingAt: 1) + 1.
	Transcript show: aMethod name;cr.
	testName := (self name copyFrom: idx to: (self name size)) asLowercase.
	methName := aMethod name asLowercase.
	^ testName includesAll: methName.