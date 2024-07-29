running
testInitialize
	| testC |
	testC := TestCombination new.
	self assert: testC combi size equals: 0.
	self assert: testC file equals: ''.
	self assert: testC method equals: (Method new).