Class {
	#name : #'Modest_CoverageBridge',
	#superclass : #GitBridge,
	#instVars : [
		'name',
		'coveredLines',
		'coveredMethods'
	],
	#category : #'Modest-Coverage-Base'
}

{ #category : #'class initialization' }
Modest_CoverageBridge class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]
