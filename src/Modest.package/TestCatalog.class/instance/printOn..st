printing
printOn: aStream

	tests associationsDo: [ :asso |
		| key value |
		key := asso key.
		value := asso value.
		aStream
			nextPutAll: key;
			cr.
		value do: [ :val |
			aStream
				nextPutAll: '-';
				tab;
				nextPutAll: val name;
				cr.
			].
		]