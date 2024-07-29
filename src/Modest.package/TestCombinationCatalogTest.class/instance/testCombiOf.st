running
testCombiOf
	| combis combOfOne |
	combis := self initializeEnv.
	combOfOne := combis combinations select: [ :c | c combi size = 1 ].
	self assert: (combis combiOf: 1) equals: combOfOne.