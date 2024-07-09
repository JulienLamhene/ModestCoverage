running
testGreaterThan
	| line line2 |
	line := Line new number: 5.
	line2 := Line new number: 10.
	self assert: line > line2 equals: false.
	self assert: line2 > line equals: true.