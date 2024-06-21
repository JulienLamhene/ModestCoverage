printing
printOn: aStream
	| idxLastMethod |
	idxLastMethod := (self coveredMethods at: 'methods') size.
	"super printOn: aStream."
	aStream
		nextPutAll: name;
		cr;
		nextPutAll: '{ "methods" : [ ';
		cr.
	1 to: ((coveredMethods at: 'methods') size - 1) do: [ :i |
		aStream
			nextPutAll: (self methodAt: i) name;
			nextPutAll: ',' ].
	aStream
		nextPutAll: (self methodAt: (idxLastMethod)) name;
		nextPutAll: ']';
		cr.
	aStream nextPutAll: '}'