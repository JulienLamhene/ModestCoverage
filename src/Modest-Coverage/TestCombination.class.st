"
The representation of the union of one or more so of Test

An Example of TestCombination :

Method : calcCoffeeIngredient -> The method studied
File : Coffee.java -> The file source of the method
Lines : 6, 10, 11, 12, 14, 15, 16 -> The union of combination
Coverage : 56 -> The number of covered instruction by the combination
Combination : [CoffeeTest.testCalcCoffeeIngredient_2,
CoffeeTest.testCalcCoffeeIngr	edient_3] -> Here we have a combination of two tests for the method calcCoffeeIngredient.

Internal Representation and Key Implementation Points.

    Instance Variables
	combi:		<OrderedCollection> -> The variable who store our combination of Test
	coverage:		<Integer> -> The representation of the covered instruction of the combination
	file:		<ByteString> -> The file who come from the Test
	method:		<Method> -> The method studied for our combination


    Implementation Points
"
Class {
	#name : #TestCombination,
	#superclass : #Object,
	#instVars : [
		'combi',
		'method',
		'file',
		'coverage'
	],
	#category : #'Modest-Coverage-Base'
}

{ #category : #accessing }
TestCombination >> combi [
	^ combi.
]

{ #category : #accessing }
TestCombination >> combi: aCombinaison [
	combi := aCombinaison.
]

{ #category : #accessing }
TestCombination >> coverage [
	^ coverage
]

{ #category : #accessing }
TestCombination >> coverage: cov [
	coverage := cov
]

{ #category : #accessing }
TestCombination >> file [
	"Return the file source of the method studied by the test combi"
	^ file.
]

{ #category : #accessing }
TestCombination >> file: src [
	"Set the file source of the method studied by the test combi"
	file := src.
]

{ #category : #private }
TestCombination >> filterUnion: uniLines [
	"Used in union covered, get rid of duplicated Lines"
	| linesMeth uniCombi |
	uniCombi := OrderedCollection new.
	linesMeth := (uniLines collect: [ :l | l number asInteger ]) asSet asOrderedCollection sort.
	
	1 to: (linesMeth size) do: [ :i | 
		uniCombi add: (uniLines detect: [ :l | 
			(l number asInteger = (linesMeth at: i))])
	].

	^ uniCombi.
]

{ #category : #initialization }
TestCombination >> initialize [
	super initialize.
	combi := OrderedCollection new.
	file := ''.
	method := Method new.
]

{ #category : #accessing }
TestCombination >> method [
	"Return the method studied by the test combi"
	^ method.
]

{ #category : #accessing }
TestCombination >> method: meth [
	"Set the method studied by the test combi"
	method := meth.
]

{ #category : #printing }
TestCombination >> printOn: aStream [
	"super printOn: aStream."
	aStream
		nextPutAll: 'Method : ';
		nextPutAll: method name; cr;
		nextPutAll: 'File : ';
		nextPutAll: file; cr;
		nextPutAll: 'Lines : ';
		nextPutAll: (self unionCovered) asCommaString; cr;
		nextPutAll: 'Coverage : ';
		nextPutAll: coverage asString; cr;
		nextPutAll: 'Combination : [';
		nextPutAll: (combi collect: [:t | t name]) asCommaString;
		nextPutAll: ']';cr.
]

{ #category : #accessing }
TestCombination >> size [
	^ combi size.
]

{ #category : #accessing }
TestCombination >> unionCovered [
	"Establish the union for a combination"
	| uniLines uniCombi |
	uniLines := OrderedCollection new.
	1 to: (self size) do: [ :i | 
		| tmpLines |
		tmpLines := ((self combi at: i) accessMethod: method atClass: file) lines.
		uniLines := (tmpLines union: uniLines) reject: [:elt | elt isNil].
	].
	uniCombi := self filterUnion: uniLines.
	coverage := uniCombi sum: [ :l | l coveredInstruction asInteger ].
	^ uniCombi.
]
