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
			package: 'Modest-Coverage' with: [ spec requires: #('XMLParser') ];
			package: 'Modest-Coverage-Tests'.
		spec 
			group: 'default'
			with: #('Modest-Coverage').
	]
]
