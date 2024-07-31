Class {
	#name : #TestCombinationCatalogTest,
	#superclass : #TestCase,
	#category : #'Modest-Coverage-Tests'
}

{ #category : #initialization }
TestCombinationCatalogTest >> initializeEnv [
	| testCatalog file method comb |
	testCatalog := self initializeTestCatalog.
	file := 'Coffee.java'.
	method := (testCatalog allMethodsFrom: file) at: 2.
	comb := TestCombinationCatalog createCombiOfMethod: method fromFile: file withTests: testCatalog.
	^ comb.
]

{ #category : #initialization }
TestCombinationCatalogTest >> initializeTestCatalog [
	| xmlCatalog path testCatalog |
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	xmlCatalog := XMLCatalog loadAllFrom: path.
	testCatalog := TestCatalog fromXMLCatalog: xmlCatalog..
	^ testCatalog.
]

{ #category : #running }
TestCombinationCatalogTest >> testCombiOf [
	| combis combOfOne |
	combis := self initializeEnv.
	combOfOne := combis combinations select: [ :c | c combi size = 1 ].
	self assert: (combis combiOf: 1) equals: combOfOne.
]

{ #category : #running }
TestCombinationCatalogTest >> testHasSingleTestFullCoverage [
	| combis |
	combis := self initializeEnv.
	"By how initializeEnv is created, there is one tests among the comb of combis, who have all the coverage possible"
	self assert: (combis hasSingleTestFullCoverage) equals: true.
]

{ #category : #running }
TestCombinationCatalogTest >> testInitialize [
	| combis |
	combis := TestCombinationCatalog new.
	self assert: combis combinations size equals: 0.
	self assert: combis lines size equals: 0.
]

{ #category : #running }
TestCombinationCatalogTest >> testSingleTestFullCoverage [
	| combis col |
	combis := self initializeEnv.
	col := (self initializeTestCatalog) findTestByClass: 'Coffee.java' andMethod: ((combis at: 1) method).
	self assert: (col includes: combis singleTestFullCoverage) equals: true.
	self assert: (col at: 6) equals: combis singleTestFullCoverage.
]

{ #category : #running }
TestCombinationCatalogTest >> testSmallestBestcombination [
	"Return all combinations with maximum coverage"
	| combis comb|
	combis := TestCombinationCatalog new.
	combis 
		add: (TestCombination new coverage: 5);
		add: (TestCombination new coverage: 1);
		add: (TestCombination new coverage: 5);
		add: (TestCombination new coverage: 3).
	comb := (TestCombination new coverage: 5).
	self assert: combis smallestBestCombination asString equals: comb asString.
]

{ #category : #running }
TestCombinationCatalogTest >> testcombinationsOfGreatestCoverage [
	"Return all combinations with maximum coverage"
	| combis col comb|
	combis := TestCombinationCatalog new.
	combis 
		add: (TestCombination new coverage: 5);
		add: (TestCombination new coverage: 1);
		add: (TestCombination new coverage: 5);
		add: (TestCombination new coverage: 3).
	comb := (TestCombination new coverage: 5).
	col := OrderedCollection new.
	col add: comb; add: comb.
	self assert: combis combinationsOfGreatestCoverage asString equals: col asString.
]
