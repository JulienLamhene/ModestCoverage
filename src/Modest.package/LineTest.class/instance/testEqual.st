running
testEqual
	| line line2 |
	line := Line new number: 5.
	line2 := Line new number: 5.
	self assert: line = line2 equals: true.