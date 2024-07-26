running
testEqual
	| line line2 |
	line := Line new number: 5.
	line2 := Line new number: 5.
	self assert: (line number) = (line2 number) equals: true.
	self assert: (line missedInstruction) = (line2 missedInstruction) equals: true.
	self assert: (line coveredInstruction) = (line2 coveredInstruction) equals: true.
	"And so :"
	self assert: line = line2 equals: true.