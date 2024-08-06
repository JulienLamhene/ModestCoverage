Class {
	#name : #BaselineOfModestCoverage,
	#superclass : #BaselineOf,
	#category : #BaselineOfModestCoverage
}

{ #category : #baselines }
BaselineOfModestCoverage >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'GitBridge'
			with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ].
		spec 
			baseline: 'XML-Parser' 
			with: [ spec repository: 'github://pharo-contributions/XML-XMLParser:v3.6.2/src' ].
		spec 
			package: 'Modest-Coverage' with: [ spec requires: #('GitBridge' 'XML-Parser') ];
			package: 'Modest-Coverage-Tests'.
		spec 
			group: 'default'
			with: #('Modest-Coverage').
	]
]
