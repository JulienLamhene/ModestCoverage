initialization
setUpTest
	| xmlCatalog path file testCatalog method comb |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	file := 'Coffee.java'.
	method := (testCatalog allMethodsFrom: file) at: 2.
	comb := TestCombinationCatalog createCombiOfMethod: method fromFile: file withTests: testCatalog.
	^ comb at: 10.