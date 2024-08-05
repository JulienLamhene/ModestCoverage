Class {
	#name : #'BaselineOfModest_Coverage',
	#superclass : #BaselineOf,
	#category : #'BaselineOfModest-Coverage'
}

{ #category : #baselines }
BaselineOfModest_Coverage >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec 
			package: 'Modest-Coverage' with: [ spec requires: #('XMLParser') ];
			package: 'Modest-Coverage-Tests'.
	   spec
 		   	baseline: 'GitBridge'
   		 	with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ].
		spec 
			group: 'default'
			with: #('Modest-Coverage').
	]
]
