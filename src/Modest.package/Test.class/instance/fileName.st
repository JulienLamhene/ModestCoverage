accessing
fileName
	"Return the name suffixed by '.java'"
	| idx |
	idx := (self name includesAny: '.')
		       ifTrue: [ (name asText findString: '.' startingAt: 1) - 5 ]
		       ifFalse: [ (name asText findString: '_' startingAt: 1) - 1 ].
	^ (name copyFrom: 1 to: idx) , '.java'