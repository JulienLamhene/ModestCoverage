running
testInitialize
	|xmlReport|
	xmlReport := XMLReport new.
	self assert: xmlReport name equals: ''.
	self assert: xmlReport path equals: ''.