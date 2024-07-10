running
testCompareWithOnMethod
	| xmlCatalog path testCatalog tests meth|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	meth := (testCatalog allMethodsFrom: 'Coffee.java') at: 3.
	tests := testCatalog findTestByClass: 'Coffee.java' andMethod: meth.
	self assert: ((tests at: 1) compareWith: (tests at: 2) onMethod: meth) equals: (tests at: 1).
	self assert: ((tests at: 2) compareWith: (tests at: 1) onMethod: meth) equals: (tests at: 1).
	self assert: ((tests at: 1) compareWith: (tests at: 4) onMethod: meth) equals: (tests at: 4).
	self assert: ((tests at: 4) compareWith: (tests at: 1) onMethod: meth) equals: (tests at: 4).