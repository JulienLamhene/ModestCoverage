tests
testAtFileAtIdx
	| xmlCatalog path testCatalog test report |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	report := XMLReport loadFrom: path on: 'HenTest.testGetIdentity.xml'.
	test := Test fromXMLReport: report.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	self assert: ((testCatalog atFile: 'Hen.java') at: 1) asString equals: test asString.
	report := XMLReport loadFrom: path on: 'HenTest.testGetPrice.xml'.
	test := Test fromXMLReport: report.
	self assert: ((testCatalog atFile: 'Hen.java') at: 2) asString equals: test asString.
	report := XMLReport loadFrom: path on: 'HenTest.testGetWeight.xml'.
	test := Test fromXMLReport: report.
	self assert: ((testCatalog atFile: 'Hen.java') at: 3) asString equals: test asString.