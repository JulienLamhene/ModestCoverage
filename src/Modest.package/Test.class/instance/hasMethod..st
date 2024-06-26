testing
hasMethod: aMethodName
	| aSet |
	aSet := coveredMethods collect: [ :method | method name ].
	^ aSet includes: aMethodName.