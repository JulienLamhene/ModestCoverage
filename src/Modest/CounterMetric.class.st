"
The representation of metric data coverage of a Method, simply put it gives informations about coverage of instructions, branch, lines, etc.

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	covered:		<Integer> -> a numerical value, pointing how much of this type we have covered
	missed:		<Integer> -> a numerical value, pointing how much of this type we have missed
	type:		<ByteString> -> What kind of info we are processing with (about line, instruction, etc.)
"
Class {
	#name : #CounterMetric,
	#superclass : #Object,
	#instVars : [
		'type',
		'covered',
		'missed'
	],
	#category : 'Modest-Base'
}

{ #category : #accessing }
CounterMetric >> covered [
	^ covered.
]

{ #category : #accessing }
CounterMetric >> covered: aCoveredValue [
	covered := aCoveredValue.
]

{ #category : #accessing }
CounterMetric >> missed [
	^ missed.
]

{ #category : #accessing }
CounterMetric >> missed: aMissedValue [
	missed := aMissedValue.
]

{ #category : #printing }
CounterMetric >> printOn: aStream [
	aStream nextPutAll: 'type : ';
	nextPutAll: type;
	tab;
	nextPutAll: 'missed : ';
	nextPutAll: missed;
	tab;
	nextPutAll: 'covered : ';
	nextPutAll: covered;cr.
]

{ #category : #accessing }
CounterMetric >> type [
	^ type.
]

{ #category : #accessing }
CounterMetric >> type: aType [
	type := aType.
]
