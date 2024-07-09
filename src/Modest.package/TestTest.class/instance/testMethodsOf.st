running
testMethodsOf
	| test path name xmlReport methods collection|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	methods := test methodsOf: 'Coffee.java'.
	methods := methods collect: [:m | m name ].
	collection := OrderedCollection new.
	collection add: '<init>'; add: 'calcCoffeeIngredient'.
	self assert: methods asString equals: collection asString.