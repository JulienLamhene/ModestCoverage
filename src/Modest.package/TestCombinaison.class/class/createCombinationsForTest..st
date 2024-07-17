instance creation
createCombinationsForTest: testCollection
	| testCombi |
	testCombi := self new.
	testCombi combi: (testCollection combinations: 1).
	1 to: (testCollection size) do: [ :i | 
		testCombi combi at: i put: (testCollection combinations: i).
	].
	^ testCombi.
	