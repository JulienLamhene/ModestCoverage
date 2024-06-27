testing
hasMethod: aMethodName
	| aSet |
	aSet := coveredMethods select: [ :methods | 
		methods collect: [ :meth | meth name ] ].
	^ aSet includes: aMethodName.