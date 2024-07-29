running
testInitialize
	| combis |
	combis := TestCombinationCatalog new.
	self assert: combis combinations size equals: 0.
	self assert: combis lines size equals: 0.