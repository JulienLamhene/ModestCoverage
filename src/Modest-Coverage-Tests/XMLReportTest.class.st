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

{ #category : #running }
XMLReportTest >> testMethodAt [
	|entity file document path xmlReport name|
	path := '/home/julien/Documents/Stage_Inria/CoverageJCC/MyCoverageProject/xmlReport2/'.
	name := 'CoffeeTest.testCalcCoffeeIngredient_2.xml'.
	xmlReport := self loadReport.
	document := XMLDOMParser parse: (((path, name) asFileReference) readStream upToEnd).
	entity := document xpath: '//class'.
	file := document xpath: '//sourcefile'.
	entity := (entity select: [ :node | node nodes isNotEmpty ]) 
		select: [ :node |
			((node elementAt: 'counter') attributeAt: 'covered') asInteger > 0 	].
	file := (file select: [ :node | node nodes isNotEmpty ]) 
		select: [ :node |
			((node elementAt: 'counter') attributeAt: 'covered') asInteger > 0 	].
	self assert: (xmlReport methodAt: 1) asString equals: (entity at: 1) asString.
	self assert: xmlReport file asString equals: file asString.
]
