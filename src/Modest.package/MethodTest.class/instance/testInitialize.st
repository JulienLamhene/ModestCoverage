running
testInitialize
	| m |
	m := Method new.
	self assert: m name equals: ''.
	self assert: m desc equals: ''.
	self assert: m counters size equals: 0.
	self assert: m lines size equals: 0.