running
testLinesOf
	| test path name xmlReport lines collection|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	lines := (test linesOf: 'Coffee.java') collect: [:l | l number asInteger ].
	collection := OrderedCollection new.
	collection add: 3; add: 6; add: 10; add: 11; add: 12.
	self assert: lines asString equals: collection asString.