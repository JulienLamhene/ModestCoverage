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
			package: 'GitBridge';
			package: 'XML-Parser';
			package: 'Modest-Coverage' with: [ spec requires: #('XMLParser' 'GitBridge') ];
			package: 'Modest-Coverage-Tests'.
		spec 
			group: 'default'
			with: #('Modest-Coverage').
	]
]
