running
testInitialize
	| test |
	test:= Test new.
	self assert: test name equals: ''.
	self assert: test coveredLines size equals: 0.
	self assert: test coveredMethods size equals: 0.