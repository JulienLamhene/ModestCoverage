running
testSingleTestFullCoverage
	| combis col |
	combis := self initializeEnv.
	col := (self initializeTestCatalog) findTestByClass: 'Coffee.java' andMethod: ((combis at: 1) method).
	self assert: (col includes: combis singleTestFullCoverage) equals: true.
	self assert: (col at: 6) equals: combis singleTestFullCoverage.