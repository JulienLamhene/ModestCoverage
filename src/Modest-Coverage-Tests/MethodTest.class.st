Class {
	#name : #MethodTest,
	#superclass : #TestCase,
	#category : #'Modest-Coverage-Tests'
}

{ #category : #running }
MethodTest >> testCoverageByLine [
	| test method otherM|
	test := TestTest loadTest.
	otherM := (test methodsOf: 'Coffee.java') at: 1.
	method := (test methodsOf: 'Coffee.java') at: 2.
	self assert: method coverageByLine equals: 40.0.
	self assert: otherM coverageByLine equals: 100.0.
]

{ #category : #running }
MethodTest >> testEquals [
	| method otherMethod|
	method := Method new name:'Method'; desc: '()I'.
	otherMethod := Method new name:'Method'; desc: '()I'.
	self assert: method = otherMethod equals: true.
	otherMethod := Method new name:'Method2'; desc: '()I'.
	self assert: method = otherMethod equals: false.
]

{ #category : #running }
MethodTest >> testInitialize [
	| m |
	m := Method new.
	self assert: m name equals: ''.
	self assert: m desc equals: ''.
	self assert: m counters size equals: 0.
	self assert: m lines size equals: 0.
]

{ #category : #running }
MethodTest >> testNumberLines [
	| test method |
	test := TestTest loadTest.
	method := (test methodsOf: 'Coffee.java') at: 2.
	self assert: method numberLines equals: 4.
]

{ #category : #running }
MethodTest >> testStartLine [
	| test method |
	test := TestTest loadTest.
	method := (test methodsOf: 'Coffee.java') at: 2.
	self assert: method startLine asInteger equals: 6.
]

{ #category : #running }
MethodTest >> testTotalLines [
	| test method |
	test := TestTest loadTest.
	method := (test methodsOf: 'Coffee.java') at: 2.
	self assert: method totalLines equals: 10.
]
