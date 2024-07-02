printing
printOn: aStream
	aStream nextPutAll: 'type : ';
	nextPutAll: type;
	tab;
	nextPutAll: 'missed : ';
	nextPutAll: missed;
	tab;
	nextPutAll: 'covered : ';
	nextPutAll: covered;cr.