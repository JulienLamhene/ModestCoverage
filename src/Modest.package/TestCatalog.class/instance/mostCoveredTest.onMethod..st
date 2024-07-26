coverage - most lines covered
mostCoveredTest: aClass onMethod: aMethod
	"This method return the test with the highest coverage coming from the file used, for the method searched"
	^ (self testsCoveredAvgFor: aClass onMethod: aMethod) at: 1.