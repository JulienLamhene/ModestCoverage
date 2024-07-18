instance creation
createCombinationsForTest: testCollection
	| testCombi |
	testCombi := self new.
	1 to: (testCollection size) do: [ :i | 
		testCombi combi at: i put: (testCollection combinations: i).
	].
	^ testCombi.
	