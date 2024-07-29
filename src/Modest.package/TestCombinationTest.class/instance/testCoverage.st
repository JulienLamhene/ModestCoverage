running
testCoverage
	| testC |
	testC := self setUpTest.
	self assert: testC coverage equals: 56.
	testC := TestCombination new coverage: 20.
	self assert: testC coverage equals: 20.