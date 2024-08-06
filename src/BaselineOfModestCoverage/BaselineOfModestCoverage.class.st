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
			package: 'Modest-Coverage' with: [ spec requires: #('GitBridge') ];
			package: 'Modest-Coverage-Tests'.
		spec 
			group: 'default'
			with: #('Modest-Coverage').
	]
]
