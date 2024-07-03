coverage
compareWith: aTest onMethod: aMethod
	"Return the element with a greater Coverage on the method in parameter"
	| m1 m2 result |
	m1 := self accessMethod: aMethod atClass: (self fileName).
	m2 := aTest accessMethod: aMethod atClass: (aTest fileName).
	result := m1 coverageByLine > m2 coverageByLine.
	(result) ifTrue: [ ^ self ] ifFalse: [ ^ aTest ].