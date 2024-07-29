initialization
initializeEnv
	| testCatalog file method comb |
	testCatalog := self initializeTestCatalog.
	file := 'Coffee.java'.
	method := (testCatalog allMethodsFrom: file) at: 2.
	comb := TestCombinationCatalog createCombiOfMethod: method fromFile: file withTests: testCatalog.
	^ comb.