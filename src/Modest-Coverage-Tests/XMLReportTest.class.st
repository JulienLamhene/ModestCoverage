Class {
	#name : #XMLReportTest,
	#superclass : #TestCase,
	#category : #'Modest-Coverage-Tests'
}

{ #category : #initialization }
XMLReportTest class >> loadReport [
	| xmlReport nameF |
	nameF := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := XMLReport loadFile: nameF.
	^ xmlReport.
]

{ #category : #initialization }
XMLReportTest >> loadReport [ 
	^ self class loadReport.
]

{ #category : #running }
XMLReportTest >> testInitialize [
	|xmlReport|
	xmlReport := XMLReport new.
	self assert: xmlReport name equals: ''.
	self assert: xmlReport path equals: ''.
]

{ #category : #running }
XMLReportTest >> testLoadFromOn [
	| xmlReport |
	xmlReport := self loadReport.
	self assert: xmlReport name equals: 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	self assert: xmlReport fileName equals: 'Coffee'.
]
