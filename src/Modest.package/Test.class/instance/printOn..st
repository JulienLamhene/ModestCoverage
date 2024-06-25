printing
printOn: aStream
	"super printOn: aStream."
	aStream
		nextPutAll: name;
		cr;
		nextPutAll: '{ "methods" : [ ';
		cr.
	coveredMethods do: [ :meth |	
			aStream 
				nextPutAll: (meth printString);
				nextPutAll: ','.
			].
	aStream 
		nextPutAll: ']';
		nextPutAll: '}'.