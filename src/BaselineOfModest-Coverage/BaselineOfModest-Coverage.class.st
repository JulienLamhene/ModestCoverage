Class {
	#name : #'BaselineOfModest-Coverage',
	#superclass : #BaselineOf,
	#category : #'BaselineOfModest-Coverage'
}

{ #category : #baselines }
BaselineOfModest-Coverage >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'GitBridge'
			with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ].
		spec 
			package: 'Modest-Coverage' with: [ spec requires: #('XMLParser') ];
			package: 'Modest-Coverage-Tests'.
		spec 
			group: 'default'
			with: #('Modest-Coverage').
	]
]
