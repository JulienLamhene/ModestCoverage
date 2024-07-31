"
A Test here, is a test method of a test class

A test at least use one method, so it can access informations about the methods and lines it uses, learn about their coverage, compare itself with other test

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	coveredLines:		<Dictionnary> -> A Dictionnary with a file - list of Line relation, for a file given, such lines are used
	coveredMethods:		<Dictionnary> -> A Dictionnary with a file - list of Method relation, for a file given, such methods are used
	name:		<ByteString> -> The name of the test, how it called


    Implementation Points
"
Class {
	#name : #Test,
	#superclass : #Object,
	#instVars : [
		'name',
		'coveredLines',
		'coveredMethods'
	],
	#category : 'Modest-Base'
}

{ #category : #'instance creation' }
Test class >> fromXMLReport: xmlReport [
	"Create a test from a report"

	^ self new
		  name: (xmlReport name copyFrom: 1 to: xmlReport name size - 4);
		  loadCoveredLines: xmlReport file;
		  allMethods: xmlReport entity
]

{ #category : #comparing }
Test >> = aTest [
	"Check if our test is equal to another by the methods and lines covereds"
	^ (self coveredMethods = aTest coveredMethods) 
		& (self coveredLines = aTest coveredLines)
]

{ #category : #accessing }
Test >> accessMethod: aMethod atClass: aFileName [
	"Return the info of the method used by the test"
	^ (self methodsOf: aFileName) detect: [ :method | 
		(method name = aMethod name) & (method desc = aMethod desc)].
]

{ #category : #initialization }
Test >> allMethods: xPathNodeSet [
	"Load the methods used by our test"
	| coveredMeths |
	xPathNodeSet do: [ :node |
		coveredMeths :=((node nodes 
			select: [ :line | line name = 'method']) 
				select: [ :cov | (((cov nodeAt: 1) attributeAt: 'covered') asInteger > 0)]).
		coveredMethods 
			at: (node attributeAt: 'sourcefilename' ) 
			put: (Method loadMethodsFrom: coveredMeths).
	].
 	coveredMethods associationsDo: [ :asso |
		|key value|
		key := asso key.
		value := asso value.
		value do: [ :innerVal | self loadLinesOf: key for: innerVal ].
	].
]

{ #category : #coverage }
Test >> compareWith: aTest onMethod: aMethod [
	"Return the element with a greater Coverage on the method in parameter"
	| m1 m2 result |
	m1 := self accessMethod: aMethod atClass: (self fileName).
	m2 := aTest accessMethod: aMethod atClass: (aTest fileName).
	result := (m1 lines size) >= (m2 lines size).
	(result) ifTrue: [ ^ self ] ifFalse: [ ^ aTest ].
]

{ #category : #accessing }
Test >> coveredLines [
	^ coveredLines.
]

{ #category : #accessing }
Test >> coveredLines: covLines [
	coveredLines := covLines.
]

{ #category : #accessing }
Test >> coveredMethods [
	^ coveredMethods.
]

{ #category : #accessing }
Test >> coveredMethods: coveredMeths [
	coveredMethods := coveredMeths.
]

{ #category : #accessing }
Test >> fileName [
	"Return the name suffixed by '.java'"
	| idx |
	idx := (self name includesAny: '.')
		       ifTrue: [ (name asText findString: '.' startingAt: 1) - 5 ]
		       ifFalse: [ (name asText findString: '_' startingAt: 1) - 1 ].
	^ (name copyFrom: 1 to: idx) , '.java'
]

{ #category : #initialization }
Test >> initialize [
	super initialize.
	coveredLines := Dictionary new.
	coveredMethods := Dictionary new.
	name := ''.
]

{ #category : #accessing }
Test >> linesOf: aFile [
	"An shortcut for accessing lines from a certain file"
	^ coveredLines at: aFile.
]

{ #category : #initialization }
Test >> loadCoveredLines: aXPathNodeSet [
	"From a NodeSet of line, it store the data in"
	| covLines |
	aXPathNodeSet do: [ :node |
		covLines :=((node nodes 
			select: [ :line | line name = 'line']) 
				select: [ :covLine |	((covLine attributeAt: 'ci') asInteger > 0)]).
		coveredLines 
			at: (node attributeAt: 'name' ) 
			put: (Line lineFrom: covLines).
	].
]

{ #category : #initialization }
Test >> loadLinesOf: aClass for: aMethod [
	"For a certain method and file, will fill the test with the correct lines"
	| lines start idx end|
	
	lines := coveredLines at: aClass.
	start := lines detect: [ :line | line number = aMethod startLine ].
	
	idx := lines indexOf: start.
	end := (idx + aMethod numberLines) - 1.
	
	idx to: end do: [ :i | aMethod lines add: (lines at: i). ].
]

{ #category : #accessing }
Test >> methodsOf: aFile [
	"An shortcut for accessing methods from a certain file"
	^ coveredMethods at: aFile.
]

{ #category : #accessing }
Test >> mostTestedFile [
	"Among the file used by our test, will return the one most used by the size of number of methods used"
	|fileTested currentSize largestSize|
	largestSize := 0.
	(self coveredMethods) keysDo: [:key | 
		currentSize := ((self coveredMethods) at: key) size.
		(currentSize > largestSize) ifTrue: [
			fileTested := key.
			largestSize := currentSize.
		]].
	^ fileTested.
]

{ #category : #accessing }
Test >> name [
	^ name.
]

{ #category : #accessing }
Test >> name: nameTest [
	name := nameTest.
]

{ #category : #printing }
Test >> printOn: aStream [
	"super printOn: aStream."
	aStream
		nextPutAll: name;
		cr;
		nextPutAll: '{ "methods" : [ ';
		cr.
	coveredMethods associationsDo: [ :asso |	
			|key meth|
			key := asso key.
			meth := asso value.
			aStream 
				nextPutAll: '-';
				tab;
				nextPutAll: key; 
				nextPutAll: ' : '.
			meth do: [ :method | 
				aStream 
					nextPutAll: method name; 
					nextPutAll: ', '
			].
			aStream cr.
		].
	aStream 
		nextPutAll: ']';
		cr;
		nextPutAll: '[ "lines" : ';
		cr.
	coveredLines associationsDo: [ :asso |	
			|key meth|
			key := asso key.
			meth := asso value.
			aStream 
				nextPutAll: '-';
				tab;
				nextPutAll: key; 
				nextPutAll: ' : '.
			meth do: [ :line | 
				aStream 
					nextPutAll: line number; 
					nextPutAll: ', '
			].
			aStream cr.
		].
		aStream nextPutAll: ']}'.
]
