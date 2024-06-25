printing
printOn: aStream
	aStream nextPutAll: name;
	cr;
	nextPutAll: '{ "lines" : [ ';
	cr.
	1 to: (lines size - 1) do: [:i |  
		aStream 
			nextPutAll: (lines at: i) number;
			nextPutAll: ','.
	].
	aStream
		nextPutAll: (lines last) number;
		nextPutAll: ']';
		cr;
		nextPutAll: '}'.
	