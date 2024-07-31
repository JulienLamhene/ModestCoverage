Class {
	#name : #LineTest,
	#superclass : #TestCase,
	#category : 'Modest-Test'
}

{ #category : #running }
LineTest >> testEqual [
	| line line2 |
	line := Line new number: 5.
	line2 := Line new number: 5.
	self assert: (line number) = (line2 number) equals: true.
	self assert: (line missedInstruction) = (line2 missedInstruction) equals: true.
	self assert: (line coveredInstruction) = (line2 coveredInstruction) equals: true.
	"And so :"
	self assert: line = line2 equals: true.
]

{ #category : #running }
LineTest >> testGreaterThan [
	| line line2 |
	line := Line new number: 5.
	line2 := Line new number: 10.
	self assert: line > line2 equals: false.
	self assert: line2 > line equals: true.
]

{ #category : #running }
LineTest >> testGreaterThanOrEqual [
	| line line2 |
	line := Line new number: 5.
	line2 := Line new number: 5.
	self assert: line >= line2 equals: true.
]

{ #category : #running }
LineTest >> testInitialize [
	| line |
	line := Line new.
	self assert: line number equals: 0.
	self assert: line missedInstruction equals: 0.
	self assert: line coveredInstruction equals: 0.
]

{ #category : #running }
LineTest >> testLessThan [
	| line line2 |
	line := Line new number: 5.
	line2 := Line new number: 10.
	self assert: line < line2 equals: true.
	self assert: line2 < line equals: false.
]

{ #category : #running }
LineTest >> testLessThanOrEqual [
	| line line2 |
	line := Line new number: 5.
	line2 := Line new number: 5.
	self assert: line <= line2 equals: true.
]
