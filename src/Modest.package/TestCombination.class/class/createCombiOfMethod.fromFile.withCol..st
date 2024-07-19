instance creation
createCombiOfMethod: method fromFile: file withCol: testCollection
	| combinations comb |
	combinations := TestCombinaison createCombinationsForTest: testCollection.
	combinations method: method; file: file.
	comb := OrderedCollection new.
	1 to: (combinations combi size) do: [ :i | 
		1 to: ((combinations at: i) size) do: [ :j |
			| testC |
			testC := (self new method: method; file: file; combi: 	(combinations at:i at: j)).
			testC unionCovered.
			comb add: testC.
		]
	].
	^comb.