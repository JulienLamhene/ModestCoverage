Class {
	#name : #TestTest,
	#superclass : #TestCase,
	#category : 'Modest-Test'
}

{ #category : #running }
TestTest >> testAccessMethodAtClass [
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
]

{ #category : #running }
TestTest >> testCompareWithOnMethod [
	| xmlCatalog path testCatalog tests meth|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	meth := (testCatalog allMethodsFrom: 'Coffee.java') at: 3.
	tests := testCatalog findTestByClass: 'Coffee.java' andMethod: meth.
	self assert: ((tests at: 1) compareWith: (tests at: 2) onMethod: meth) equals: (tests at: 1).
	self assert: ((tests at: 2) compareWith: (tests at: 1) onMethod: meth) equals: (tests at: 1).
	self assert: ((tests at: 1) compareWith: (tests at: 4) onMethod: meth) equals: (tests at: 4).
	self assert: ((tests at: 4) compareWith: (tests at: 1) onMethod: meth) equals: (tests at: 4).
]

{ #category : #running }
TestTest >> testEquals [
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
]

{ #category : #running }
TestTest >> testFileName [
	| test path name xmlReport|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	self assert: test fileName equals: 'Coffee.java'.
]

{ #category : #running }
TestTest >> testFromXMLReport [
	| test path name xmlReport|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	self assert: test name equals: 'CoffeeTest.testCalcCoffeeIngredient_2'.
	self assert: test coveredLines size equals: 1.
	self assert: test coveredMethods size equals: 1.
]

{ #category : #running }
TestTest >> testInitialize [
	| test |
	test:= Test new.
	self assert: test name equals: ''.
	self assert: test coveredLines size equals: 0.
	self assert: test coveredMethods size equals: 0.
]

{ #category : #running }
TestTest >> testLinesOf [
	| test path name xmlReport lines collection|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	lines := (test linesOf: 'Coffee.java') collect: [:l | l number asInteger ].
	collection := OrderedCollection new.
	collection add: 3; add: 6; add: 10; add: 11; add: 12.
	self assert: lines asString equals: collection asString.
]

{ #category : #running }
TestTest >> testMethodsOf [
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
]

{ #category : #running }
TestTest >> testMostTestedFile [
	| test path name xmlReport mostTested|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFrom: path on: name.
	test:= Test fromXMLReport: xmlReport.
	mostTested := test mostTestedFile.
	self assert: mostTested equals: 'Coffee.java'.
]
