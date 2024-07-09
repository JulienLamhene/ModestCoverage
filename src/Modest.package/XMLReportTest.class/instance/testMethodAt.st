running
testMethodAt
	|entity file document path xmlReport name|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	document := XMLDOMParser parse: (((path, name) asFileReference) readStream upToEnd).
	entity := document xpath: '//class'.
	file := document xpath: '//sourcefile'.
	entity := (entity select: [ :node | node nodes isNotEmpty ]) 
		select: [ :node |
			((node elementAt: 'counter') attributeAt: 'covered') asInteger > 0 	].
	file := (file select: [ :node | node nodes isNotEmpty ]) 
		select: [ :node |
			((node elementAt: 'counter') attributeAt: 'covered') asInteger > 0 	].
	self assert: (xmlReport methodAt: 1) asString equals: (entity at: 1) asString.
	self assert: xmlReport file asString equals: file asString.