"
The representation of a method of a class, a functionnality of the class

A file may have several methods however a test only some of them, so this method here conceive to indicate wich method are used by a test. 
The informations it carry concern, to what line it start, and what lines are used
We identifie a Method by his name and description.

Public API and Key Messages

- 

Internal Representation and Key Implementation Points.

    Instance Variables
	counters:		OrderedCollection of Counter -> A counter are metric data carrying info about precise coverage of a method (like line, instruction, etc.)
	desc:		ByteString -> The description, signature of the method
	lines:		OrderedCollection of Lines -> The lines used by the method
	name:		ByteString -> Its name
	startLine:	ByteString -> The number of line where the method start

"
Class {
	#name : #Method,
	#superclass : #Object,
	#instVars : [
		'name',
		'desc',
		'startLine',
		'counters',
		'lines'
	],
	#category : 'Modest-Base'
}

{ #category : #'instance creation' }
Method class >> loadMethodsFrom: aXMLNodeList [
	"Return a collection of method from the xml list"
	| methods |.
	methods := OrderedCollection new.
	1 to: aXMLNodeList size do: [ :i | 
		methods add: (self methodFrom: (aXMLNodeList at: i))
	].
	^ methods
]

{ #category : #'instance creation' }
Method class >> methodFrom: aXMLElement [
	"Create a Method from a XMLElement"
	"aXMLElement :
	<method name=""setIdentity"" desc=""(I)V"" line=""25"">
		<counter type=""INSTRUCTION"" missed=""4"" covered=""0""/>
		...
	</method>"
	^ self new
		  name: (aXMLElement attributeAt: 'name');
		  desc: (aXMLElement attributeAt: 'desc');
		  startLine: (aXMLElement attributeAt: 'line');
		  loadCounters: aXMLElement.
]

{ #category : #comparing }
Method >> <= aMethod [
	"Check if a method is inferior or equal to another by his coverageByLine"
	^ (self coverageByLine <= aMethod coverageByLine).
]

{ #category : #comparing }
Method >> = aMethod [
	"Check if a method is equal to another by his coverageByLine"
	^ (self name = aMethod name) 
		& (self desc = aMethod desc) 
		& (self lines = aMethod lines).
]

{ #category : #comparing }
Method >> >= aMethod [
	"Check if a method is superior or equal to another by his coverageByLine"
	^ (self coverageByLine >= aMethod coverageByLine).
]

{ #category : #accessing }
Method >> counters [
	^ counters.
]

{ #category : #coverage }
Method >> coverageByLine [
	"Calculate the coverage based on number of line used on total number of lines"
	^ (((self numberLines / self totalLines) * 100) asFloat) roundUpTo: 0.1.
]

{ #category : #accessing }
Method >> desc [
	^ desc
]

{ #category : #accessing }
Method >> desc: description [
	desc := description.
]

{ #category : #initialization }
Method >> initialize [ 
	super initialize.
	name := ''.
	desc := ''.
	counters := OrderedCollection new.
	lines := OrderedCollection new.
]

{ #category : #accessing }
Method >> lines [
	^ lines.
]

{ #category : #accessing }
Method >> lines: covLines [
	lines := covLines.
]

{ #category : #initialization }
Method >> loadCounters: aXMLElement [
	"Load the counters of our method"
	1 to: (aXMLElement nodes size) do: [ :j |
		| counterMet |
		counterMet := CounterMetric new.
		counterMet
			type: ((aXMLElement nodeAt: j) attributeAt: 'type');
			covered: ((aXMLElement nodeAt: j)attributeAt: 'covered');
			missed: ((aXMLElement nodeAt: j) attributeAt: 'missed').
		counters add: counterMet.
	].
]

{ #category : #initialization }
Method >> loadLines: covLines [
	"Load the line used of our method"
	1 to: (self numberLines) do: [ :line |
		lines add: (covLines at: line)
	].
]

{ #category : #accessing }
Method >> name [
	^ name.
]

{ #category : #accessing }
Method >> name: methName [
	name := methName .
]

{ #category : #accessing }
Method >> numberLines [
	"Return the number of lines used by the method"
	|counterLine|
	counterLine := counters detect: [ :counter | counter type = 'LINE' ].
	^ "counterLine missed asInteger +" counterLine covered asInteger.
]

{ #category : #printing }
Method >> printOn: aStream [
	aStream nextPutAll: name;
	cr";
	nextPutAll: '{ 'lines' : [ ';
	cr.
	1 to: (lines size - 1) do: [:i |  
		aStream 
			nextPutAll: (lines at: i) number;
			nextPutAll: ','.
	].
	aStream
		nextPutAll: (lines last) number;
		nextPutAll: ']';
		cr;
		nextPutAll: '}'".
	
]

{ #category : #printing }
Method >> printString [
	| aStream |
	aStream := '' writeStream.
	aStream nextPutAll: name;
	cr;
	nextPutAll: '{ "lines" : ['.
	1 to: (lines size - 1) do: [:i |  
		aStream 
			nextPutAll: (lines at: i) number;
			nextPutAll: ','.
	].
	aStream
		nextPutAll: (lines last) number;
		nextPutAll: ']';
		nextPutAll: '}';
		cr.
	^ aStream contents.
	
]

{ #category : #accessing }
Method >> startLine [
	"^ lines detect: [ :l | l number = startLine ]."
	^ startLine.
]

{ #category : #accessing }
Method >> startLine: start [
	startLine := start.
]

{ #category : #accessing }
Method >> totalLines [
	"Return the original total number of lines of the original method"
	|counterLine|
	counterLine := counters detect: [ :counter | counter type = 'LINE' ].
	^ counterLine missed asInteger + counterLine covered asInteger.
]
