"
A TestCatalog is kind of a library for our tests, where for a category (a file), we find all the tests concerning this one file
To put in a clear exemple, looking into the key 'FileA.java', will return all the tests using methods coming from this file

Internal Representation and Key Implementation Points.

Instance Variables
tests:		<Dictionnary> -> A Dictionnary with the relation file -> OrderedCollection of Test

"
Class {
	#name : #TestCatalog,
	#superclass : #Object,
	#instVars : [
		'tests'
	],
	#category : 'Modest-Base'
}

{ #category : #'instance creation' }
TestCatalog class >> fromXMLCatalog: xmlCollection [
	"Create a collection of test from a collection of report"
	| testCollection |
	testCollection := OrderedCollection new.
	xmlCollection xmlReports do: [ :report | testCollection add: (Test fromXMLReport: report) ].
	^ self sortByClass: testCollection.

]

{ #category : #removing }
TestCatalog class >> removeDuplicates: collections [
	| uniques |
	uniques := OrderedCollection new.
	collections do:  [ :aTest |
		(uniques includes: aTest) ifFalse: [uniques add: aTest]
	].
	^ uniques.
]

{ #category : #sorting }
TestCatalog class >> sortByClass: aTestCollection [
	| aTestDictionnary classNames |
	aTestDictionnary := Dictionary new.
	classNames := (aTestCollection collect: [ :report | report fileName]) asSet.
	classNames do: [ :className | 
		aTestDictionnary
			at: className put: (aTestCollection select: [:test | 
				test fileName = className 
			]).
	].
	^ self new tests: aTestDictionnary.
]

{ #category : #accessing }
TestCatalog >> allLinesOfMethod: aMethod atClass: aClass [
	"For a method provening from a File, this method will return all lines of this method, without duplicates like oposed to collectLinesOfMethod:atClass:"
	| array collection lines |
	array := self collectLinesOfMethod: aMethod atClass: aClass.
	collection := (array collect: [ :l | l number asInteger ]) asSet asOrderedCollection sort.
	lines := OrderedCollection new.
	1 to: (aMethod totalLines) do: [ :i | 
	lines add: (array detect: [:l | 
		(l number asInteger = (collection at: i))
	]).
].
	^ lines.
]

{ #category : #accessing }
TestCatalog >> allMethodsFrom: aFile [
	"Return a collection of Methods which is all the methods from the file put in parameter"
	| array methods meths|
	array := self collectMethodsFrom: aFile.
	meths := (array collect: [ :m | { m name. m desc } ]) asSet asOrderedCollection sorted: [ :a :b | (a at:1) < (b at:1) ].
	"Transcript show: meths;cr."
	methods := OrderedCollection new.
	1 to: (meths size) do: [ :i | 
		methods add: (array detect: [ :m | 
			(m name = ((meths at: i) at: 1)) &
			(m desc = ((meths at: i) at: 2))
		]).
	].
	^ methods.
]

{ #category : #accessing }
TestCatalog >> atFile: aClass [
	"Will return the tests used for this file"
	^ (tests at: aClass).
]

{ #category : #accessing }
TestCatalog >> atFile: aClass atIdx: idx [
	"Will return the test at the index of all the test from the file"
	^ (tests at: aClass) at: idx.
]

{ #category : #accessing }
TestCatalog >> avgCoverageOnMethod: aMethod atClass: aClass [
	"Calculate average coverage for a method from a file"
	| avg collection |
	collection := self findTestByClass: aClass andMethod: aMethod.
	
	avg := ((collection sum: [ :t | (t accessMethod: aMethod atClass: aClass) coverageByLine ]) / collection size) asFloat.
	
	^ avg roundUpTo: 0.1.
]

{ #category : #accessing }
TestCatalog >> collectLinesOfMethod: aMethod atClass: aClass [
	"For a method provening from a File, this method will return all lines of this method"
	| collection lines |
	collection := self findTestByClass: aClass andMethod: aMethod.
	lines := ((collection collect: [ :t | (t accessMethod: aMethod atClass: aClass) lines]) flattened).
	^ lines.
]

{ #category : #accessing }
TestCatalog >> collectMethodsFrom: aFile [
	"Collect all methods used in aFile"
	| methods |
	methods := Set new.
	(tests do: [ :file | 
	file do: [ :t | 
		(t coveredMethods) associationsDo: [ :asso | 
			(asso key = aFile) ifTrue: [ 
				methods add: (asso value) ] ] ] ]).
	^ methods flattened.
]

{ #category : #accessing }
TestCatalog >> files [
	"Will return the keys of our tests attributes, the keys are the files/classes studied"
	^ tests keys.
]

{ #category : #accessing }
TestCatalog >> findTestByClass: aClass andMethod: aMethod [
	"Will return the tests using such method from such class"
	^ ((tests at: aClass) select: [ :t | 
		(t coveredMethods) anySatisfy: [ :method | 
			method anySatisfy: [ :m | 
				((m name = aMethod name) & (m desc = aMethod desc ))
			]
		]		
	]).
]

{ #category : #accessing }
TestCatalog >> getARandomMethodFrom: aFile [
	"Return a random method from the one from the file in parameter"
	|methods|
	methods := self allMethodsFrom: aFile.
	^ methods atRandom.
]

{ #category : #initialization }
TestCatalog >> initialize [
	"Initialize our test catalog with a dictionnary"
	super initialize.
	tests := Dictionary new.
]

{ #category : #'coverage - less tests' }
TestCatalog >> lessTestsOfClass: aClass onMethod: aMethod [
	"Based on the criteria less tests possibles, this method will take the most covered test and compared with the others to only kept the ones with differents lines"
	| colsTest test lines |
	colsTest := self findTestByClass: aClass andMethod: aMethod.
	test := self mostCoveredTest: aClass onMethod: aMethod.
	lines := (test accessMethod: aMethod atClass: aClass) lines.
	colsTest := colsTest reject: [ :t | 
		lines includesAll: (t accessMethod: aMethod atClass: aClass) lines 
	].
	colsTest add: test.
	"Since we reject all test who contains the same, the test used for comparaison also are rejected, and so the need to put him back in the collection"
	^ colsTest.
]

{ #category : #'coverage - most lines covered' }
TestCatalog >> mostCoveredTest: aClass onMethod: aMethod [
	"This method return the test with the highest coverage coming from the file used, for the method searched"
	^ (self testsCoveredAvgFor: aClass onMethod: aMethod) at: 1.
]

{ #category : #printing }
TestCatalog >> printOn: aStream [
	"Define how is presented our class"
	tests associationsDo: [ :asso |
		| key value |
		key := asso key.
		value := asso value.
		aStream
			nextPutAll: key;
			cr.
		value do: [ :val |
			aStream
				nextPutAll: '-';
				tab;
				nextPutAll: val name;
				cr.
			].
		]
]

{ #category : #accessing }
TestCatalog >> selectRandomFile [
	^ tests keys atRandom.
]

{ #category : #'coverage - smallest tests' }
TestCatalog >> smallestTestsOfClass: aClass onMethod: aMethod [
	"This method return the tests having the smallest number of lines"
	| avg colsTest lines |
	lines := self allLinesOfMethod: aMethod atClass: aClass.
	colsTest := self findTestByClass: aClass andMethod: aMethod.
	avg := ((colsTest sum: [ :t | (t accessMethod: aMethod atClass: aClass) lines size ]) / colsTest size) asFloat.
	colsTest := colsTest select: [ :t | 
		(t accessMethod: aMethod atClass: aClass) lines size <= avg
	].
	^ self class removeDuplicates: colsTest.
]

{ #category : #accessing }
TestCatalog >> tests [
	^ tests.
]

{ #category : #accessing }
TestCatalog >> tests: testDict [
	tests := testDict.
]

{ #category : #'coverage - most lines covered' }
TestCatalog >> testsCoveredAvgFor: aClass onMethod: aMethod [
	"This method return the tests with the highest coverage coming from the file used, for the method searched"
	| avg collection |
	collection := self findTestByClass: aClass andMethod: aMethod.
	
	avg := self avgCoverageOnMethod: aMethod atClass: aClass.
	
	collection := collection select: [ :t | (t accessMethod: aMethod atClass: aClass) coverageByLine >= avg].
	
	collection := collection sorted: [ :a :b | (a accessMethod: aMethod atClass: aClass) >= (b accessMethod: aMethod atClass: aClass)].
	
	^ collection.
]
