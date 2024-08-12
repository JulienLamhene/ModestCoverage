"
Our way to store all the possible combination of collection of Test

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	combinations:		<OrderedCollection> -> The storing of our combinations
	lines:		<Object> -> The objectives to reach, the lines instances establish the maximum coverage we could possibly reach
"
Class {
	#name : #TestCombinationCatalog,
	#superclass : #Object,
	#instVars : [
		'combinations',
		'lines'
	],
	#category : #'Modest-Coverage-Base'
}

{ #category : #'instance creation' }
TestCombinationCatalog class >> createCombiOfMethod: aMethod fromFile: aFile withTests: testCatalog [
	"Create our instance of TestCombinationCatalog, by making sure to already removing duplicates tests, and only taking tests concerning aMethod from aFile of testCatalog"
	| combs aTestCombCat testCollection |
	testCollection := testCatalog findTestByClass: aFile andMethod: aMethod.
	testCollection := TestCatalog removeDuplicates: testCollection.
	aTestCombCat := self new.
	combs := self createCombinationsForTest: testCollection.
	aTestCombCat lines: (testCatalog allLinesOfMethod: aMethod atClass: aFile).
	1 to: combs size do: [ :i |
		1 to: (combs at: i) size do: [ :j |
			| testC |
			testC := TestCombination new
				         method: aMethod;
				         file: aFile;
				         combi: (combs at: i at: j).
			testC unionCovered.
			aTestCombCat add: testC ] ].
	^ aTestCombCat
]

{ #category : #'instance creation' }
TestCombinationCatalog class >> createCombinationsForTest: testCollection [
	"From a collection  of testn establish a dictionnary of test with as key an index, and value combinations from this size of index"
	| testCombi |
	testCombi := Dictionary new.
	1 to: (testCollection size) do: [ :i | 
		testCombi at: i put: (testCollection combinations: i).
	].
	^ testCombi.
]

{ #category : #adding }
TestCombinationCatalog >> add: aTestCombi [
	"Add a TestCombination to our catalog"
	combinations add: aTestCombi.
]

{ #category : #accessing }
TestCombinationCatalog >> at: idx [
	"Access the TestCombination founded to the index"
	^ combinations at: idx.
]

{ #category : #private }
TestCombinationCatalog >> combOfGreatestCovNoSingleOne [
	"Return all combinations with maximum coverage exclude comb of size 1"
	^ self combinationsOfGreatestCoverage reject: [:c| c combi includes: (self singleTestFullCoverage)].
]

{ #category : #accessing }
TestCombinationCatalog >> combiOf: size [
	"Return the combination of the size wanted"
	^ combinations select: [ :c | c combi size = size ].
]

{ #category : #accessing }
TestCombinationCatalog >> combinations [
	^ combinations
]

{ #category : #'accessing - coverage' }
TestCombinationCatalog >> combinationsOfGreatestCoverage [
	"Return all combinations with maximum coverage"
	| maxCov |
	maxCov := ((combinations sorted: [:a :b | a coverage > b coverage]) at: 1) coverage.
	^ (combinations select: [ :c | c coverage = maxCov]).
]

{ #category : #'accessing - coverage' }
TestCombinationCatalog >> evenlySpreadCombiOptimized [
	| maxComb combi |
	"This method return the combinations with the most smallest test"
	maxComb:= self combOfGreatestCovNoSingleOne.
	combi := self evenlySpreadCombination combi.
	^ (maxComb reject: [ :c | c combi includesAll: combi ]) at: 1.
]

{ #category : #'accessing - coverage' }
TestCombinationCatalog >> evenlySpreadCombination [
	"Return the combination who is not the single test, but who get the maximum coverage"
	| maxComb |
	maxComb:= self combOfGreatestCovNoSingleOne.
	maxComb := maxComb sorted: [:a :b | a combi size < b combi size].
	^ maxComb at: 1.
]

{ #category : #private }
TestCombinationCatalog >> fileStudied [
	"No matter the combination, it's always the same file who is examined, this method return it"
	^ (self at: 1) file.
]

{ #category : #'accessing - testing' }
TestCombinationCatalog >> hasSingleTestFullCoverage [
	"Check if a combinations of size 1 has all lines covered"
	^ ((self combiOf: 1) detect: [ :c | c unionCovered = lines]) combi isNotEmpty.
]

{ #category : #initialization }
TestCombinationCatalog >> initialize [
	super initialize.
	combinations := OrderedCollection new.
	lines := OrderedCollection new.
]

{ #category : #accessing }
TestCombinationCatalog >> lines [
	^ lines
]

{ #category : #accessing }
TestCombinationCatalog >> lines: l [
	lines := l.
]

{ #category : #private }
TestCombinationCatalog >> methodStudied [
	"No matter the combination, it's always the same examined method, this method return it"
	^ (self at: 1) method.
]

{ #category : #'accessing - testing' }
TestCombinationCatalog >> singleTestFullCoverage [
	"Return the test who's have all lines of a method covered if it exists"
	(self hasSingleTestFullCoverage) ifTrue: [ 
		^ ((self combiOf: 1) detect: [ :c | 
			c unionCovered = (lines)]) combi at: 1] .
]

{ #category : #'accessing - coverage' }
TestCombinationCatalog >> smallestBestCombination [
	"Among the combinations with the greater coverage, this method will return the very first one, wich is the combination using the less tests"
	^ self combinationsOfGreatestCoverage at: 1.
]
