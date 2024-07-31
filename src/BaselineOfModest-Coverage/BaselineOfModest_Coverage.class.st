Class {
	#name : #'BaselineOfModest_Coverage',
	#superclass : #BaselineOf,
	#category : #'BaselineOfModest-Coverage'
}

{ #category : #baselines }
BaselineOfModest_Coverage >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec package: 'Modest-Coverage'.
		spec group: 'default'
		with: #('Modest-Coverage')
	]
]
