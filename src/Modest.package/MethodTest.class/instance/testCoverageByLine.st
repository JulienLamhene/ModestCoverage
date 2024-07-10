running
testCoverageByLine
	| xmlReport test path method otherM|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlReport := XMLReport loadFrom: path on: 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	test := Test fromXMLReport: xmlReport.
	otherM := (test methodsOf: 'Coffee.java') at: 1.
	method := (test methodsOf: 'Coffee.java') at: 2.
	self assert: method coverageByLine equals: 40.0.
	self assert: otherM coverageByLine equals: 100.0.