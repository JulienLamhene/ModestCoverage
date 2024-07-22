instance creation
createCombinationsForTest: testCollection
	| testCombi |
	testCombi := Dictionary new.
	1 to: (testCollection size) do: [ :i | 
		testCombi at: i put: (testCollection combinations: i).
	].
	^ testCombi.