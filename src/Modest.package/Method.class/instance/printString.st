printing
printString
	| aStream |
	aStream := '' writeStream.
	aStream nextPutAll: name;
	cr;
	nextPutAll: '{ "lines" : [ '.
	1 to: (lines size - 1) do: [:i |  
		aStream 
			nextPutAll: (lines at: i) number;
			nextPutAll: ','.
	].
	aStream
		nextPutAll: (lines last) number;
		nextPutAll: ']';
		nextPutAll: '}';
		cr.
	^ aStream contents.
	