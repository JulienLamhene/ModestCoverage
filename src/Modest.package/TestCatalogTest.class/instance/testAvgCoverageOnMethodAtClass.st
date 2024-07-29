tests
testAvgCoverageOnMethodAtClass
	| xmlCatalog path testCatalog meth avg|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	meth := (testCatalog allMethodsFrom: 'Coffee.java') at: 2.
	avg := testCatalog avgCoverageOnMethod: meth atClass: 'Coffee.java'.
	self assert: avg equals: 58.6