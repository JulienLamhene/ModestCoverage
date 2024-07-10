tests
testAtFile
	| xmlCatalog path testCatalog |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	self assert: (testCatalog atFile: 'Hen.java') equals: (testCatalog tests at: 'Hen.java').