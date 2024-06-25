accessing
className
	| idx |
	idx := name asText findString: '.' startingAt: 1.
	^ name copyFrom: 1 to: (idx - 5)