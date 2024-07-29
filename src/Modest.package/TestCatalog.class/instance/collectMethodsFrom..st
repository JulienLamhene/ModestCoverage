accessing
collectMethodsFrom: aFile
	"Collect all methods used in aFile"
	| methods |
	methods := Set new.
	(tests do: [ :file | 
	file do: [ :t | 
		(t coveredMethods) associationsDo: [ :asso | 
			(asso key = aFile) ifTrue: [ 
				methods add: (asso value) ] ] ] ]).
	^ methods flattened.