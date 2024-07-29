running
testUnionCovered
	| testC collection |
	testC := self setUpTest.
	"6 10 11 12 14 15 16"
	collection := testC unionCovered collect: [ :l | l number asInteger ].
	self assert: collection equals: (#(6 10 11 12 14 15 16) asOrderedCollection).