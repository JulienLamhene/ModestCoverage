printing
printOn: aStream
	"super printOn: aStream."
	aStream
		nextPutAll: 'Method : ';
		nextPutAll: method name; cr;
		nextPutAll: 'File : ';
		nextPutAll: file; cr;
		nextPutAll: 'Lines : ';
		nextPutAll: (self unionCovered) asCommaString; cr;
		nextPutAll: 'Coverage : ';
		nextPutAll: coverage asString; cr;
		nextPutAll: 'Combination : [';
		nextPutAll: (combi collect: [:t | t name]) asCommaString;
		nextPutAll: ']'.