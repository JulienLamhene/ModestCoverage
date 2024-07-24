instance creation
createCombiOfMethod: aMethod fromFile: aFile withTests: testCatalog
	| combs aTestCombCat testCollection |
	testCollection := testCatalog findTestByClass: aFile andMethod: aMethod.
	aTestCombCat := self new.
	combs := self createCombinationsForTest: testCollection.
	aTestCombCat lines: (testCatalog allLinesOfMethod: aMethod atClass: aFile).
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