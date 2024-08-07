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
			baseline: 'XPath'
			with: [ spec repository: 'github://pharo-contributions/XML-XPath:vx.x.x/src' ].
		spec 
			baseline: 'XMLParser' 
			with: [ spec repository: 'github://pharo-contributions/XML-XMLParser:vx.x.x/src' ].

		spec 
			package: 'Modest-Coverage' with: [ spec requires: #('GitBridge' 'XPath' 'XMLParser')];
			package: 'Modest-Coverage-Tests' with: [ spec requires: #('Modest-Coverage') ].

		spec 
			group: 'default'
			with: #('Modest-Coverage' 'Modest-Coverage-Tests').
	]
]
