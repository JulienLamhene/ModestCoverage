Class {
	#name : #TestCatalogTest,
	#superclass : #TestCase,
	#category : #'Modest-Coverage-Tests'
}

{ #category : #'instance creation' }
TestCatalogTest class >> loadCatalog [
	| testCat xmlCat |
	xmlCat := XMLCatalog loadAllFromBridge.
	testCat := TestCatalog fromXMLCatalog: xmlCat.
	^ testCat.
]

{ #category : #'instance creation' }
TestCatalogTest >> loadCatalog [
	^ self class loadCatalog.
]

{ #category : #tests }
TestCatalogTest >> testAllLinesOfMethodAtClass [
	| testCatalog meth lines|
	testCatalog := self loadCatalog.
	meth := testCatalog allMethodsFrom: 'Coffee.java'.
	lines := testCatalog allLinesOfMethod: (meth at: 2) atClass: 'Coffee.java'.
	self assert: lines size equals: (meth at: 2) totalLines.
	self assert: lines asString equals: 'an OrderedCollection(6 7 8 10 11 12 14 15 16 18)'.
]

{ #category : #tests }
TestCatalogTest >> testAllMethodsFrom [
	| testCatalog methods |
	testCatalog := self loadCatalog.
	methods := testCatalog allMethodsFrom: 'Hen.java'.
	self assert: methods size equals: 2.
	self assert: ((methods collect: [:m | m name]) includes: '<init>') equals: true.
	self assert: ((methods collect: [:m | m name]) includes: 'isFatEnough') equals: true.
	self assert: ((methods collect: [:m | m name]) includes: 'randomMethod') equals: false.
]

{ #category : #tests }
TestCatalogTest >> testAtFile [
	| testCatalog |
	testCatalog := self loadCatalog.
	self assert: (testCatalog atFile: 'Hen.java') equals: (testCatalog tests at: 'Hen.java').
]

{ #category : #tests }
TestCatalogTest >> testAtFileAtIdx [
	| testCatalog test report |
	report := XMLReport loadFile: 'HenTest.testGetIdentity.xml'.
	test := Test fromXMLReport: report.
	testCatalog := self loadCatalog.
	self assert: ((testCatalog atFile: 'Hen.java') at: 1) asString equals: test asString.
	report := XMLReport loadFile: 'HenTest.testGetPrice.xml'.
	test := Test fromXMLReport: report.
	self assert: ((testCatalog atFile: 'Hen.java') at: 2) asString equals: test asString.
	report := XMLReport loadFile: 'HenTest.testGetWeight.xml'.
	test := Test fromXMLReport: report.
	self assert: ((testCatalog atFile: 'Hen.java') at: 3) asString equals: test asString.
]

{ #category : #tests }
TestCatalogTest >> testAvgCoverageOnMethodAtClass [
	| testCatalog meth avg|
	testCatalog := self loadCatalog.
	meth := (testCatalog allMethodsFrom: 'Coffee.java') at: 2.
	avg := testCatalog avgCoverageOnMethod: meth atClass: 'Coffee.java'.
	self assert: avg equals: 58.6
]

{ #category : #tests }
TestCatalogTest >> testFiles [
	| testCatalog |
	testCatalog := self loadCatalog.
	self assert: testCatalog files equals: #('Duck.java' 'Coffee.java' 'Hen.java' 'BidirectionalPhoneBook.java' 'BreedingFarm.java' 'ProPhoneNumber.java' 'Goose.java').
]

{ #category : #tests }
TestCatalogTest >> testFindTestByClassAndMethod [
	| testCatalog test report meth|
	report := XMLReportTest loadReport.
	test := Test fromXMLReport: report.
	meth := ((test methodsOf: 'Coffee.java') at: 2).
	testCatalog := self loadCatalog.
	self assert: ((testCatalog findTestByClass: 'Coffee.java' andMethod: meth) at:2) asString equals: test asString.
	
]

{ #category : #tests }
TestCatalogTest >> testInitialize [
	| catalog |
	catalog := TestCatalog new.
	self assert: catalog tests size equals: 0.
]
