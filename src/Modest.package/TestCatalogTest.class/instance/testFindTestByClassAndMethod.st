tests
testFindTestByClassAndMethod
	| xmlCatalog path testCatalog test report meth|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	report := XMLReport loadFrom: path on: 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	test := Test fromXMLReport: report.
	meth := ((test methodsOf: 'Coffee.java') at: 2).
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	self assert: ((testCatalog findTestByClass: 'Coffee.java' andMethod: meth) at:2) asString equals: test asString.
	