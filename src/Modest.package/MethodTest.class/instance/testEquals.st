running
testEquals
	| method otherMethod|
	method := Method new name:'Method'; desc: '()I'.
	otherMethod := Method new name:'Method'; desc: '()I'.
	self assert: method = otherMethod equals: true.
	otherMethod := Method new name:'Method2'; desc: '()I'.
	self assert: method = otherMethod equals: false.