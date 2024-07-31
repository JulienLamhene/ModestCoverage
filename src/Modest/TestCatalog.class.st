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
	#category : #'Modest-Base'
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

{ #category : #private }
TestCatalog >> collectLinesOfMethod: aMethod atClass: aClass [
	"For a method provening from a File, this method will return all lines of this method"
	| collection lines |
	collection := self findTestByClass: aClass andMethod: aMethod.
	lines := ((collection collect: [ :t | (t accessMethod: aMethod atClass: aClass) lines]) flattened).
	^ lines.
]

{ #category : #private }
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

{ #category : #accessing }
TestCatalog >> tests [
	^ tests.
]

{ #category : #accessing }
TestCatalog >> tests: testDict [
	tests := testDict.
]
