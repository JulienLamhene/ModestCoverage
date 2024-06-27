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
		nextPutAll: '}'.