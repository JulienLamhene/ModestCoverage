coverage - smallest tests
smallestTestsOfClass: aClass onMethod: aMethod
	"This method return the tests having the smallest number of lines"
	| avg colsTest lines |
	lines := self allLinesOfMethod: aMethod atClass: aClass.
	colsTest := self testsCoveredAvgFor: aClass onMethod: aMethod.
	avg := ((colsTest sum: [ :t | (t accessMethod: aMethod atClass: aClass) lines size ]) / colsTest size) asFloat.
	colsTest := colsTest select: [ :t | 
		(t accessMethod: aMethod atClass: aClass) lines size >= avg
	].
	^ colsTest.