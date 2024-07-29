running
testMostTestedFile
	| test path name xmlReport mostTested|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	mostTested := test mostTestedFile.
	self assert: mostTested equals: 'Coffee.java'.