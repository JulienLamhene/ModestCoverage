Class {
	#name : #TestCatalogTest,
	#superclass : #TestCase,
	#category : #'Modest-Coverage-Tests'
}

{ #category : #tests }
TestCatalogTest >> testAllLinesOfMethodAtClass [
	| xmlCatalog path testCatalog meth lines|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	meth := testCatalog allMethodsFrom: 'Coffee.java'.
	lines := testCatalog allLinesOfMethod: (meth at: 3) atClass: 'Coffee.java'.
	self assert: lines size equals: (meth at: 3) totalLines.
	self assert: lines asString equals: 'an OrderedCollection(6 7 8 10 11 12 14 15 16 18)'.
]

{ #category : #tests }
TestCatalogTest >> testAllMethodsFrom [
	| xmlCatalog path testCatalog methods |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	methods := testCatalog allMethodsFrom: 'Hen.java'.
	self assert: methods size equals: 2.
	self assert: ((methods collect: [:m | m name]) includes: '<init>') equals: true.
	self assert: ((methods collect: [:m | m name]) includes: 'isFatEnough') equals: true.
	self assert: ((methods collect: [:m | m name]) includes: 'randomMethod') equals: false.
]

{ #category : #tests }
TestCatalogTest >> testAtFile [
	| xmlCatalog path testCatalog |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	self assert: (testCatalog atFile: 'Hen.java') equals: (testCatalog tests at: 'Hen.java').
]

{ #category : #tests }
TestCatalogTest >> testAtFileAtIdx [
	| xmlCatalog path testCatalog test report |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	report := XMLReport loadFrom: path on: 'HenTest.testGetIdentity.xml'.
	test := Test fromXMLReport: report.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	self assert: ((testCatalog atFile: 'Hen.java') at: 1) asString equals: test asString.
	report := XMLReport loadFrom: path on: 'HenTest.testGetPrice.xml'.
	test := Test fromXMLReport: report.
	self assert: ((testCatalog atFile: 'Hen.java') at: 2) asString equals: test asString.
	report := XMLReport loadFrom: path on: 'HenTest.testGetWeight.xml'.
	test := Test fromXMLReport: report.
	self assert: ((testCatalog atFile: 'Hen.java') at: 3) asString equals: test asString.
]

{ #category : #tests }
TestCatalogTest >> testAvgCoverageOnMethodAtClass [
	| xmlCatalog path testCatalog meth avg|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	meth := (testCatalog allMethodsFrom: 'Coffee.java') at: 2.
	avg := testCatalog avgCoverageOnMethod: meth atClass: 'Coffee.java'.
	self assert: avg equals: 58.6
]

{ #category : #tests }
TestCatalogTest >> testFiles [
	| xmlCatalog path testCatalog |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	self assert: testCatalog files equals: #('Duck.java' 'Coffee.java' 'Hen.java' 'BidirectionalPhoneBook.java' 'BreedingFarm.java' 'ProPhoneNumber.java' 'Goose.java').
]

{ #category : #tests }
TestCatalogTest >> testFindTestByClassAndMethod [
	| xmlCatalog path testCatalog test report meth|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	report := XMLReport loadFrom: path on: 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	test := Test fromXMLReport: report.
	meth := ((test methodsOf: 'Coffee.java') at: 2).
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	self assert: ((testCatalog findTestByClass: 'Coffee.java' andMethod: meth) at:2) asString equals: test asString.
	
]

{ #category : #tests }
TestCatalogTest >> testInitialize [
	| catalog |
	catalog := TestCatalog new.
	self assert: catalog tests size equals: 0.
]

{ #category : #tests }
TestCatalogTest >> testMostCoveredTestOnMethod [
	| xmlCatalog path testCatalog meth test test2|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog.
	meth := (testCatalog allMethodsFrom: 'Coffee.java') at: 3.
	test := testCatalog mostCoveredTest: 'Coffee.java' onMethod: meth.
	test2 := (testCatalog findTestByClass: 'Coffee.java' andMethod: meth) at: 4.
	self assert: test equals: test2.
]
