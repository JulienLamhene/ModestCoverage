Class {
	#name : #BaselineOfModestCoverage,
	#superclass : #BaselineOf,
	#category : #'BaselineOfModest-Coverage'
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
			with: [ spec repository: 'github.com/pharo-contributions/XML-XMLParser/src' ].
		spec 
			package: 'Modest-Coverage' with: [ spec requires: #('XMLParser' 'GitBridge') ];
			package: 'Modest-Coverage-Tests'.
		spec 
			group: 'default'
			with: #('Modest-Coverage').
	]
]
