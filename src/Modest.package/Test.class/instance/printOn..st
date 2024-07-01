printing
printOn: aStream
	"super printOn: aStream."
	aStream
		nextPutAll: name;
		cr;
		nextPutAll: '{ "methods" : [ ';
		cr.
	coveredMethods associationsDo: [ :asso |	
			|key meth|
			key := asso key.
			meth := asso value.
			aStream 
				nextPutAll: '-';
				tab;
				nextPutAll: key; 
				nextPutAll: ' : '.
			meth do: [ :method | 
				aStream 
					nextPutAll: method name; 
					nextPutAll: ', '
			].
			aStream cr.
		].
	aStream 
		nextPutAll: ']';
		cr;
		nextPutAll: '[ "lines" : ';
		cr.
	coveredLines associationsDo: [ :asso |	
			|key meth|
			key := asso key.
			meth := asso value.
			aStream 
				nextPutAll: '-';
				tab;
				nextPutAll: key; 
				nextPutAll: ' : '.
			meth do: [ :line | 
				aStream 
					nextPutAll: line number; 
					nextPutAll: ', '
			].
			aStream cr.
		].
		aStream nextPutAll: ']}'.