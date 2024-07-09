running
testInitialize
	| line |
	line := Line new.
	self assert: line number equals: 0.
	self assert: line missedInstruction equals: 0.
	self assert: line coveredInstruction equals: 0.