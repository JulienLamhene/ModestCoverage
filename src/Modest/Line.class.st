"
Line is the class who represent a line in file, a line in a Java class

Responsibility : what I do, what I know.
It exists to precise what line in a class and in a method is used or not, precisely by his number of line and the number of instructions it cover

Public API and Key Messages

- class methods :
	- lineFrom:at: -> Create a instance of a Line
	- lineFrom: -> Create an OrderedCollection of Line
Those methods are only called at the same time we create an object Test or Method by the way of XML objects, this way we have the corresponding lines of each instances.

Internal Representation and Key Implementation Points.

    Instance Variables
	coveredInstruction:		<ByteString> -> Represents the quantity of covered instruction in the line
	missedInstruction:		<ByteSring> -> Represents the quantity of missed instruction in the line
	number:		<ByteSring> -> The number of the Line where it appear in the source file
"
Class {
	#name : #Line,
	#superclass : #Object,
	#instVars : [
		'number',
		'missedInstruction',
		'coveredInstruction'
	],
	#category : 'Modest-Base'
}

{ #category : #'instance creation' }
Line class >> lineFrom: aXMLNodeList [
	"Create a collection of lines"
	| lines |
	lines := OrderedCollection new.
	1 to: aXMLNodeList size do: [ :i | 
		lines add: (self lineFrom: aXMLNodeList at: i)
	].
	^ lines.
]

{ #category : #'instance creation' }
Line class >> lineFrom: aXPathNodeSet at: idx [
	"Will create a Line coming from the idx of the XPathNode"
	"XPathNodeSet is of the schema : <line nr='X' mi='X' ci='X' mb='X' cb='X'/>"
	^ self new
			number: ((aXPathNodeSet at: idx) attributeAt: 'nr');
			coveredInstruction: ((aXPathNodeSet at: idx) attributeAt: 'ci');
			missedInstruction: ((aXPathNodeSet at: idx) attributeAt: 'mi').
]

{ #category : #comparing }
Line >> < aLine [
	"Check if a line is inferior to another"
	^ self number asInteger < aLine number asInteger
]

{ #category : #comparing }
Line >> <= aLine [
	"Check if a line is inferior or equal to another"
	^ (self number asInteger <= aLine number asInteger)
]

{ #category : #comparing }
Line >> = aLine [
	"Check if a line is equal to another"
	^ (self number asInteger = aLine number asInteger) "&
	(self coveredInstruction asInteger = aLine coveredInstruction asInteger) &
	(self missedInstruction asInteger = aLine missedInstruction asInteger)."
]

{ #category : #comparing }
Line >> > aLine [
	"Check if a line is superior to another"
	^ self number asInteger > aLine number asInteger
]

{ #category : #comparing }
Line >> >= aLine [
	"Check if a line is superior or equal to another"
	^ self number asInteger >= aLine number asInteger
]

{ #category : #accessing }
Line >> coveredInstruction [
	^ coveredInstruction.
]

{ #category : #accessing }
Line >> coveredInstruction: cover [
	coveredInstruction := cover.
]

{ #category : #initialization }
Line >> initialize [
	super initialize.
	number := 0.
	coveredInstruction := 0.
	missedInstruction := 0.
]

{ #category : #accessing }
Line >> missedInstruction [
	^ missedInstruction.
]

{ #category : #accessing }
Line >> missedInstruction: miss [
	missedInstruction := miss.
]

{ #category : #accessing }
Line >> number [
	^ number.
]

{ #category : #accessing }
Line >> number: num [
	number := num.
]

{ #category : #printing }
Line >> printOn: aStream [
	aStream nextPutAll: number.
]
