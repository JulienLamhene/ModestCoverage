tests
testInitialize
	| catalog |
	catalog := TestCatalog new.
	self assert: catalog tests size equals: 0.