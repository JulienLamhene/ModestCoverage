tests
testMostCoveredTestOnMethod
	| xmlCatalog path testCatalog meth test test2|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	meth := (testCatalog allMethodsFrom: 'Coffee.java') at: 3.
	test := testCatalog mostCoveredTest: 'Coffee.java' onMethod: meth.
	test2 := (testCatalog findTestByClass: 'Coffee.java' andMethod: meth) at: 4.
	self assert: test equals: test2.