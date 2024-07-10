tests
testAllLinesOfMethodAtClass
	| xmlCatalog path testCatalog meth lines|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	meth := testCatalog allMethodsFrom: 'Coffee.java'.
	lines := testCatalog allLinesOfMethod: (meth at: 3) atClass: 'Coffee.java'.
	self assert: lines size equals: (meth at: 3) totalLines.
	self assert: lines asString equals: 'an OrderedCollection(6 7 8 10 11 12 14 15 16 18)'.