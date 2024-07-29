running
testSize
	| testC |
	testC := self setUpTest.
	self assert: testC combi size equals: 2.