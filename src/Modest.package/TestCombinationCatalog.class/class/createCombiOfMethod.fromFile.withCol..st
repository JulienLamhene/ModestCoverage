instance creation
createCombiOfMethod: aMethod fromFile: aFile withCol: testCollection
	| combs aTestCombCat |
	aTestCombCat := self new.
	combs := self createCombinationsForTest: testCollection.
	1 to: combs size do: [ :i |
		1 to: (combs at: i) size do: [ :j |
			| testC |
			testC := TestCombination new
				         method: aMethod;
				         file: aFile;
				         combi: (combs at: i at: j).
			testC unionCovered.
			aTestCombCat add: testC ] ].
	^ aTestCombCat