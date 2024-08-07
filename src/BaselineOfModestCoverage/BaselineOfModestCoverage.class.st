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
			baseline: 'XMLParser' 
			with: [ spec repository: 'github://pharo-contributions/XML-XMLParser:v3.6.2/src' ].
		spec 
			package: 'Modest-Coverage' with: [ spec requires: #('GitBridge' 'XMLParser') ];
			package: 'Modest-Coverage-Tests' with: [ spec requires: #('Modest-Coverage') ].
		spec 
			group: 'default'
			with: #('Modest-Coverage').
	]
]
