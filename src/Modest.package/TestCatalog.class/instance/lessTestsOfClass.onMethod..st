coverage - less tests
lessTestsOfClass: aClass onMethod: aMethod
	"Based on the criteria less tests possibles, this method will take the most covered test and compared with the others to only kept the ones with differents lines"
	| avg colsTest test lines |
	colsTest := self findTestByClass: aClass andMethod: aMethod.
	test := self mostCoveredTest: aClass onMethod: aMethod.
	lines := (test accessMethod: aMethod atClass: aClass) lines.
	avg := self avgCoverageOnMethod: aMethod atClass: aClass.
	colsTest := colsTest reject: [ :t | 
		lines includesAll: (t accessMethod: aMethod atClass: aClass) lines 
	].
	colsTest add: test.
	"Since we reject all test who contains the same, the test used for comparaison also are rejected, and so the need to put him back in the collection"
	^ colsTest.