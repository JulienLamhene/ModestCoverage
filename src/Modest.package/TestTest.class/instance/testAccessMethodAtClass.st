running
testAccessMethodAtClass
	| test path name xmlReport methods method meth|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	methods := test methodsOf: 'Coffee.java'.
	method := methods at: 2.
	meth := test accessMethod: method atClass: 'Coffee.java'.
	self assert: method printString equals: 'calcCoffeeIngredient
{ "lines" : [6,10,11,12]}
'.
	self assert: meth equals: method.