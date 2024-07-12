coverage
mostCoveredTest: aClass onMethod: aMethod
	"This method return the test with the highest coverage coming from the file used, for the method searched"
	
	"collection do: [ :t | 
		test := (test compareWith: t onMethod: aMethod).
	]."

	^ (self testsCoveredAvgFor: aClass onMethod: aMethod) at: 1.