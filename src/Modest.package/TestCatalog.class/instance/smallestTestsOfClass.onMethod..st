coverage - smallest tests
smallestTestsOfClass: aClass onMethod: aMethod
	"This method return the tests having the smallest number of lines"
	| avg colsTest lines |
	lines := self allLinesOfMethod: aMethod atClass: aClass.
	colsTest := self findTestByClass: aClass andMethod: aMethod.
	avg := self avgCoverageOnMethod: aMethod atClass: aClass.
	colsTest := colsTest select: [ :t | 
		(t accessMethod: aMethod atClass: aClass) lines size <= avg
	].
	^ colsTest.