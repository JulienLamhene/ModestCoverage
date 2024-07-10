tests
testAllMethodsFrom
	| xmlCatalog path testCatalog methods |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	methods := testCatalog allMethodsFrom: 'Hen.java'.
	self assert: methods size equals: 2.
	self assert: ((methods collect: [:m | m name]) includes: '<init>') equals: true.
	self assert: ((methods collect: [:m | m name]) includes: 'isFatEnough') equals: true.
	self assert: ((methods collect: [:m | m name]) includes: 'randomMethod') equals: false.