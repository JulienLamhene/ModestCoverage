running
testFileName
	| test path name xmlReport|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	self assert: test fileName equals: 'Coffee.java'.