running
testEquals
	| test test2 path name xmlReport |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test := Test fromXMLReport: xmlReport.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test2 := Test fromXMLReport: xmlReport.
	self assert: test equals: test2.
	name := 'CoffeeTest.testCalcCoffeeIngredient_5.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test2 := Test fromXMLReport: xmlReport.
	self assert: test = test2 equals: false.