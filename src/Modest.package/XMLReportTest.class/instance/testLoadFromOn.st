running
testLoadFromOn
	|xmlReport path|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlReport := XMLReport loadFrom: path on: 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	self assert: xmlReport name equals: 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	self assert: xmlReport path equals: path.
	self assert: xmlReport fileName equals: 'Coffee'.